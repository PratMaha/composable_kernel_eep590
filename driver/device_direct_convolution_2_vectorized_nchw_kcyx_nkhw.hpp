#pragma once
#include <unistd.h>
#include "device.hpp"
#include "gridwise_direct_convolution_2_vectorized_nchw_kcyx_nkhw.hip.hpp"

template <class TInWei, class TOut, class InDesc, class WeiDesc, class OutDesc>
void device_direct_convolution_2_vectorized_nchw_kcyx_nkhw(InDesc,
                                                           const Tensor<TInWei>& in_nchw,
                                                           WeiDesc,
                                                           const Tensor<TInWei>& wei_kcyx,
                                                           OutDesc,
                                                           Tensor<TOut>& out_nkhw,
                                                           unsigned nrepeat)
{
    // this suppose in / wei data type is int8x4
    constexpr unsigned NVector = 4;
    using accum_t              = int32_t;
    using vector_t             = vector_type<TInWei, NVector>;
    using vector_mem_t         = typename vector_t::MemoryType;

    constexpr auto I0 = Number<0>{};
    constexpr auto I1 = Number<1>{};
    constexpr auto I2 = Number<2>{};
    constexpr auto I3 = Number<3>{};

    constexpr auto in_nchw_desc  = InDesc{};
    constexpr auto wei_kcyx_desc = WeiDesc{};
    constexpr auto out_nkhw_desc = OutDesc{};

    constexpr unsigned Hi = in_nchw_desc.GetLength(I2);
    constexpr unsigned Wi = in_nchw_desc.GetLength(I3);

    constexpr unsigned N  = out_nkhw_desc.GetLength(I0);
    constexpr unsigned Ho = out_nkhw_desc.GetLength(I2);
    constexpr unsigned Wo = out_nkhw_desc.GetLength(I3);

    constexpr unsigned K = wei_kcyx_desc.GetLength(I0);
    constexpr unsigned C = wei_kcyx_desc.GetLength(I1);
    constexpr unsigned Y = wei_kcyx_desc.GetLength(I2);
    constexpr unsigned X = wei_kcyx_desc.GetLength(I3);

    // vectorized input
    auto in_nchw_vec_desc = make_ConstantTensorDescriptor(Sequence<N, C / NVector, Hi, Wi>{});
    ostream_ConstantTensorDescriptor(in_nchw_vec_desc, std::cout << "in_nchw_vec_desc: ");

    Tensor<vector_mem_t> in_nchw_vec(make_TensorDescriptor(in_nchw_vec_desc));

    auto f_vectorized_nchw = [&](auto n, auto c, auto h, auto w) {
#if 0
        in_nchw_vec(n, c, h, w) = in_nchw(n, c, h, w);
#elif 0
        in_nchw_vec(n, c, h, w) =
            vector_t::Pack(in_nchw(n, 2 * c, h, w), in_nchw(n, 2 * c + 1, h, w));
#elif 1
        in_nchw_vec(n, c, h, w) = vector_t::Pack(in_nchw(n, 4 * c, h, w),
                                                 in_nchw(n, 4 * c + 1, h, w),
                                                 in_nchw(n, 4 * c + 2, h, w),
                                                 in_nchw(n, 4 * c + 3, h, w));
#endif
    };

    make_ParallelTensorFunctor(f_vectorized_nchw, N, C / NVector, Hi, Wi)(
        std::thread::hardware_concurrency());

    // vectorize weight
    auto wei_kcyx_vec_desc = make_ConstantTensorDescriptor(Sequence<K, C / NVector, Y, X>{});
    ostream_ConstantTensorDescriptor(wei_kcyx_vec_desc, std::cout << "wei_kcyx_vec_desc: ");

    Tensor<vector_mem_t> wei_kcyx_vec(make_TensorDescriptor(wei_kcyx_vec_desc));

    auto f_vectorized_kcyx = [&](auto k, auto c, auto y, auto x) {
#if 0
        wei_kcyx_vec(k, c, y, x) = wei_kcyx(k, c, y, x);
#elif 0
        wei_kcyx_vec(k, c, y, x) =
            vector_t::Pack(wei_kcyx(k, 2 * c, y, x), wei_kcyx(k, 2 * c + 1, y, x));
#elif 1
        wei_kcyx_vec(k, c, y, x) = vector_t::Pack(wei_kcyx(k, 4 * c, y, x),
                                                  wei_kcyx(k, 4 * c + 1, y, x),
                                                  wei_kcyx(k, 4 * c + 2, y, x),
                                                  wei_kcyx(k, 4 * c + 3, y, x));
#endif
    };

    make_ParallelTensorFunctor(f_vectorized_kcyx, K, C / NVector, Y, X)(
        std::thread::hardware_concurrency());

    //
    DeviceMem in_nchw_vec_device_buf(sizeof(vector_mem_t) * in_nchw_vec.mDesc.GetElementSpace());
    DeviceMem wei_kcyx_vec_device_buf(sizeof(vector_mem_t) * wei_kcyx_vec.mDesc.GetElementSpace());
    DeviceMem out_nkhw_device_buf(sizeof(TOut) * out_nkhw.mDesc.GetElementSpace());

    in_nchw_vec_device_buf.ToDevice(in_nchw_vec.mData.data());
    wei_kcyx_vec_device_buf.ToDevice(wei_kcyx_vec.mData.data());
    out_nkhw_device_buf.ToDevice(out_nkhw.mData.data());

#if 0
    // 3x3, 34x34, 128 thread, fp32, vector = 1
    constexpr unsigned NPerBlock  = 2;
    constexpr unsigned KPerBlock  = 32;
    constexpr unsigned CPerBlock  = 4;
    constexpr unsigned HoPerBlock = 2;
    constexpr unsigned WoPerBlock = 32;

    constexpr unsigned NPerThread  = 2;
    constexpr unsigned KPerThread  = 4;
    constexpr unsigned CPerThread  = 2;
    constexpr unsigned HoPerThread = 2;
    constexpr unsigned WoPerThread = 2;

    constexpr unsigned InBlockCopyDataPerRead  = 2;
    constexpr unsigned WeiBlockCopyDataPerRead = 2;

    constexpr unsigned BlockSize = 128;
#elif 0
    // 3x3, 34x34, 128 thread, fp32, vector = 2
    constexpr unsigned NPerBlock  = 2;
    constexpr unsigned KPerBlock  = 32;
    constexpr unsigned CPerBlock  = 2;
    constexpr unsigned HoPerBlock = 2;
    constexpr unsigned WoPerBlock = 32;

    constexpr unsigned NPerThread  = 2;
    constexpr unsigned KPerThread  = 4;
    constexpr unsigned CPerThread  = 1;
    constexpr unsigned HoPerThread = 2;
    constexpr unsigned WoPerThread = 2;

    constexpr unsigned InBlockCopyDataPerRead  = 2;
    constexpr unsigned WeiBlockCopyDataPerRead = 2;

    constexpr unsigned BlockSize = 128;
#elif 0
    // 3x3, 34x34, 128 thread, int8, vector = 4
    constexpr unsigned NPerBlock  = 2;
    constexpr unsigned KPerBlock  = 32;
    constexpr unsigned CPerBlock  = 8;
    constexpr unsigned HoPerBlock = 4;
    constexpr unsigned WoPerBlock = 32;

    constexpr unsigned NPerThread  = 1;
    constexpr unsigned KPerThread  = 8;
    constexpr unsigned CPerThread  = 2;
    constexpr unsigned HoPerThread = 4;
    constexpr unsigned WoPerThread = 2;

    constexpr unsigned InBlockCopyDataPerRead  = 2;
    constexpr unsigned WeiBlockCopyDataPerRead = 2;

    constexpr unsigned BlockSize = 128;
#elif 1
    // 1x1, 32x32, 128 thread, int8, vector = 4
    constexpr unsigned NPerBlock  = 1;
    constexpr unsigned KPerBlock  = 64;
    constexpr unsigned CPerBlock  = 16;
    constexpr unsigned HoPerBlock = 4;
    constexpr unsigned WoPerBlock = 32;

    constexpr unsigned NPerThread  = 1;
    constexpr unsigned KPerThread  = 8;
    constexpr unsigned CPerThread  = 2;
    constexpr unsigned HoPerThread = 4;
    constexpr unsigned WoPerThread = 2;

    constexpr unsigned InBlockCopyDataPerRead  = 2;
    constexpr unsigned WeiBlockCopyDataPerRead = 2;

    constexpr unsigned BlockSize = 128;
#endif

    constexpr unsigned GridSize =
        (N / NPerBlock) * (K / KPerBlock) * (Ho / HoPerBlock) * (Wo / WoPerBlock);

    printf("%s: BlockSize %u, GridSize %u \n", __func__, BlockSize, GridSize);

    for(unsigned i = 0; i < nrepeat; ++i)
    {
        float time = launch_kernel(
            gridwise_direct_convolution_2_vectorized_nchw_kcyx_nkhw<TInWei,
                                                                    TOut,
                                                                    accum_t,
                                                                    decltype(in_nchw_vec_desc),
                                                                    decltype(wei_kcyx_vec_desc),
                                                                    decltype(out_nkhw_desc),
                                                                    NVector,
                                                                    NPerBlock,
                                                                    KPerBlock,
                                                                    CPerBlock,
                                                                    HoPerBlock,
                                                                    WoPerBlock,
                                                                    NPerThread,
                                                                    KPerThread,
                                                                    CPerThread,
                                                                    HoPerThread,
                                                                    WoPerThread,
                                                                    InBlockCopyDataPerRead,
                                                                    WeiBlockCopyDataPerRead,
                                                                    BlockSize,
                                                                    GridSize>,
            dim3(GridSize),
            dim3(BlockSize),
            static_cast<TInWei*>(in_nchw_vec_device_buf.GetDeviceBuffer()),
            static_cast<TInWei*>(wei_kcyx_vec_device_buf.GetDeviceBuffer()),
            static_cast<TInWei*>(out_nkhw_device_buf.GetDeviceBuffer()));

        printf("Elapsed time : %f ms\n", time);
        usleep(std::min(time * 1000, float(10000)));
    }

    out_nkhw_device_buf.FromDevice(out_nkhw.mData.data());
}
