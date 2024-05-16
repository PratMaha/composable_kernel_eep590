// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2023, Advanced Micro Devices, Inc. All rights reserved.

#pragma once

#include "ck/utility/common_header.hpp"
#include "ck/tensor_description/multi_index_transform_helper.hpp"
#include "ck/tensor_description/tensor_descriptor.hpp"
#include "ck/tensor_description/tensor_descriptor_helper.hpp"
#include "ck/tensor_operation/gpu/grid/block_to_ctile_map.hpp"
#include "ck/tensor_operation/gpu/grid/gridwise_gemm_pipeline_v1.hpp"
#include "ck/tensor_operation/gpu/block/blockwise_gemm_dl_v2r3.hpp"
#include "ck/tensor_operation/gpu/block/blockwise_tensor_slice_transfer_v5r1.hpp"
#include "ck/tensor_operation/gpu/thread/threadwise_tensor_slice_transfer.hpp"
#include "ck/tensor_operation/gpu/thread/threadwise_tensor_slice_set.hpp"
#include "ck/tensor_operation/gpu/element/element_wise_operation.hpp"

namespace ck {

template <typename GridwiseGemm,
          typename FloatAB,
          typename FloatC,
          typename AGridDesc_K0_M0_M1_K1,
          typename BGridDesc_K0_N0_N1_K1,
          typename CGridDesc_M0_M10_M11_N0_N10_N11,
          typename Block2CTileMap,
          bool HasMainKBlockLoop,
          bool HasDoubleTailKBlockLoop>
__global__ void
#if CK_USE_LAUNCH_BOUNDS
    __launch_bounds__(CK_MAX_THREAD_PER_BLOCK, CK_MIN_BLOCK_PER_CU)
#endif
        kernel_gemm_dl_v1r3(const FloatAB* __restrict__ p_a_grid,
                            const FloatAB* __restrict__ p_b_grid,
                            FloatC* __restrict__ p_c_grid,
                            const AGridDesc_K0_M0_M1_K1 a_grid_desc_k0_m0_m1_k1,
                            const BGridDesc_K0_N0_N1_K1 b_grid_desc_k0_n0_n1_k1,
                            const CGridDesc_M0_M10_M11_N0_N10_N11 c_grid_desc_m0_m10_m11_n0_n10_n11,
                            const Block2CTileMap block_2_ctile_map)
{
    constexpr index_t shared_block_size =
        GridwiseGemm::GetSharedMemoryNumberOfByte() / sizeof(FloatAB);

    __shared__ FloatAB p_shared_block[shared_block_size];

    GridwiseGemm::Run(p_a_grid,
                      p_b_grid,
                      p_c_grid,
                      p_shared_block,
                      a_grid_desc_k0_m0_m1_k1,
                      b_grid_desc_k0_n0_n1_k1,
                      c_grid_desc_m0_m10_m11_n0_n10_n11,
                      block_2_ctile_map,
                      integral_constant<bool, HasMainKBlockLoop>{},
                      integral_constant<bool, HasDoubleTailKBlockLoop>{});
}

template <index_t BlockSize,
          typename FloatAB,
          typename FloatAcc,
          typename FloatC,
          InMemoryDataOperationEnum CGlobalMemoryDataOperation,
          typename AGridDesc_K0_M_K1,
          typename BGridDesc_K0_N_K1,
          typename CGridDesc_M_N,
          index_t MPerBlock,
          index_t NPerBlock,
          index_t K0PerBlock,
          index_t K1Value,
          index_t M1PerThreadM111,
          index_t N1PerThreadN111,
          index_t KPerThread,
          typename M11N11ThreadClusterM110Xs,
          typename M11N11ThreadClusterN110Xs,
          typename ABlockTransferThreadSliceLengths_K0_M0_M1_K1,
          typename ABlockTransferThreadClusterLengths_K0_M0_M1_K1,
          typename ABlockTransferThreadClusterArrangeOrder,
          typename ABlockTransferSrcAccessOrder,
          typename ABlockTransferSrcVectorTensorLengths_K0_M0_M1_K1,
          typename ABlockTransferSrcVectorTensorContiguousDimOrder,
          typename ABlockTransferDstVectorTensorLengths_K0_M0_M1_K1,
          typename BBlockTransferThreadSliceLengths_K0_N0_N1_K1,
          typename BBlockTransferThreadClusterLengths_K0_N0_N1_K1,
          typename BBlockTransferThreadClusterArrangeOrder,
          typename BBlockTransferSrcAccessOrder,
          typename BBlockTransferSrcVectorTensorLengths_K0_N0_N1_K1,
          typename BBlockTransferSrcVectorTensorContiguousDimOrder,
          typename BBlockTransferDstVectorTensorLengths_K0_N0_N1_K1,
          typename CThreadTransferSrcDstAccessOrder,
          index_t CThreadTransferSrcDstVectorDim,
          index_t CThreadTransferDstScalarPerVector>
struct GridwiseGemmDl_km_kn_mn_v1r3
{
    static constexpr auto I0 = Number<0>{};
    static constexpr auto I1 = Number<1>{};
    static constexpr auto I2 = Number<2>{};
    static constexpr auto I3 = Number<3>{};

    // K1 should be Number<...>
    static constexpr auto K1 = Number<K1Value>{};

    __host__ __device__ static constexpr index_t GetSharedMemoryNumberOfByte()
    {
        // TODO: change this. I think it needs multi-dimensional alignment
        constexpr auto max_lds_align = K1;

        // TODO: check alignment
        // A matrix in LDS memory, dst of blockwise copy
        constexpr auto a_block_desc_k_m = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, Number<MPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // B matrix in LDS memory, dst of blockwise copy
        constexpr auto b_block_desc_k_n = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, Number<NPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // LDS allocation for A and B: be careful of alignment
        constexpr auto a_block_aligned_space_size =
            math::integer_least_multiple(a_block_desc_k_m.GetElementSpaceSize(), max_lds_align);

        constexpr auto b_block_aligned_space_size =
            math::integer_least_multiple(b_block_desc_k_n.GetElementSpaceSize(), max_lds_align);

        return 2 * (a_block_aligned_space_size + b_block_aligned_space_size) * sizeof(FloatAB);
    }

    __host__ __device__ static constexpr bool
    CheckValidity(const AGridDesc_K0_M_K1& a_grid_desc_k0_m_k1,
                  const BGridDesc_K0_N_K1& b_grid_desc_k0_n_k1,
                  const CGridDesc_M_N& c_grid_desc_m_n)
    {
        const auto M  = a_grid_desc_k0_m_k1.GetLength(I1);
        const auto N  = b_grid_desc_k0_n_k1.GetLength(I1);
        const auto K0 = a_grid_desc_k0_m_k1.GetLength(I0);

        // TODO: also check validity of all components (blockwise-copy, threadwise-copy, etc)

        return (M == c_grid_desc_m_n.GetLength(I0) && N == c_grid_desc_m_n.GetLength(I1) &&
                K0 == b_grid_desc_k0_n_k1.GetLength(I0) &&
                K1 == a_grid_desc_k0_m_k1.GetLength(I2) &&
                K1 == b_grid_desc_k0_n_k1.GetLength(I2)) &&
               (M % MPerBlock == 0 && N % NPerBlock == 0 && K0 % K0PerBlock == 0);
    }

