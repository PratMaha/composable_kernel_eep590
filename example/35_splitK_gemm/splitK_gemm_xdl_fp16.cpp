// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2023, Advanced Micro Devices, Inc. All rights reserved.

#include <iostream>
#include <numeric>
#include <initializer_list>
#include <cstdlib>
#include <cmath> // for std::abs

#include "ck/ck.hpp"
#include "ck/tensor_operation/gpu/device/gemm_specialization.hpp"
#include "ck/tensor_operation/gpu/device/impl/device_gemm_xdl_splitk_c_shuffle.hpp"
#include "ck/tensor_operation/gpu/element/element_wise_operation.hpp"

#include "ck/library/utility/check_err.hpp"
#include "ck/library/utility/device_memory.hpp"
#include "ck/library/utility/host_tensor.hpp"
#include "ck/library/utility/host_tensor_generator.hpp"
#include "ck/library/reference_tensor_operation/cpu/reference_gemm.hpp"
#include "ck/library/utility/literals.hpp"

template <ck::index_t... Is>
using S = ck::Sequence<Is...>;

using F16 = ck::half_t;
using F32 = float;

using Row = ck::tensor_layout::gemm::RowMajor;
using Col = ck::tensor_layout::gemm::ColumnMajor;

using PassThrough = ck::tensor_operation::element_wise::PassThrough;

using ADataType = F16;
using BDataType = F16;
using AccDataType = F32;
using CDataType = F16;

using ALayout = Row;
using BLayout = Col;
using CLayout = Row;

using AElementOp = PassThrough;
using BElementOp = PassThrough;
using CElementOp = PassThrough;

static constexpr auto GemmDefault = ck::tensor_operation::device::GemmSpecialization::KPadding;

using DeviceGemmInstance = ck::tensor_operation::device::DeviceGemmXdlSplitKCShuffle
    // clang-format off
    < ADataType, BDataType, CDataType, AccDataType, ALayout, BLayout, CLayout, 
      AElementOp, BElementOp, CElementOp, GemmDefault, 256, 256, 128, 4, 8, 32, 32, 4, 2, 
      S<1, 4, 64, 1>, S<0, 2, 1, 3>, S<0, 2, 1, 3>, 3, 8, 8, true, 
      S<1, 4, 64, 1>, S<0, 1, 3, 2>, S<0, 1, 3, 2>, 3, 8, 8, true, 1, 1, S<1, 32, 1, 8>, 8>;
// clang-format on

struct ProblemSize final {
    ck::index_t M = 3840;
    ck::index_t N = 4096;
    ck::index_t K = 4096;
    ck::index_t stride_A = K;
    ck::index_t stride_B = K;
    ck::index_t stride_C = N;
    ck::index_t k_batch = 4;
};

struct ExecutionConfig final {
    bool do_verification = true;
    int init_method = 1;
    bool time_kernel = false;
};

