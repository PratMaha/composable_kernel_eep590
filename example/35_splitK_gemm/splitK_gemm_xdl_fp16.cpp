// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2023, Advanced Micro Devices, Inc. All rights reserved.

//This is based on splitK_gemm_xdl_fp16
#include <iostream>
#include <numeric>
#include <initializer_list>
#include <cstdlib>

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

#include <fstream>

template <ck::index_t... Is>
using S = ck::Sequence<Is...>;

using F16 = ck::half_t;
using F32 = float;

using Row = ck::tensor_layout::gemm::RowMajor;
using Col = ck::tensor_layout::gemm::ColumnMajor;

using PassThrough = ck::tensor_operation::element_wise::PassThrough;

using ADataType   = F16;
using BDataType   = F16;
using AccDataType = F32;
using CDataType   = F16;

using ALayout = Row;
using BLayout = Col;
using CLayout = Row;

using AElementOp = PassThrough;
using BElementOp = PassThrough;
using CElementOp = PassThrough;

static constexpr auto GemmDefault = ck::tensor_operation::device::GemmSpecialization::KPadding;

using DeviceGemmInstance = ck::tensor_operation::device::DeviceGemmXdlSplitKCShuffle
    // clang-format off
//######|     AData|     BData|     CData|     AccData| ALayout| BLayout| CLayout|           A|           B|           C|           GEMM| Block|  MPer|  NPer|  KPer|  K1| MPer| NPer| MXdl| NXdl|  ABlockTransfer| ABlockTransfer| ABlockTransfer| ABlockTransfer| ABlockTransfer| ABlockTransfer| ABlockLds|  BBlockTransfer| BBlockTransfer| BBlockTransfer| BlockTransfer| BBlockTransfer| BBlockTransfer| BBlockLds|    CShuffle|    CShuffle|     CBlockTransferClusterLengths|  CBlockTransfer|
//######|      Type|      Type|      Type|        Type|        |        |        | Elementwise| Elementwise| Elementwise| Spacialization|  Size| Block| Block| Block|    |  XDL|  XDL|  Per|  Per|   ThreadCluster|  ThreadCluster| SrcAccessOrder|   SrcVectorDim|      SrcScalar|      DstScalar| AddExtraM|   ThreadCluster|  ThreadCluster| SrcAccessOrder|  SrcVectorDim|      SrcScalar|      DstScalar| AddExtraN| MXdlPerWave| NXdlPerWave| _MBlock_MXdlPerWave_MWaveMPerXdl| ScalarPerVector|
//######|          |          |          |            |        |        |        |   Operation|   Operation|   Operation|               |      |      |      |      |    |     |     | Wave| Wave| Lengths_K0_M_K1|   ArrangeOrder|               |               |      PerVector|   PerVector_K1|          | Lengths_K0_N_K1|   ArrangeOrder|               |              |      PerVector|   PerVector_K1|          |  PerShuffle|  PerShuffle| _NBlock_NXdlPerWave_NWaveNPerXdl|   _NWaveNPerXdl|
//######|          |          |          |            |        |        |        |            |            |            |               |      |      |      |      |    |     |     |     |     |                |               |               |               |               |               |          |                |               |               |              |               |               |          |            |            |                                 |                |
        < ADataType, BDataType, CDataType, AccDataType, ALayout, BLayout, CLayout,  AElementOp,  BElementOp,  CElementOp,    GemmDefault,   256,   128,   64,     8,   8,   4,   2,    2,    1,  S<1, 4, 64, 1>,  S<0, 2, 1, 3>,  S<0, 2, 1, 3>,              3,              4,              4,      true,  S<1, 4, 64, 1>,  S<0, 1, 3, 2>,  S<0, 1, 3, 2>,             3,              8,              8,      true,           1,           1,                   S<1, 32, 1, 8>,               8>;
// clang-format on

#include "run_splitK_gemm_example.inc"


int main(int argc, char* argv[]) 
{ 
    
    // Define different sets of arguments
    if(argc==1)
    {
        char* t_argv[1];
        t_argv[0] =argv[0];
/*
    std::vector<std::vector<std::string>> argument_sets = {
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "2", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "3", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "4", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "5", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "6", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "7", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "8", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "9", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "10", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "11", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "12", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "13", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "14", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "15", "3840", "4096", "4096", "4096", "4096", "4096"},
        {"program_name", "1", "2", "1", "16", "3840", "4096", "4096", "4096", "4096", "4096"}
    };
*/
/*
    std::vector<std::vector<std::string>> argument_sets = {
        {"program_name", "1", "2", "1", "4", "4096", "2048", "1024", "4096", "2048", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "2048", "1024", "4096", "2048", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "2048", "1024", "4096", "2048", "4096"},

        {"program_name", "1", "2", "1", "4", "4096", "2048", "1024", "4096", "1024", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "2048", "1024", "4096", "4096", "2048"},

        {"program_name", "1", "2", "1", "4", "4096", "2048", "1024", "1024", "2048", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "2048", "1024", "2048", "2048", "2048"}
    };*/
    /*
    std::vector<std::vector<std::string>> argument_sets = {
        //
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "1024", "1024"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "1024", "1024"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "1024", "1024"},

        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "2048", "1024"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "2048", "1024"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "2048", "1024"},

        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "4096", "1024"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "4096", "1024"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "4096", "1024"},
        //
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "1024", "2048"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "1024", "2048"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "1024", "2048"},

        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "2048", "2048"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "2048", "2048"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "2048", "2048"},

        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "4096", "2048"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "4096", "2048"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "4096", "2048"},
        //
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "1024", "4096"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "1024", "4096"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "1024", "4096"},

        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "2048", "4096"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "2048", "4096"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "2048", "4096"},

        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "1024", "4096", "4096"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "2048", "4096", "4096"},
        {"program_name", "1", "2", "1", "1", "3840", "4096", "4096", "4096", "4096", "4096"},
    };
*/
/*
    std::vector<std::vector<std::string>> argument_sets = {
        //
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "1024", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "1024", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "1024", "1024"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "2048", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "2048", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "2048", "1024"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "4096", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "4096", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "4096", "1024"},
        //
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "1024", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "1024", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "1024", "2048"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "2048", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "2048", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "2048", "2048"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "4096", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "4096", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "4096", "2048"},
        //
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "1024", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "1024", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "1024", "4096"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "2048", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "2048", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "2048", "4096"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "1024", "4096", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "2048", "4096", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "4096", "4096", "4096"},
    };
    */

    std::vector<std::vector<std::string>> argument_sets = {
        //
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8","1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "1024"},
        //
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "2048"},
        //
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},

        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},
        {"program_name", "1", "2", "1", "4", "4096", "4096", "4096", "8", "8", "4096"},
    };
    for (size_t i = 0; i < argument_sets.size(); ++i)
    {
        std::vector<char*> cstr_args;
        for (auto& arg : argument_sets[i])
        {
            cstr_args.push_back(&arg[0]);
        }

        run_splitK_gemm_example(static_cast<int>(cstr_args.size()), cstr_args.data());

    }
    }

    return 0;  
}