    __host__ __device__ static constexpr index_t CalculateGridSize(index_t M, index_t N)
    {
        const index_t grid_size = (M / MPerBlock) * (N / NPerBlock);

        return grid_size;
    }

    __host__ __device__ static constexpr bool CalculateHasMainKBlockLoop(index_t K0)
    {
        const bool has_main_k_block_loop = (K0 + K0PerBlock) / (2 * K0PerBlock) > 1;

        return has_main_k_block_loop;
    }

    __host__ __device__ static constexpr bool CalculateHasDoubleTailKBlockLoop(index_t K0)
    {
        const bool has_double_tail_k_block_loop = (K0 / K0PerBlock) % 2 == 0;

        return has_double_tail_k_block_loop;
    }

    __host__ __device__ static constexpr auto
    MakeAGridDescriptor_K0_M0_M1_K1(const AGridDesc_K0_M_K1& a_grid_desc_k0_m_k1)
    {
        const auto K0 = a_grid_desc_k0_m_k1.GetLength(I0);
        const auto M  = a_grid_desc_k0_m_k1.GetLength(I1);

        const auto M1 = Number<MPerBlock>{};
        const auto M0 = M / M1;

        const auto a_grid_desc_k0_m0_m1_k1 =
            transform_tensor_descriptor(a_grid_desc_k0_m_k1,
                                        make_tuple(make_pass_through_transform(K0),
                                                   make_unmerge_transform(make_tuple(M0, M1)),
                                                   make_pass_through_transform(K1)),
                                        make_tuple(Sequence<0>{}, Sequence<1>{}, Sequence<2>{}),
                                        make_tuple(Sequence<0>{}, Sequence<1, 2>{}, Sequence<3>{}));

        return a_grid_desc_k0_m0_m1_k1;
    }

    __host__ __device__ static constexpr auto
    MakeBGridDescriptor_K0_N0_N1_K1(const BGridDesc_K0_N_K1& b_grid_desc_k0_n_k1)
    {
        const auto K0 = b_grid_desc_k0_n_k1.GetLength(I0);
        const auto N  = b_grid_desc_k0_n_k1.GetLength(I1);

        const auto N1 = Number<NPerBlock>{};
        const auto N0 = N / N1;

        const auto b_grid_desc_k0_n0_n1_k1 =
            transform_tensor_descriptor(b_grid_desc_k0_n_k1,
                                        make_tuple(make_pass_through_transform(K0),
                                                   make_unmerge_transform(make_tuple(N0, N1)),
                                                   make_pass_through_transform(K1)),
                                        make_tuple(Sequence<0>{}, Sequence<1>{}, Sequence<2>{}),
                                        make_tuple(Sequence<0>{}, Sequence<1, 2>{}, Sequence<3>{}));

        return b_grid_desc_k0_n0_n1_k1;
    }

    __host__ __device__ static constexpr auto
    MakeCGridDescriptor_M0_M10_M11_N0_N10_N11(const CGridDesc_M_N& c_grid_desc_m_n)
    {
        const auto M = c_grid_desc_m_n.GetLength(I0);
        const auto N = c_grid_desc_m_n.GetLength(I1);

        constexpr auto M1 = Number<MPerBlock>{};
        constexpr auto N1 = Number<NPerBlock>{};

        const auto M0 = M / M1;
        const auto N0 = N / N1;

        constexpr auto M11 =
            Number<container_reduce(M11N11ThreadClusterM110Xs{}, math::multiplies{}, I1) *
                   M1PerThreadM111>{};
        constexpr auto N11 =
            Number<container_reduce(M11N11ThreadClusterN110Xs{}, math::multiplies{}, I1) *
                   N1PerThreadN111>{};

        constexpr auto M10 = M1 / M11;
        constexpr auto N10 = N1 / N11;

        const auto c_grid_desc_m0_m10_m11_n0_n10_n11 = transform_tensor_descriptor(
            c_grid_desc_m_n,
            make_tuple(make_unmerge_transform(make_tuple(M0, M10, M11)),
                       make_unmerge_transform(make_tuple(N0, N10, N11))),
            make_tuple(Sequence<0>{}, Sequence<1>{}),
            make_tuple(Sequence<0, 1, 2>{}, Sequence<3, 4, 5>{}));

        return c_grid_desc_m0_m10_m11_n0_n10_n11;
    }

    // return block_id to C matrix tile idx (m0, n0) mapping
    __host__ __device__ static constexpr auto
    MakeDefaultBlock2CTileMap(const CGridDesc_M_N& c_grid_desc_m_n)
    {
        return BlockToCTileMap_M00_N00_M01_N01<MPerBlock, NPerBlock, CGridDesc_M_N>(
            c_grid_desc_m_n);
    }

    using AGridDesc_K0_M0_M1_K1 = decltype(MakeAGridDescriptor_K0_M0_M1_K1(AGridDesc_K0_M_K1{}));
    using BGridDesc_K0_N0_N1_K1 = decltype(MakeBGridDescriptor_K0_N0_N1_K1(BGridDesc_K0_N_K1{}));
    using CGridDesc_M0_M10_M11_N0_N10_N11 =
        decltype(MakeCGridDescriptor_M0_M10_M11_N0_N10_N11(CGridDesc_M_N{}));
    using Block2CTileMap = decltype(MakeDefaultBlock2CTileMap(CGridDesc_M_N{}));