bool run_splitK_gemm(const ProblemSize& problem_size, const ExecutionConfig& config) {
    using namespace ck::literals;

#if defined(BUILD_INT4_EXAMPLE) && defined(CK_EXPERIMENTAL_BIT_INT_EXTENSION_INT4)
    static_assert(sizeof(ck::int4_t) == sizeof(int8_t));
    static_assert(sizeof(ADataType) == sizeof(KernelADataType));
    static_assert(sizeof(BDataType) == sizeof(KernelBDataType));
#endif

    const auto& [M, N, K, StrideA, StrideB, StrideC, KBatch] = problem_size;

    auto create_host_tensor_descriptor = [](std::size_t row, std::size_t col, std::size_t stride, auto layout) {
        using namespace ck::literals;

        if (std::is_same<decltype(layout), ck::tensor_layout::gemm::RowMajor>::value) {
            return HostTensorDescriptor({row, col}, {stride, 1_uz});
        } else {
            return HostTensorDescriptor({row, col}, {1_uz, stride});
        }
    };

    Tensor<ADataType> a_m_k(create_host_tensor_descriptor(M, K, StrideA, ALayout{}));
    Tensor<BDataType> b_k_n(create_host_tensor_descriptor(K, N, StrideB, BLayout{}));
    Tensor<CDataType> c_m_n_device_result(create_host_tensor_descriptor(M, N, StrideC, CLayout{}));

    std::cout << "a_m_k: " << a_m_k.mDesc << std::endl;
    std::cout << "b_k_n: " << b_k_n.mDesc << std::endl;
    std::cout << "c_m_n: " << c_m_n_device_result.mDesc << std::endl;

    switch (config.init_method) {
        case 0:
            break;
        case 1:
            a_m_k.GenerateTensorValue(GeneratorTensor_2<ADataType>{-5, 5});
            b_k_n.GenerateTensorValue(GeneratorTensor_2<BDataType>{-5, 5});
            break;
        case 2:
            a_m_k.GenerateTensorValue(GeneratorTensor_3<ADataType>{0.0, 1.0});
            b_k_n.GenerateTensorValue(GeneratorTensor_3<BDataType>{-0.5, 0.5});
            break;
        default:
            a_m_k.GenerateTensorValue(GeneratorTensor_Sequential<0>{});
            b_k_n.GenerateTensorValue(GeneratorTensor_Sequential<1>{});
    }

    // Use pinned memory
    void* pinned_memory_a;
    void* pinned_memory_b;
    void* pinned_memory_c;

    hipError_t err;

    err = hipHostMalloc(&pinned_memory_a, sizeof(ADataType) * a_m_k.mDesc.GetElementSpaceSize(), hipHostMallocDefault);
    if (err != hipSuccess) {
        std::cerr << "hipHostMalloc failed for pinned_memory_a" << std::endl;
        return false;
    }

    err = hipHostMalloc(&pinned_memory_b, sizeof(BDataType) * b_k_n.mDesc.GetElementSpaceSize(), hipHostMallocDefault);
    if (err != hipSuccess) {
        std::cerr << "hipHostMalloc failed for pinned_memory_b" << std::endl;
        err = hipHostFree(pinned_memory_a);
        return false;
    }

    err = hipHostMalloc(&pinned_memory_c, sizeof(CDataType) * c_m_n_device_result.mDesc.GetElementSpaceSize(), hipHostMallocDefault);
    if (err != hipSuccess) {
        std::cerr << "hipHostMalloc failed for pinned_memory_c" << std::endl;
        err = hipHostFree(pinned_memory_a);
        err = hipHostFree(pinned_memory_b);
        return false;
    }

    std::memcpy(pinned_memory_a, a_m_k.mData.data(), sizeof(ADataType) * a_m_k.mDesc.GetElementSpaceSize());
    std::memcpy(pinned_memory_b, b_k_n.mData.data(), sizeof(BDataType) * b_k_n.mDesc.GetElementSpaceSize());
    std::memcpy(pinned_memory_c, c_m_n_device_result.mData.data(), sizeof(CDataType) * c_m_n_device_result.mDesc.GetElementSpaceSize());

    DeviceMem a_m_k_device_buf(sizeof(ADataType) * a_m_k.mDesc.GetElementSpaceSize());
    DeviceMem b_k_n_device_buf(sizeof(BDataType) * b_k_n.mDesc.GetElementSpaceSize());
    DeviceMem c_m_n_device_buf(sizeof(CDataType) * c_m_n_device_result.mDesc.GetElementSpaceSize());

#ifdef BUILD_INT4_EXAMPLE
    const Tensor<KernelADataType> a_m_k_converted(a_m_k);
    const Tensor<KernelBDataType> b_k_n_converted(b_k_n);

    a_m_k_device_buf.ToDevice(a_m_k_converted.mData.data());
    b_k_n_device_buf.ToDevice(b_k_n_converted.mData.data());
#else
    a_m_k_device_buf.ToDevice(pinned_memory_a);
    b_k_n_device_buf.ToDevice(pinned_memory_b);
#endif
    c_m_n_device_buf.SetZero();

    auto a_element_op = AElementOp{};
    auto b_element_op = BElementOp{};
    auto c_element_op = CElementOp{};

    auto gemm = DeviceGemmInstance{};
    auto invoker = gemm.MakeInvoker();
    auto argument = gemm.MakeArgument(
#ifdef BUILD_INT4_EXAMPLE
        static_cast<KernelADataType*>(a_m_k_device_buf.GetDeviceBuffer()),
        static_cast<KernelBDataType*>(b_k_n_device_buf.GetDeviceBuffer()),
#else
        static_cast<ADataType*>(a_m_k_device_buf.GetDeviceBuffer()),
        static_cast<BDataType*>(b_k_n_device_buf.GetDeviceBuffer()),
#endif
        static_cast<CDataType*>(c_m_n_device_buf.GetDeviceBuffer()),
        M, N, K, StrideA, StrideB, StrideC, a_element_op, b_element_op, c_element_op, KBatch);

    if (!gemm.IsSupportedArgument(argument)) {
        std::cout << gemm.GetTypeString() << " does not support this problem" << std::endl;
        err = hipHostFree(pinned_memory_a);
        err = hipHostFree(pinned_memory_b);
        err = hipHostFree(pinned_memory_c);
        return false;
    }

    invoker.Run(argument, StreamConfig{nullptr, false});
    bool pass = true;

    if (config.do_verification) {
        c_m_n_device_buf.FromDevice(c_m_n_device_result.mData.data());
        using ReferenceGemmInstance = ck::tensor_operation::host::ReferenceGemm<ADataType, BDataType, CDataType, AccDataType, AElementOp, BElementOp, CElementOp>;

        auto ref_gemm = ReferenceGemmInstance{};
        auto ref_invoker = ref_gemm.MakeInvoker();

        Tensor<CDataType> c_m_n_host_result(create_host_tensor_descriptor(M, N, StrideC, CLayout{}));

        auto ref_argument = ref_gemm.MakeArgument(a_m_k, b_k_n, c_m_n_host_result, a_element_op, b_element_op, c_element_op);

        ref_invoker.Run(ref_argument);

        if (std::is_same<CDataType, ck::half_t>::value) {
            pass &= ck::utils::check_err(c_m_n_device_result, c_m_n_host_result, "fp16 incorrect result", 3e-3, 1e-3);
        } else {
            pass &= ck::utils::check_err(c_m_n_device_result, c_m_n_host_result);
        }
    }

    if (config.time_kernel) {
        float ave_time = invoker.Run(argument, StreamConfig{nullptr, config.time_kernel, 1});

        std::size_t flop = std::size_t(2) * M * N * K;
        std::size_t num_btype = sizeof(ADataType) * M * K + sizeof(BDataType) * K * N + sizeof(CDataType) * M * N;

        float tflops = static_cast<float>(flop) / 1.E9 / ave_time;
        float gb_per_sec = num_btype / 1.E6 / ave_time;
        std::cout << "Perf: " << ave_time << " ms, " << tflops << " TFlops, " << gb_per_sec << " GB/s, " << gemm.GetTypeString() << std::endl;
    }

    err = hipHostFree(pinned_memory_a);
    err = hipHostFree(pinned_memory_b);
    err = hipHostFree(pinned_memory_c);

    return pass;
}

bool run_splitK_gemm_example(int argc, char* argv[]) {
    ProblemSize problem_size;
    ExecutionConfig config;

    if (argc == 1) {
        // use default case
    } else if (argc == 5) {
        config.do_verification = std::stoi(argv[1]);
        config.init_method = std::stoi(argv[2]);
        config.time_kernel = std::stoi(argv[3]);
        problem_size.k_batch = std::stoi(argv[4]);
    } else if (argc == 11) {
        config.do_verification = std::stoi(argv[1]);
        config.init_method = std::stoi(argv[2]);
        config.time_kernel = std::stoi(argv[3]);
        problem_size.k_batch = std::stoi(argv[4]);

        problem_size.M = std::stoi(argv[5]);
        problem_size.N = std::stoi(argv[6]);
        problem_size.K = std::stoi(argv[7]);

        problem_size.stride_A = std::stoi(argv[8]);
        problem_size.stride_B = std::stoi(argv[9]);
        problem_size.stride_C = std::stoi(argv[10]);
    } else {
        std::cerr << "Invalid number of arguments\n";
        return false;
    }

    return run_splitK_gemm(problem_size, config);
}

int main(int argc, char* argv[]) {
    return !run_splitK_gemm_example(argc, argv);
}