    template <bool HasMainKBlockLoop, bool HasDoubleTailKBlockLoop>
    __device__ static void
    Run(const FloatAB* __restrict__ p_a_grid,
        const FloatAB* __restrict__ p_b_grid,
        FloatC* __restrict__ p_c_grid,
        FloatAB* __restrict__ p_shared_block,
        const AGridDesc_K0_M0_M1_K1& a_grid_desc_k0_m0_m1_k1,
        const BGridDesc_K0_N0_N1_K1& b_grid_desc_k0_n0_n1_k1,
        const CGridDesc_M0_M10_M11_N0_N10_N11& c_grid_desc_m0_m10_m11_n0_n10_n11,
        const Block2CTileMap& block_2_ctile_map,
        integral_constant<bool, HasMainKBlockLoop>,
        integral_constant<bool, HasDoubleTailKBlockLoop>)
    {
        const auto a_global_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_a_grid, a_grid_desc_k0_m0_m1_k1.GetElementSpaceSize());
        const auto b_global_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_b_grid, b_grid_desc_k0_n0_n1_k1.GetElementSpaceSize());
        auto c_grid_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_c_grid, c_grid_desc_m0_m10_m11_n0_n10_n11.GetElementSpaceSize());

        // divide block work by [M, N]
        const auto c_m0_n0_block_cluster_idx =
            block_2_ctile_map.CalculateBottomIndex(make_multi_index(static_cast<index_t>(blockIdx.z)/*get_block_1d_id()*/));

        // HACK: this forces index data into SGPR
        const index_t im0 = __builtin_amdgcn_readfirstlane(c_m0_n0_block_cluster_idx[I0]);
        const index_t in0 = __builtin_amdgcn_readfirstlane(c_m0_n0_block_cluster_idx[I1]);

        if(!block_2_ctile_map.ValidCTileIndex(
               make_tuple(im0, in0),
               make_tuple(c_grid_desc_m0_m10_m11_n0_n10_n11.GetLength(I0),
                          c_grid_desc_m0_m10_m11_n0_n10_n11.GetLength(I3))))
        {
            return;
        }

        // TODO: change this. I think it needs multi-dimensional alignment
        constexpr auto max_lds_align = K1;

        // TODO: check alignment
        // A matrix in LDS memory, dst of blockwise copy
        //   be careful of LDS alignment
        constexpr auto a_block_desc_k0_m0_m1_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, I1, Number<MPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // B matrix in LDS memory, dst of blockwise copy
        //   be careful of LDS alignment
        constexpr auto b_block_desc_k0_n0_n1_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, I1, Number<NPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // A matrix in LDS memory, for blockwise GEMM
        constexpr auto a_k0_m_k1_block_desc = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, Number<MPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // B matrix in LDS memory, for blockwise GEMM
        constexpr auto b_k0_n_k1_block_desc = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, Number<NPerBlock>{}, K1), max_lds_align);

        static_assert(a_block_desc_k0_m0_m1_k1.GetElementSpaceSize() ==
                          a_k0_m_k1_block_desc.GetElementSpaceSize() &&
                      b_block_desc_k0_n0_n1_k1.GetElementSpaceSize() ==
                          b_k0_n_k1_block_desc.GetElementSpaceSize() &&
                      "wrong!");

        // A matrix blockwise copy
        auto a_blockwise_copy = BlockwiseTensorSliceTransfer_v5r1<
            BlockSize,
            InMemoryDataOperationEnum::Set,
            Sequence<K0PerBlock, 1, MPerBlock, K1.value>,
            ABlockTransferThreadSliceLengths_K0_M0_M1_K1,
            ABlockTransferThreadClusterLengths_K0_M0_M1_K1,
            ABlockTransferThreadClusterArrangeOrder,
            FloatAB,
            FloatAB,
            remove_reference_t<decltype(a_grid_desc_k0_m0_m1_k1)>,
            decltype(a_block_desc_k0_m0_m1_k1),
            ABlockTransferSrcAccessOrder,
            Sequence<0, 1, 2, 3>,
            ABlockTransferSrcVectorTensorLengths_K0_M0_M1_K1, // SrcVectorTensorLengths
            ABlockTransferDstVectorTensorLengths_K0_M0_M1_K1, // DstVectorTensorLengths
            ABlockTransferSrcVectorTensorContiguousDimOrder,  // SrcVectorTensorContiguousDimOrder
            Sequence<0, 1, 2, 3>,                             // DstVectorTensorContiguousDimOrder
            false,
            true>(a_grid_desc_k0_m0_m1_k1,
                  make_multi_index(0, im0, 0, 0),
                  a_block_desc_k0_m0_m1_k1,
                  make_multi_index(0, 0, 0, 0));

        // B matrix blockwise copy
        auto b_blockwise_copy = BlockwiseTensorSliceTransfer_v5r1<
            BlockSize,
            InMemoryDataOperationEnum::Set,
            Sequence<K0PerBlock, 1, NPerBlock, K1.value>,
            BBlockTransferThreadSliceLengths_K0_N0_N1_K1,
            BBlockTransferThreadClusterLengths_K0_N0_N1_K1,
            BBlockTransferThreadClusterArrangeOrder,
            FloatAB,
            FloatAB,
            remove_reference_t<decltype(b_grid_desc_k0_n0_n1_k1)>,
            decltype(b_block_desc_k0_n0_n1_k1),
            BBlockTransferSrcAccessOrder,
            Sequence<0, 1, 2, 3>,
            BBlockTransferSrcVectorTensorLengths_K0_N0_N1_K1, // SrcVectorTensorLengths
            BBlockTransferDstVectorTensorLengths_K0_N0_N1_K1, // DstVectorTensorLengths
            BBlockTransferSrcVectorTensorContiguousDimOrder,  // SrcVectorTensorContiguousDimOrder
            Sequence<0, 1, 2, 3>,                             // DstVectorTensorContiguousDimOrder
            false,
            true>(b_grid_desc_k0_n0_n1_k1,
                  make_multi_index(0, in0, 0, 0),
                  b_block_desc_k0_n0_n1_k1,
                  make_multi_index(0, 0, 0, 0));

        // GEMM definition
        //   c_mtx += transpose(a_mtx) * b_mtx
        //     a_mtx[K0PerBlock, MPerBlock] is in LDS
        //     b_mtx[KPerBlocl, NPerBlock] is in LDS
        //     c_mtx[MPerBlock, NPerBlock] is distributed among threads, and saved in
        //       register
        const auto blockwise_gemm =
            BlockwiseGemmDl_A_BK0_BM_BK1_B_BK0_BN_BK1_C_BM0_BM1_BN0_BN1_pipeline_BM0_2_BN0_2<
                BlockSize,
                FloatAB,
                FloatAB,
                FloatAcc,
                decltype(a_k0_m_k1_block_desc),
                decltype(b_k0_n_k1_block_desc),
                M1PerThreadM111,
                N1PerThreadN111,
                KPerThread,
                M11N11ThreadClusterM110Xs,
                M11N11ThreadClusterN110Xs,
                M1PerThreadM111,
                N1PerThreadN111>{};

        constexpr auto c_m10_m11_n10_n11_thread_tensor_lengths =
            decltype(blockwise_gemm)::GetCThreadTensorLengths_BM0_BM1_BN0_BN1();

        constexpr auto c_thread_desc_m10_m11_n10_n11 = make_naive_tensor_descriptor_packed(
            sequence_to_tuple_of_number(c_m10_m11_n10_n11_thread_tensor_lengths));

        // LDS allocation for A and B: be careful of alignment
        constexpr auto a_block_aligned_space_size = math::integer_least_multiple(
            a_block_desc_k0_m0_m1_k1.GetElementSpaceSize(), max_lds_align);

        constexpr auto b_block_aligned_space_size = math::integer_least_multiple(
            b_block_desc_k0_n0_n1_k1.GetElementSpaceSize(), max_lds_align);

        FloatAB* p_a_block_double = p_shared_block;
        FloatAB* p_b_block_double = p_shared_block + 2 * a_block_aligned_space_size;

        // register allocation for output
        auto c_thread_buf = make_static_buffer<AddressSpaceEnum::Vgpr, FloatAcc>(
            c_thread_desc_m10_m11_n10_n11.GetElementSpaceSize());

        // Initialize C
        c_thread_buf.Clear();

        constexpr auto a_block_slice_copy_step = make_multi_index(K0PerBlock, 0, 0, 0);
        constexpr auto b_block_slice_copy_step = make_multi_index(K0PerBlock, 0, 0, 0);

        auto a_block_even_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_a_block_double, a_block_desc_k0_m0_m1_k1.GetElementSpaceSize());
        auto b_block_even_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_b_block_double, b_block_desc_k0_n0_n1_k1.GetElementSpaceSize());

        auto a_block_odd_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_a_block_double + a_block_aligned_space_size,
            a_block_desc_k0_m0_m1_k1.GetElementSpaceSize());
        auto b_block_odd_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_b_block_double + b_block_aligned_space_size,
            b_block_desc_k0_n0_n1_k1.GetElementSpaceSize());

        // LDS double buffer: preload data into LDS
        {
            a_blockwise_copy.RunRead(a_grid_desc_k0_m0_m1_k1, a_global_buf);
            b_blockwise_copy.RunRead(b_grid_desc_k0_n0_n1_k1, b_global_buf);

            a_blockwise_copy.RunWrite(a_block_desc_k0_m0_m1_k1, a_block_even_buf);
            b_blockwise_copy.RunWrite(b_block_desc_k0_n0_n1_k1, b_block_even_buf);
        }

        if constexpr(HasMainKBlockLoop)
        {
            const auto K0 = a_grid_desc_k0_m0_m1_k1.GetLength(I0);

            index_t k_block_data_begin = 0;

            // LDS double buffer: main body
            // use Do-While loop instead of For loop to simplify control flow
            do
            {
                // even iteration
                a_blockwise_copy.MoveSrcSliceWindow(a_grid_desc_k0_m0_m1_k1,
                                                    a_block_slice_copy_step);
                b_blockwise_copy.MoveSrcSliceWindow(b_grid_desc_k0_n0_n1_k1,
                                                    b_block_slice_copy_step);

                // LDS doubel buffer: load next data from device mem
                a_blockwise_copy.RunRead(a_grid_desc_k0_m0_m1_k1, a_global_buf);
                b_blockwise_copy.RunRead(b_grid_desc_k0_n0_n1_k1, b_global_buf);

                block_sync_lds();

                // LDS double buffer: GEMM on current data
                blockwise_gemm.Run(c_thread_desc_m10_m11_n10_n11,
                                   a_block_even_buf,
                                   b_block_even_buf,
                                   c_thread_buf);

                // LDS double buffer: store next data to LDS
                a_blockwise_copy.RunWrite(a_block_desc_k0_m0_m1_k1, a_block_odd_buf);
                b_blockwise_copy.RunWrite(b_block_desc_k0_n0_n1_k1, b_block_odd_buf);

                // odd iteration
                a_blockwise_copy.MoveSrcSliceWindow(a_grid_desc_k0_m0_m1_k1,
                                                    a_block_slice_copy_step);
                b_blockwise_copy.MoveSrcSliceWindow(b_grid_desc_k0_n0_n1_k1,
                                                    b_block_slice_copy_step);

                // LDS double buffer: load next data from device mem
                a_blockwise_copy.RunRead(a_grid_desc_k0_m0_m1_k1, a_global_buf);
                b_blockwise_copy.RunRead(b_grid_desc_k0_n0_n1_k1, b_global_buf);

                block_sync_lds();

                // LDS double buffer: GEMM on current data
                blockwise_gemm.Run(
                    c_thread_desc_m10_m11_n10_n11, a_block_odd_buf, b_block_odd_buf, c_thread_buf);

                // LDS double buffer: store next data to LDS
                a_blockwise_copy.RunWrite(a_block_desc_k0_m0_m1_k1, a_block_even_buf);
                b_blockwise_copy.RunWrite(b_block_desc_k0_n0_n1_k1, b_block_even_buf);

                k_block_data_begin += 2 * K0PerBlock;
            } while(k_block_data_begin < K0 - 2 * K0PerBlock);
        }

        // LDS double buffer: tail
        if constexpr(HasDoubleTailKBlockLoop) // if has 2 iteration left
        {
            a_blockwise_copy.MoveSrcSliceWindow(a_grid_desc_k0_m0_m1_k1, a_block_slice_copy_step);
            b_blockwise_copy.MoveSrcSliceWindow(b_grid_desc_k0_n0_n1_k1, b_block_slice_copy_step);

            block_sync_lds();

            // LDS double buffer: load last data from device mem
            a_blockwise_copy.RunRead(a_grid_desc_k0_m0_m1_k1, a_global_buf);
            b_blockwise_copy.RunRead(b_grid_desc_k0_n0_n1_k1, b_global_buf);

            // LDS double buffer: GEMM on 2nd-last data
            blockwise_gemm.Run(
                c_thread_desc_m10_m11_n10_n11, a_block_even_buf, b_block_even_buf, c_thread_buf);

            // LDS double buffer: store last data to LDS
            a_blockwise_copy.RunWrite(a_block_desc_k0_m0_m1_k1, a_block_odd_buf);
            b_blockwise_copy.RunWrite(b_block_desc_k0_n0_n1_k1, b_block_odd_buf);

            block_sync_lds();

            // LDS double buffer: GEMM on last data
            blockwise_gemm.Run(
                c_thread_desc_m10_m11_n10_n11, a_block_odd_buf, b_block_odd_buf, c_thread_buf);
        }
        else // if has 1 iteration left
        {
            __syncthreads();

            // LDS double buffer: GEMM on last data
            blockwise_gemm.Run(
                c_thread_desc_m10_m11_n10_n11, a_block_even_buf, b_block_even_buf, c_thread_buf);
        }

        // output: register to global memory
        {
            constexpr auto c_thread_desc_m0_m10_m11_n0_n10_n11 =
                make_naive_tensor_descriptor_packed(
                    make_tuple(I1,
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I0]>{},
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I1]>{},
                               I1,
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I2]>{},
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I3]>{}));

            const auto c_m10_m11_n10_n11_thread_origin_idx_on_block =
                blockwise_gemm.CalculateCThreadOriginOnBlock_BM0_BM1_BN0_BN1(
                    get_thread_local_1d_id());

            ThreadwiseTensorSliceTransfer_v1r3<
                FloatAcc,
                FloatC,
                decltype(c_thread_desc_m0_m10_m11_n0_n10_n11),
                decltype(c_grid_desc_m0_m10_m11_n0_n10_n11),
                ck::tensor_operation::element_wise::PassThrough,
                Sequence<1,
                         c_m10_m11_n10_n11_thread_tensor_lengths[I0],
                         c_m10_m11_n10_n11_thread_tensor_lengths[I1],
                         1,
                         c_m10_m11_n10_n11_thread_tensor_lengths[I2],
                         c_m10_m11_n10_n11_thread_tensor_lengths[I3]>,
                CThreadTransferSrcDstAccessOrder,
                CThreadTransferSrcDstVectorDim,
                CThreadTransferDstScalarPerVector,
                CGlobalMemoryDataOperation,
                1,
                true>{c_grid_desc_m0_m10_m11_n0_n10_n11,
                      make_multi_index(im0,
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I0],
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I1],
                                       in0,
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I2],
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I3]),
                      ck::tensor_operation::element_wise::PassThrough{}}
                .Run(c_thread_desc_m0_m10_m11_n0_n10_n11,
                     make_tuple(I0, I0, I0, I0, I0, I0),
                     c_thread_buf,
                     c_grid_desc_m0_m10_m11_n0_n10_n11,
                     c_grid_buf);
        }
    }
};

template <index_t BlockSize,
          typename FloatAB,
          typename FloatAcc,
          typename FloatC,
          InMemoryDataOperationEnum CGlobalMemoryDataOperation,
          typename AGridDesc_B_K0_M_K1,
          typename BGridDesc_B_K0_N_K1,
          typename CGridDesc_M_N,
          index_t MPerBlock,
          index_t NPerBlock,
          index_t K0PerBlock,
          index_t K1Value,
          index_t M1PerThreadM111,
          index_t N1PerThreadN111,
          index_t KPerThread,
          typename M11N11ThreadClusterM110Xs,
          typename M11N11ThreadClusterN110Xs,
          typename ABlockTransferThreadSliceLengths_K0_M0_M1_K1,
          typename ABlockTransferThreadClusterLengths_K0_M0_M1_K1,
          typename ABlockTransferThreadClusterArrangeOrder,
          typename ABlockTransferSrcAccessOrder,
          typename ABlockTransferSrcVectorTensorLengths_K0_M0_M1_K1,
          typename ABlockTransferSrcVectorTensorContiguousDimOrder,
          typename ABlockTransferDstVectorTensorLengths_K0_M0_M1_K1,
          typename BBlockTransferThreadSliceLengths_K0_N0_N1_K1,
          typename BBlockTransferThreadClusterLengths_K0_N0_N1_K1,
          typename BBlockTransferThreadClusterArrangeOrder,
          typename BBlockTransferSrcAccessOrder,
          typename BBlockTransferSrcVectorTensorLengths_K0_N0_N1_K1,
          typename BBlockTransferSrcVectorTensorContiguousDimOrder,
          typename BBlockTransferDstVectorTensorLengths_K0_N0_N1_K1,
          typename CThreadTransferSrcDstAccessOrder,
          index_t CThreadTransferSrcDstVectorDim,
          index_t CThreadTransferDstScalarPerVector>
struct GridwiseGemmDl_bkm_bkn_mn_v1r3
{
    static constexpr auto I0 = Number<0>{};
    static constexpr auto I1 = Number<1>{};
    static constexpr auto I2 = Number<2>{};
    static constexpr auto I3 = Number<3>{};

    // K1 should be Number<...>
    static constexpr auto K1 = Number<K1Value>{};

    __host__ __device__ static constexpr index_t GetSharedMemoryNumberOfByte()
    {
        // TODO: change this. I think it needs multi-dimensional alignment
        constexpr auto max_lds_align = K1;

        // TODO: check alignment
        // A matrix in LDS memory, dst of blockwise copy
        constexpr auto a_block_desc_b_k0_m_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<1>{}, Number<K0PerBlock>{}, Number<MPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // B matrix in LDS memory, dst of blockwise copy
        constexpr auto b_block_desc_b_k0_n_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<1>{}, Number<K0PerBlock>{}, Number<NPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // LDS allocation for A and B: be careful of alignment
        constexpr auto a_block_aligned_space_size = math::integer_least_multiple(
            a_block_desc_b_k0_m_k1.GetElementSpaceSize(), max_lds_align);

        constexpr auto b_block_aligned_space_size = math::integer_least_multiple(
            b_block_desc_b_k0_n_k1.GetElementSpaceSize(), max_lds_align);

        return 2 * (a_block_aligned_space_size + b_block_aligned_space_size) * sizeof(FloatAB);
    }

    __host__ __device__ static constexpr bool
    CheckValidity(const AGridDesc_B_K0_M_K1& a_grid_desc_b_k0_m_k1,
                  const BGridDesc_B_K0_N_K1& b_grid_desc_b_k0_n_k1,
                  const CGridDesc_M_N& c_grid_desc_m_n)
    {
        const auto M      = a_grid_desc_b_k0_m_k1.GetLength(I2);
        const auto N      = b_grid_desc_b_k0_n_k1.GetLength(I2);
        const auto K0     = a_grid_desc_b_k0_m_k1.GetLength(I1);
        const auto KBatch = a_grid_desc_b_k0_m_k1.GetLength(I0);

        // TODO: also check validity of all components (blockwise-copy, threadwise-copy, etc)

        return (M == c_grid_desc_m_n.GetLength(I0) && N == c_grid_desc_m_n.GetLength(I1) &&
                K0 == b_grid_desc_b_k0_n_k1.GetLength(I1) &&
                K1 == a_grid_desc_b_k0_m_k1.GetLength(I3) &&
                K1 == b_grid_desc_b_k0_n_k1.GetLength(I3)) &&
               KBatch == b_grid_desc_b_k0_n_k1.GetLength(I0) &&
               (M % MPerBlock == 0 && N % NPerBlock == 0 && K0 % K0PerBlock == 0);
    }

    __host__ __device__ static constexpr index_t CalculateGridSize(index_t M, index_t N)
    {
        const index_t grid_size = (M / MPerBlock) * (N / NPerBlock);

        return grid_size;
    }

    __host__ __device__ static constexpr bool CalculateHasMainKBlockLoop(index_t K0)
    {
        const bool has_main_k_block_loop = (K0 + K0PerBlock) / (2 * K0PerBlock) > 1;

        return has_main_k_block_loop;
    }

    __host__ __device__ static constexpr bool CalculateHasDoubleTailKBlockLoop(index_t K0)
    {
        const bool has_double_tail_k_block_loop = (K0 / K0PerBlock) % 2 == 0;

        return has_double_tail_k_block_loop;
    }

    __host__ __device__ static constexpr auto
    MakeAGridDescriptor_B_K0_M0_M1_K1(const AGridDesc_B_K0_M_K1& a_grid_desc_b_k0_m_k1)
    {
        const auto KBatch = a_grid_desc_b_k0_m_k1.GetLength(I0);
        const auto K0     = a_grid_desc_b_k0_m_k1.GetLength(I1);
        const auto M      = a_grid_desc_b_k0_m_k1.GetLength(I2);

        const auto M1 = Number<MPerBlock>{};
        const auto M0 = M / M1;

        const auto a_grid_desc_b_k0_m0_m1_k1 = transform_tensor_descriptor(
            a_grid_desc_b_k0_m_k1,
            make_tuple(make_pass_through_transform(KBatch),
                       make_pass_through_transform(K0),
                       make_unmerge_transform(make_tuple(M0, M1)),
                       make_pass_through_transform(K1)),
            make_tuple(Sequence<0>{}, Sequence<1>{}, Sequence<2>{}, Sequence<3>{}),
            make_tuple(Sequence<0>{}, Sequence<1>{}, Sequence<2, 3>{}, Sequence<4>{}));

        return a_grid_desc_b_k0_m0_m1_k1;
    }

    __host__ __device__ static constexpr auto
    MakeBGridDescriptor_B_K0_N0_N1_K1(const BGridDesc_B_K0_N_K1& b_grid_desc_b_k0_n_k1)
    {
        const auto KBatch = b_grid_desc_b_k0_n_k1.GetLength(I0);
        const auto K0     = b_grid_desc_b_k0_n_k1.GetLength(I1);
        const auto N      = b_grid_desc_b_k0_n_k1.GetLength(I2);

        const auto N1 = Number<NPerBlock>{};
        const auto N0 = N / N1;

        const auto b_grid_desc_b_k0_n0_n1_k1 = transform_tensor_descriptor(
            b_grid_desc_b_k0_n_k1,
            make_tuple(make_pass_through_transform(KBatch),
                       make_pass_through_transform(K0),
                       make_unmerge_transform(make_tuple(N0, N1)),
                       make_pass_through_transform(K1)),
            make_tuple(Sequence<0>{}, Sequence<1>{}, Sequence<2>{}, Sequence<3>{}),
            make_tuple(Sequence<0>{}, Sequence<1>{}, Sequence<2, 3>{}, Sequence<4>{}));

        return b_grid_desc_b_k0_n0_n1_k1;
    }

    __host__ __device__ static constexpr auto
    MakeCGridDescriptor_M0_M10_M11_N0_N10_N11(const CGridDesc_M_N& c_grid_desc_m_n)
    {
        const auto M = c_grid_desc_m_n.GetLength(I0);
        const auto N = c_grid_desc_m_n.GetLength(I1);

        constexpr auto M1 = Number<MPerBlock>{};
        constexpr auto N1 = Number<NPerBlock>{};

        const auto M0 = M / M1;
        const auto N0 = N / N1;

        constexpr auto M11 =
            Number<container_reduce(M11N11ThreadClusterM110Xs{}, math::multiplies{}, I1) *
                   M1PerThreadM111>{};
        constexpr auto N11 =
            Number<container_reduce(M11N11ThreadClusterN110Xs{}, math::multiplies{}, I1) *
                   N1PerThreadN111>{};

        constexpr auto M10 = M1 / M11;
        constexpr auto N10 = N1 / N11;

        const auto c_grid_desc_m0_m10_m11_n0_n10_n11 = transform_tensor_descriptor(
            c_grid_desc_m_n,
            make_tuple(make_unmerge_transform(make_tuple(M0, M10, M11)),
                       make_unmerge_transform(make_tuple(N0, N10, N11))),
            make_tuple(Sequence<0>{}, Sequence<1>{}),
            make_tuple(Sequence<0, 1, 2>{}, Sequence<3, 4, 5>{}));

        return c_grid_desc_m0_m10_m11_n0_n10_n11;
    }

    // return block_id to C matrix tile idx (m0, n0) mapping
    __host__ __device__ static constexpr auto MakeCBlockClusterAdaptor(
        const CGridDesc_M_N& c_m_n_grid_desc, index_t M01, index_t N01, index_t KBatch)
    {
        return BlockToCTileMap_KSplit_M00_N00_M01_N01<MPerBlock, NPerBlock, CGridDesc_M_N>(
            c_m_n_grid_desc, M01, N01, KBatch);
    }

    using AGridDesc_B_K0_M0_M1_K1 =
        decltype(MakeAGridDescriptor_B_K0_M0_M1_K1(AGridDesc_B_K0_M_K1{}));
    using BGridDesc_B_K0_N0_N1_K1 =
        decltype(MakeBGridDescriptor_B_K0_N0_N1_K1(BGridDesc_B_K0_N_K1{}));
    using CGridDesc_M0_M10_M11_N0_N10_N11 =
        decltype(MakeCGridDescriptor_M0_M10_M11_N0_N10_N11(CGridDesc_M_N{}));
    using CBlockClusterAdaptor = decltype(MakeCBlockClusterAdaptor(CGridDesc_M_N{}, 1, 1, 1));

    template <bool HasMainKBlockLoop, bool HasDoubleTailKBlockLoop>
    __device__ static void
    Run(const FloatAB* __restrict__ p_a_grid,
        const FloatAB* __restrict__ p_b_grid,
        FloatC* __restrict__ p_c_grid,
        FloatAB* __restrict__ p_shared_block,
        const AGridDesc_B_K0_M0_M1_K1& a_grid_desc_b_k0_m0_m1_k1,
        const BGridDesc_B_K0_N0_N1_K1& b_grid_desc_b_k0_n0_n1_k1,
        const CGridDesc_M0_M10_M11_N0_N10_N11& c_grid_desc_m0_m10_m11_n0_n10_n11,
        const CBlockClusterAdaptor& c_block_cluster_adaptor,
        integral_constant<bool, HasMainKBlockLoop>,
        integral_constant<bool, HasDoubleTailKBlockLoop>)
    {
        const auto a_global_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_a_grid, a_grid_desc_b_k0_m0_m1_k1.GetElementSpaceSize());
        const auto b_global_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_b_grid, b_grid_desc_b_k0_n0_n1_k1.GetElementSpaceSize());
        auto c_grid_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_c_grid, c_grid_desc_m0_m10_m11_n0_n10_n11.GetElementSpaceSize());

        // divide block work by [M, N]
        const auto block_work_idx =
            c_block_cluster_adaptor.CalculateBottomIndex(make_multi_index(static_cast<index_t>(blockIdx.z)/*get_block_1d_id()*/));

        const index_t k_batch_id = block_work_idx[I0];

        if(!c_block_cluster_adaptor.ValidCTileIndex(
               make_tuple(block_work_idx[I1], block_work_idx[I2]),
               make_tuple(c_grid_desc_m0_m10_m11_n0_n10_n11.GetLength(I0),
                          c_grid_desc_m0_m10_m11_n0_n10_n11.GetLength(I3))))
        {
            return;
        }

        // HACK: this force m/n_block_data_idx_on_grid into SGPR
        const index_t m_block_data_idx_on_grid = __builtin_amdgcn_readfirstlane(block_work_idx[I1]);

        const index_t n_block_data_idx_on_grid = __builtin_amdgcn_readfirstlane(block_work_idx[I2]);

        // TODO: change this. I think it needs multi-dimensional alignment
        constexpr auto max_lds_align = K1;

        // TODO: check alignment
        // A matrix in LDS memory, dst of blockwise copy
        //   be careful of LDS alignment
        constexpr auto a_block_desc_b_k0_m0_m1_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(I1, Number<K0PerBlock>{}, I1, Number<MPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // B matrix in LDS memory, dst of blockwise copy
        //   be careful of LDS alignment
        constexpr auto b_block_desc_b_k0_n0_n1_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(I1, Number<K0PerBlock>{}, I1, Number<NPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // A matrix in LDS memory, dst of blockwise copy
        //   be careful of LDS alignment
        constexpr auto a_block_desc_k0_m0_m1_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, I1, Number<MPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // B matrix in LDS memory, dst of blockwise copy
        //   be careful of LDS alignment
        constexpr auto b_block_desc_k0_n0_n1_k1 = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, I1, Number<NPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // A matrix in LDS memory, for blockwise GEMM
        constexpr auto a_k0_m_k1_block_desc = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, Number<MPerBlock>{}, K1), max_lds_align);

        // TODO: check alignment
        // B matrix in LDS memory, for blockwise GEMM
        constexpr auto b_k0_n_k1_block_desc = make_naive_tensor_descriptor_aligned(
            make_tuple(Number<K0PerBlock>{}, Number<NPerBlock>{}, K1), max_lds_align);

        static_assert(a_block_desc_k0_m0_m1_k1.GetElementSpaceSize() ==
                          a_k0_m_k1_block_desc.GetElementSpaceSize() &&
                      b_block_desc_k0_n0_n1_k1.GetElementSpaceSize() ==
                          b_k0_n_k1_block_desc.GetElementSpaceSize() &&
                      "wrong!");

        // A matrix blockwise copy
        auto a_blockwise_copy = BlockwiseTensorSliceTransfer_v5r1<
            BlockSize,
            InMemoryDataOperationEnum::Set,
            Sequence<1, K0PerBlock, 1, MPerBlock, K1.value>,
            ABlockTransferThreadSliceLengths_K0_M0_M1_K1,
            ABlockTransferThreadClusterLengths_K0_M0_M1_K1,
            ABlockTransferThreadClusterArrangeOrder,
            FloatAB,
            FloatAB,
            remove_reference_t<decltype(a_grid_desc_b_k0_m0_m1_k1)>,
            decltype(a_block_desc_b_k0_m0_m1_k1),
            ABlockTransferSrcAccessOrder,
            Sequence<0, 1, 2, 3, 4>,
            ABlockTransferSrcVectorTensorLengths_K0_M0_M1_K1, // SrcVectorTensorLengths
            ABlockTransferDstVectorTensorLengths_K0_M0_M1_K1, // DstVectorTensorLengths
            ABlockTransferSrcVectorTensorContiguousDimOrder,  // SrcVectorTensorContiguousDimOrder
            Sequence<0, 1, 2, 3, 4>,                          // DstVectorTensorContiguousDimOrder
            false,
            true>(a_grid_desc_b_k0_m0_m1_k1,
                  make_multi_index(k_batch_id, 0, m_block_data_idx_on_grid, 0, 0),
                  a_block_desc_b_k0_m0_m1_k1,
                  make_multi_index(0, 0, 0, 0, 0));

        // B matrix blockwise copy
        auto b_blockwise_copy = BlockwiseTensorSliceTransfer_v5r1<
            BlockSize,
            InMemoryDataOperationEnum::Set,
            Sequence<1, K0PerBlock, 1, NPerBlock, K1.value>,
            BBlockTransferThreadSliceLengths_K0_N0_N1_K1,
            BBlockTransferThreadClusterLengths_K0_N0_N1_K1,
            BBlockTransferThreadClusterArrangeOrder,
            FloatAB,
            FloatAB,
            remove_reference_t<decltype(b_grid_desc_b_k0_n0_n1_k1)>,
            decltype(b_block_desc_b_k0_n0_n1_k1),
            BBlockTransferSrcAccessOrder,
            Sequence<0, 1, 2, 3, 4>,
            BBlockTransferSrcVectorTensorLengths_K0_N0_N1_K1, // SrcVectorTensorLengths
            BBlockTransferDstVectorTensorLengths_K0_N0_N1_K1, // DstVectorTensorLengths
            BBlockTransferSrcVectorTensorContiguousDimOrder,  // SrcVectorTensorContiguousDimOrder
            Sequence<0, 1, 2, 3, 4>,                          // DstVectorTensorContiguousDimOrder
            false,
            true>(b_grid_desc_b_k0_n0_n1_k1,
                  make_multi_index(k_batch_id, 0, n_block_data_idx_on_grid, 0, 0),
                  b_block_desc_b_k0_n0_n1_k1,
                  make_multi_index(0, 0, 0, 0, 0));

        // GEMM definition
        //   c_mtx += transpose(a_mtx) * b_mtx
        //     a_mtx[K0PerBlock, MPerBlock] is in LDS
        //     b_mtx[KPerBlocl, NPerBlock] is in LDS
        //     c_mtx[MPerBlock, NPerBlock] is distributed among threads, and saved in
        //       register
        const auto blockwise_gemm =
            BlockwiseGemmDl_A_BK0_BM_BK1_B_BK0_BN_BK1_C_BM0_BM1_BN0_BN1_pipeline_BM0_2_BN0_2<
                BlockSize,
                FloatAB,
                FloatAB,
                FloatAcc,
                decltype(a_k0_m_k1_block_desc),
                decltype(b_k0_n_k1_block_desc),
                M1PerThreadM111,
                N1PerThreadN111,
                KPerThread,
                M11N11ThreadClusterM110Xs,
                M11N11ThreadClusterN110Xs,
                M1PerThreadM111,
                N1PerThreadN111>{};

        constexpr auto c_m10_m11_n10_n11_thread_tensor_lengths =
            decltype(blockwise_gemm)::GetCThreadTensorLengths_BM0_BM1_BN0_BN1();

        constexpr auto c_thread_desc_m10_m11_n10_n11 = make_naive_tensor_descriptor_packed(
            sequence_to_tuple_of_number(c_m10_m11_n10_n11_thread_tensor_lengths));

        // LDS allocation for A and B: be careful of alignment
        constexpr auto a_block_aligned_space_size = math::integer_least_multiple(
            a_block_desc_k0_m0_m1_k1.GetElementSpaceSize(), max_lds_align);

        constexpr auto b_block_aligned_space_size = math::integer_least_multiple(
            b_block_desc_k0_n0_n1_k1.GetElementSpaceSize(), max_lds_align);

        FloatAB* p_a_block_double = p_shared_block;
        FloatAB* p_b_block_double = p_shared_block + 2 * a_block_aligned_space_size;

        // register allocation for output
        auto c_thread_buf = make_static_buffer<AddressSpaceEnum::Vgpr, FloatAcc>(
            c_thread_desc_m10_m11_n10_n11.GetElementSpaceSize());

        // Initialize C
        c_thread_buf.Clear();

        constexpr auto a_block_slice_copy_step = make_multi_index(0, K0PerBlock, 0, 0, 0);
        constexpr auto b_block_slice_copy_step = make_multi_index(0, K0PerBlock, 0, 0, 0);

        auto a_block_even_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_a_block_double, a_block_desc_k0_m0_m1_k1.GetElementSpaceSize());
        auto b_block_even_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_b_block_double, b_block_desc_k0_n0_n1_k1.GetElementSpaceSize());

        auto a_block_odd_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_a_block_double + a_block_aligned_space_size,
            a_block_desc_k0_m0_m1_k1.GetElementSpaceSize());
        auto b_block_odd_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            p_b_block_double + b_block_aligned_space_size,
            b_block_desc_k0_n0_n1_k1.GetElementSpaceSize());

        // LDS double buffer: preload data into LDS
        {
            a_blockwise_copy.RunRead(a_grid_desc_b_k0_m0_m1_k1, a_global_buf);
            b_blockwise_copy.RunRead(b_grid_desc_b_k0_n0_n1_k1, b_global_buf);

            a_blockwise_copy.RunWrite(a_block_desc_b_k0_m0_m1_k1, a_block_even_buf);
            b_blockwise_copy.RunWrite(b_block_desc_b_k0_n0_n1_k1, b_block_even_buf);
        }

        if constexpr(HasMainKBlockLoop)
        {
            const auto K0 = a_grid_desc_b_k0_m0_m1_k1.GetLength(I1);

            index_t k_block_data_begin = 0;

            // LDS double buffer: main body
            // use Do-While loop instead of For loop to simplify control flow
            do
            {
                // even iteration
                a_blockwise_copy.MoveSrcSliceWindow(a_grid_desc_b_k0_m0_m1_k1,
                                                    a_block_slice_copy_step);
                b_blockwise_copy.MoveSrcSliceWindow(b_grid_desc_b_k0_n0_n1_k1,
                                                    b_block_slice_copy_step);

                // LDS double buffer: load next data from device mem
                a_blockwise_copy.RunRead(a_grid_desc_b_k0_m0_m1_k1, a_global_buf);
                b_blockwise_copy.RunRead(b_grid_desc_b_k0_n0_n1_k1, b_global_buf);

                block_sync_lds();

                // LDS double buffer: GEMM on current data
                blockwise_gemm.Run(c_thread_desc_m10_m11_n10_n11,
                                   a_block_even_buf,
                                   b_block_even_buf,
                                   c_thread_buf);

                // LDS double buffer: store next data to LDS
                a_blockwise_copy.RunWrite(a_block_desc_b_k0_m0_m1_k1, a_block_odd_buf);
                b_blockwise_copy.RunWrite(b_block_desc_b_k0_n0_n1_k1, b_block_odd_buf);

                // odd iteration
                a_blockwise_copy.MoveSrcSliceWindow(a_grid_desc_b_k0_m0_m1_k1,
                                                    a_block_slice_copy_step);
                b_blockwise_copy.MoveSrcSliceWindow(b_grid_desc_b_k0_n0_n1_k1,
                                                    b_block_slice_copy_step);

                // LDS doubel buffer: load next data from device mem
                a_blockwise_copy.RunRead(a_grid_desc_b_k0_m0_m1_k1, a_global_buf);
                b_blockwise_copy.RunRead(b_grid_desc_b_k0_n0_n1_k1, b_global_buf);

                block_sync_lds();

                // LDS double buffer: GEMM on current data
                blockwise_gemm.Run(
                    c_thread_desc_m10_m11_n10_n11, a_block_odd_buf, b_block_odd_buf, c_thread_buf);

                // LDS double buffer: store next data to LDS
                a_blockwise_copy.RunWrite(a_block_desc_b_k0_m0_m1_k1, a_block_even_buf);
                b_blockwise_copy.RunWrite(b_block_desc_b_k0_n0_n1_k1, b_block_even_buf);

                k_block_data_begin += 2 * K0PerBlock;
            } while(k_block_data_begin < K0 - 2 * K0PerBlock);
        }

        // LDS double buffer: tail
        if constexpr(HasDoubleTailKBlockLoop) // if has 2 iteration left
        {
            a_blockwise_copy.MoveSrcSliceWindow(a_grid_desc_b_k0_m0_m1_k1, a_block_slice_copy_step);
            b_blockwise_copy.MoveSrcSliceWindow(b_grid_desc_b_k0_n0_n1_k1, b_block_slice_copy_step);

            block_sync_lds();

            // LDS double buffer: load last data from device mem
            a_blockwise_copy.RunRead(a_grid_desc_b_k0_m0_m1_k1, a_global_buf);
            b_blockwise_copy.RunRead(b_grid_desc_b_k0_n0_n1_k1, b_global_buf);

            // LDS double buffer: GEMM on 2nd-last data
            blockwise_gemm.Run(
                c_thread_desc_m10_m11_n10_n11, a_block_even_buf, b_block_even_buf, c_thread_buf);

            // LDS double buffer: store last data to LDS
            a_blockwise_copy.RunWrite(a_block_desc_b_k0_m0_m1_k1, a_block_odd_buf);
            b_blockwise_copy.RunWrite(b_block_desc_b_k0_n0_n1_k1, b_block_odd_buf);

            block_sync_lds();

            // LDS double buffer: GEMM on last data
            blockwise_gemm.Run(
                c_thread_desc_m10_m11_n10_n11, a_block_odd_buf, b_block_odd_buf, c_thread_buf);
        }
        else // if has 1 iteration left
        {
            __syncthreads();

            // LDS double buffer: GEMM on last data
            blockwise_gemm.Run(
                c_thread_desc_m10_m11_n10_n11, a_block_even_buf, b_block_even_buf, c_thread_buf);
        }

        // output: register to global memory
        {
            constexpr auto c_thread_desc_m0_m10_m11_n0_n10_n11 =
                make_naive_tensor_descriptor_packed(
                    make_tuple(I1,
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I0]>{},
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I1]>{},
                               I1,
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I2]>{},
                               Number<c_m10_m11_n10_n11_thread_tensor_lengths[I3]>{}));

            const auto c_m10_m11_n10_n11_thread_origin_idx_on_block =
                blockwise_gemm.CalculateCThreadOriginOnBlock_BM0_BM1_BN0_BN1(
                    get_thread_local_1d_id());

            ThreadwiseTensorSliceTransfer_v1r3<
                FloatAcc,
                FloatC,
                decltype(c_thread_desc_m0_m10_m11_n0_n10_n11),
                decltype(c_grid_desc_m0_m10_m11_n0_n10_n11),
                ck::tensor_operation::element_wise::PassThrough,
                Sequence<1,
                         c_m10_m11_n10_n11_thread_tensor_lengths[I0],
                         c_m10_m11_n10_n11_thread_tensor_lengths[I1],
                         1,
                         c_m10_m11_n10_n11_thread_tensor_lengths[I2],
                         c_m10_m11_n10_n11_thread_tensor_lengths[I3]>,
                CThreadTransferSrcDstAccessOrder,
                CThreadTransferSrcDstVectorDim,
                CThreadTransferDstScalarPerVector,
                CGlobalMemoryDataOperation,
                1,
                true>{c_grid_desc_m0_m10_m11_n0_n10_n11,
                      make_multi_index(m_block_data_idx_on_grid,
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I0],
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I1],
                                       n_block_data_idx_on_grid,
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I2],
                                       c_m10_m11_n10_n11_thread_origin_idx_on_block[I3]),
                      ck::tensor_operation::element_wise::PassThrough{}}
                .Run(c_thread_desc_m0_m10_m11_n0_n10_n11,
                     make_tuple(I0, I0, I0, I0, I0, I0),
                     c_thread_buf,
                     c_grid_desc_m0_m10_m11_n0_n10_n11,
                     c_grid_buf);
        }
    }
};

} // namespace ck
