// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2022, Advanced Micro Devices, Inc. All rights reserved.

#pragma once

#include "ck/utility/common_header.hpp"
#include "ck/tensor_description/multi_index_transform_helper.hpp"
#include "ck/tensor_description/tensor_descriptor.hpp"
#include "ck/tensor_description/tensor_descriptor_helper.hpp"
#include "ck/tensor_operation/gpu/grid/block_to_ctile_map.hpp"
#include "ck/tensor_operation/gpu/grid/gridwise_gemm_pipeline_selector.hpp"
#include "ck/tensor_operation/gpu/block/blockwise_gemm_wmma.hpp"
#include "ck/tensor_operation/gpu/block/thread_group_tensor_slice_transfer_v4r1.hpp"
#include "ck/tensor_operation/gpu/block/thread_group_tensor_slice_transfer_v6r3.hpp"
#include "ck/tensor_operation/gpu/thread/threadwise_tensor_slice_transfer.hpp"
#include "ck/tensor_operation/gpu/element/element_wise_operation.hpp"

#define DISABLE_C_SHUFFLE
namespace ck {

template <typename GridwiseGemm,
          typename FloatAB,
          typename FloatC,
          typename AGridDesc_K0_M_K1,
          typename BGridDesc_K0_N_K1,
          typename CGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma,
#ifndef DISABLE_C_SHUFFLE
          typename C0GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma,
          typename C1GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma,
#endif
          typename AElementwiseOperation,
          typename BElementwiseOperation,
          typename CElementwiseOperation,
          typename Block2CTileMap,
          bool HasMainKBlockLoop>
__global__ void
#if CK_USE_LAUNCH_BOUNDS
    __launch_bounds__(CK_MAX_THREAD_PER_BLOCK, CK_MIN_BLOCK_PER_CU)
#endif
        kernel_gemm_wmma_v1r1(
            const FloatAB* __restrict__ p_a_grid,
            const FloatAB* __restrict__ p_b_grid,
            FloatC* __restrict__ p_c_grid,
            const FloatC* __restrict__ p_c0_grid,
            const FloatC* __restrict__ p_c1_grid,
            const AGridDesc_K0_M_K1 a_grid_desc_k0_m_k1,
            const BGridDesc_K0_N_K1 b_grid_desc_k0_n_k1,
            const CGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma
                c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
#ifndef DISABLE_C_SHUFFLE
            const C0GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma
                c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
            const C1GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma
                c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
#endif
            const AElementwiseOperation a_element_op,
            const BElementwiseOperation b_element_op,
            const CElementwiseOperation c_element_op,
            const Block2CTileMap block_2_ctile_map)
{
#if(!defined(__HIP_DEVICE_COMPILE__) || defined(__gfx1100__))
    __shared__ char p_shared[GridwiseGemm::GetSharedMemoryNumberOfByte()];

    GridwiseGemm::template Run<HasMainKBlockLoop>(
        p_a_grid,
        p_b_grid,
        p_c_grid,
        p_c0_grid,
        p_c1_grid,
        p_shared,
        a_grid_desc_k0_m_k1,
        b_grid_desc_k0_n_k1,
        c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
#ifndef DISABLE_C_SHUFFLE
        c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
        c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
#endif
        a_element_op,
        b_element_op,
        c_element_op,
        block_2_ctile_map);
#else
    ignore = p_a_grid;
    ignore = p_b_grid;
    ignore = p_c_grid;
    ignore = p_c0_grid;
    ignore = p_c1_grid;
    ignore = a_grid_desc_k0_m_k1;
    ignore = b_grid_desc_k0_n_k1;
    ignore = c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma;
    ignore = c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma;
    ignore = c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma;
    ignore = a_element_op;
    ignore = b_element_op;
    ignore = c_element_op;
    ignore = block_2_ctile_map;
#endif // end of if (defined(__gfx1100__))
}

template <
    index_t BlockSize,
    typename FloatAB,
    typename FloatAcc,
    typename FloatC,
    InMemoryDataOperationEnum CGlobalMemoryDataOperation,
    typename AGridDesc_K0_M_K1,
    typename BGridDesc_K0_N_K1,
    typename CGridDesc_M_N,
    typename C0GridDesc_M_N,
    typename C1GridDesc_M_N,
    typename AElementwiseOperation,
    typename BElementwiseOperation,
    typename CElementwiseOperation,
    index_t MPerBlock,
    index_t NPerBlock,
    index_t K0PerBlock,
    index_t MPerWmma,
    index_t NPerWmma,
    index_t K1Value,
    index_t MWmmaPerWave,
    index_t NWmmaPerWave,
    typename ABlockTransferThreadClusterLengths_K0_M_K1,
    typename ABlockTransferThreadClusterArrangeOrder,
    typename ABlockTransferSrcAccessOrder,
    index_t ABlockTransferSrcVectorDim,
    index_t ABlockTransferSrcScalarPerVector,
    index_t ABlockTransferDstScalarPerVector_K1,
    bool AThreadTransferSrcResetCoordinateAfterRun,
    bool ABlockLdsExtraM,
    typename BBlockTransferThreadClusterLengths_K0_N_K1,
    typename BBlockTransferThreadClusterArrangeOrder,
    typename BBlockTransferSrcAccessOrder,
    index_t BBlockTransferSrcVectorDim,
    index_t BBlockTransferSrcScalarPerVector,
    index_t BBlockTransferDstScalarPerVector_K1,
    bool BThreadTransferSrcResetCoordinateAfterRun,
    bool BBlockLdsExtraN,
    index_t CShuffleMWmmaPerWavePerShuffle,
    index_t CShuffleNWmmaPerWavePerShuffle,
    typename CBlockTransferClusterLengths_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma,
    index_t CBlockTransferScalarPerVector_NWaveNPerWmma,
    index_t NumGemmKPrefetchStage = 1,
    PipelineVersion PipelineVer   = PipelineVersion::v1>
struct GridwiseGemm_k0mk1_k0nk1_mn_wmma_v1
{
    static constexpr auto I0 = Number<0>{};
    static constexpr auto I1 = Number<1>{};
    static constexpr auto I2 = Number<2>{};
    static constexpr auto I3 = Number<3>{};
    static constexpr auto I4 = Number<4>{};
    static constexpr auto I5 = Number<5>{};
    static constexpr auto I6 = Number<6>{};
    static constexpr auto I7 = Number<7>{};

    // K1 should be Number<...>
    static constexpr auto K1 = Number<K1Value>{};

    using ThisThreadBlock = ThisThreadBlock<BlockSize>;

    using GridwiseGemmPipe = remove_cvref_t<decltype(
        GridwiseGemmPipeline_Selector<PipelineVer, NumGemmKPrefetchStage>())>;

    __host__ __device__ static constexpr auto GetABlockDescriptor_K0PerBlock_K10_MPerBlock_K1PerInst()
    {
        constexpr auto inst_max_size = 16 / sizeof(FloatAB);
        constexpr auto k1perinst = (K1 <inst_max_size) ? K1 : inst_max_size;
        constexpr auto K10 = K1 / k1perinst;

        // A matrix in LDS memory, dst of blockwise copy
        constexpr auto a_block_desc_k0_k10_m_k1perinst = [&]() {
            // May have static err
            return make_naive_tensor_descriptor_aligned(
                make_tuple(Number<K0PerBlock>{}, K10, Number<MPerBlock>{}, k1perinst), k1perinst);
        }();

        return a_block_desc_k0_k10_m_k1perinst;
    }

    __host__ __device__ static constexpr auto GetBBlockDescriptor_K0PerBlock_K10_NPerBlock_K1PerInst()
    {
        constexpr auto inst_max_size = 16 / sizeof(FloatAB);
        constexpr auto k1perinst = (K1 <inst_max_size) ? K1 : inst_max_size;
        constexpr auto K10 = K1 / k1perinst;

        // B matrix in LDS memory, dst of blockwise copy
        constexpr auto b_block_desc_k0_k10_n_k1perinst = [&]() {
            return make_naive_tensor_descriptor_aligned(
                 make_tuple(Number<K0PerBlock>{}, K10, Number<NPerBlock>{}, k1perinst), k1perinst);
        }();

        return b_block_desc_k0_k10_n_k1perinst;
    }

    __host__ __device__ static constexpr auto
    GetCBlockDescriptor_MBlock_NWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma()
    {
        constexpr index_t MWave = MPerBlock / (MWmmaPerWave * MPerWmma);
        constexpr index_t NWave = NPerBlock / (NWmmaPerWave * NPerWmma);

        constexpr auto
            c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma =
                make_naive_tensor_descriptor_packed(
                    make_tuple(I1,
                               Number<CShuffleMWmmaPerWavePerShuffle>{},
                               Number<MWave * MPerWmma>{},
                               I1,
                               Number<CShuffleNWmmaPerWavePerShuffle>{},
                               Number<NWave * NPerWmma>{}));

        return c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma;
    }

    __host__ __device__ static constexpr index_t GetSharedMemoryNumberOfByte()
    {
        // LDS allocation for A and B: be careful of alignment
        constexpr auto a_block_desc_k0_k10_m_k1perinst = GetABlockDescriptor_K0PerBlock_K10_MPerBlock_K1PerInst();

        constexpr auto b_block_desc_k0_k10_n_k1perinst = GetBBlockDescriptor_K0PerBlock_K10_NPerBlock_K1PerInst();

        constexpr auto max_lds_align = a_block_desc_k0_k10_m_k1perinst.GetLength(I3);

        constexpr auto a_block_space_size_aligned =
            math::integer_least_multiple(a_block_desc_k0_k10_m_k1perinst.GetElementSpaceSize(), max_lds_align);

        constexpr auto b_block_space_size_aligned =
            math::integer_least_multiple(b_block_desc_k0_k10_n_k1perinst.GetElementSpaceSize(), max_lds_align);
        
        constexpr auto c_block_size = 0;
#ifndef DISABLE_C_SHUFFLE
        // LDS allocation for C shuffle in LDS
        constexpr auto c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma =
            GetCBlockDescriptor_MBlock_NWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma();

        constexpr auto c_block_size =
            c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma
                .GetElementSpaceSize();
#endif
        return math::max((a_block_space_size_aligned + b_block_space_size_aligned) *
                             sizeof(FloatAB),
                         c_block_size * sizeof(FloatC));
    }

    // block_id to matrix tile idx (m0, n0) mapping are controlled by {M01, N01}
    template <typename Block2CTileMap>
    __host__ __device__ static constexpr bool
    CheckValidity(const AGridDesc_K0_M_K1& a_grid_desc_k0_m_k1,
                  const BGridDesc_K0_N_K1& b_grid_desc_k0_n_k1,
                  const CGridDesc_M_N& c_grid_desc_m_n,
                  const Block2CTileMap& block_2_ctile_map)
    {
        static_assert(is_known_at_compile_time<remove_cv_t<decltype(K1)>>::value,
                      "wrong! K1 need to be known at compile-time");

        static_assert((MPerBlock % (MPerWmma * MWmmaPerWave) == 0) &&
                          (NPerBlock % (NWmmaPerWave * NPerWmma)) == 0,
                      "Invalid tuning param!");

        const auto M  = a_grid_desc_k0_m_k1.GetLength(I1);
        const auto N  = b_grid_desc_k0_n_k1.GetLength(I1);
        const auto K0 = a_grid_desc_k0_m_k1.GetLength(I0);

        if(!(M == c_grid_desc_m_n.GetLength(I0) && N == c_grid_desc_m_n.GetLength(I1) &&
             K0 == b_grid_desc_k0_n_k1.GetLength(I0) && K1 == a_grid_desc_k0_m_k1.GetLength(I2) &&
             K1 == b_grid_desc_k0_n_k1.GetLength(I2)))
            return false;

        if(!(M % MPerBlock == 0 && N % NPerBlock == 0 && K0 % K0PerBlock == 0))
            return false;

        // check gridwise gemm pipeline
        const auto num_k_loop = K0 / K0PerBlock;

        if(!GridwiseGemmPipe::IsSupported(num_k_loop))
        {
            return false;
        }

        if(!block_2_ctile_map.CheckValidity(c_grid_desc_m_n))
        {
            return false;
        }

        // TODO: also check validity of all components (blockwise-copy, threadwise-copy, etc)
        return true;
    }

    __host__ __device__ static constexpr bool CalculateHasMainKBlockLoop(index_t K)
    {
        const index_t num_loop = K / (K0PerBlock * K1);

        return GridwiseGemmPipe::CalculateHasMainLoop(num_loop);
    }

    template <typename CGridDesc_M_N_>
    __host__ __device__ static constexpr auto
    MakeCGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma(
        const CGridDesc_M_N_& c_grid_desc_m_n)
    {
        const auto M = c_grid_desc_m_n.GetLength(I0);
        const auto N = c_grid_desc_m_n.GetLength(I1);

        const auto MBlock = M / MPerBlock;
        const auto NBlock = N / NPerBlock;

        constexpr index_t MWave = MPerBlock / (MWmmaPerWave * MPerWmma);
        constexpr index_t NWave = NPerBlock / (NWmmaPerWave * NPerWmma);

        const auto c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma =
            transform_tensor_descriptor(
                c_grid_desc_m_n,
                make_tuple(make_unmerge_transform(make_tuple(
                               MBlock, Number<MWmmaPerWave>{}, Number<MWave * MPerWmma>{})),
                           make_unmerge_transform(make_tuple(
                               NBlock, Number<NWmmaPerWave>{}, Number<NWave * NPerWmma>{}))),
                make_tuple(Sequence<0>{}, Sequence<1>{}),
                make_tuple(Sequence<0, 1, 2>{}, Sequence<3, 4, 5>{}));

        return c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma;
    }

    // return block_id to C matrix tile idx (m0, n0) mapping
    __host__ __device__ static constexpr auto MakeDefaultBlock2CTileMap(
        const CGridDesc_M_N& c_grid_desc_m_n, index_t /* M01 */, index_t /* N01 */)
    {
        return BlockToCTileMap_M00_N0_M01Adapt<MPerBlock, NPerBlock, CGridDesc_M_N>(
            c_grid_desc_m_n);
    }
    using CGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma =
        remove_cvref_t<decltype(
            MakeCGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma(
                CGridDesc_M_N{}))>;
#ifndef DISABLE_C_SHUFFLE 
    using C0GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma =
        remove_cvref_t<decltype(
            MakeCGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma(
                C0GridDesc_M_N{}))>;

    using C1GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma =
        remove_cvref_t<decltype(
            MakeCGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma(
                C1GridDesc_M_N{}))>;
#endif
    using DefaultBlock2CTileMap =
        remove_cvref_t<decltype(MakeDefaultBlock2CTileMap(CGridDesc_M_N{}, 1, 1))>;

    template <bool HasMainKBlockLoop, typename Block2CTileMap>
    __device__ static void
    Run(const FloatAB* __restrict__ p_a_grid,
        const FloatAB* __restrict__ p_b_grid,
        FloatC* __restrict__ p_c_grid,
        const FloatC* __restrict__ p_c0_grid,
        const FloatC* __restrict__ p_c1_grid,
        void* __restrict__ p_shared,
        const AGridDesc_K0_M_K1& a_grid_desc_k0_m_k1,
        const BGridDesc_K0_N_K1& b_grid_desc_k0_n_k1,
        const CGridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma&
            c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
#ifndef DISABLE_C_SHUFFLE 
        const C0GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma&
            c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
        const C1GridDescriptor_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma&
            c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
#endif
        const AElementwiseOperation& a_element_op,
        const BElementwiseOperation& b_element_op,
        const CElementwiseOperation& c_element_op,
        const Block2CTileMap& block_2_ctile_map)
    {
        const auto a_grid_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_a_grid, a_grid_desc_k0_m_k1.GetElementSpaceSize());
        const auto b_grid_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_b_grid, b_grid_desc_k0_n_k1.GetElementSpaceSize());
        auto c_grid_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_c_grid,
            c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma
                .GetElementSpaceSize());
#ifndef DISABLE_C_SHUFFLE     
        auto c0_grid_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_c0_grid,
            c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma
                .GetElementSpaceSize());
        auto c1_grid_buf = make_dynamic_buffer<AddressSpaceEnum::Global>(
            p_c1_grid,
            c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma
                .GetElementSpaceSize());
#endif
        const auto K0 = a_grid_desc_k0_m_k1.GetLength(I0);

        // divide block work by [M, N]
        const auto block_work_idx =
            block_2_ctile_map.CalculateBottomIndex(make_multi_index(get_block_1d_id()));

        if(!block_2_ctile_map.ValidCTileIndex(
               block_work_idx,
               make_tuple(
                   c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma
                       .GetLength(I0),
                   c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma
                       .GetLength(I3))))
        {
            return;
        }

        // HACK: this force m/n_block_data_idx_on_grid into SGPR
        const index_t m_block_data_idx_on_grid =
            __builtin_amdgcn_readfirstlane(block_work_idx[I0] * MPerBlock);

        const index_t n_block_data_idx_on_grid =
            __builtin_amdgcn_readfirstlane(block_work_idx[I1] * NPerBlock);

        // A matrix in LDS memory, dst of blockwise copy
        constexpr auto a_block_desc_k0_k10_m_k1perinst = GetABlockDescriptor_K0PerBlock_MPerBlock_K10_K1PerInst();

        // B matrix in LDS memory, dst of blockwise copy
        constexpr auto b_block_desc_k0_k10_n_k1perinst = GetBBlockDescriptor_K0PerBlock_NPerBlock_K10_K1PerInst();

        // lds max alignment
        constexpr auto max_lds_align = a_block_desc_k0_m_k10_k11.GetLength(I3);

        // A matrix blockwise copy
        auto a_blockwise_copy =
            ThreadGroupTensorSliceTransfer_v4r1<        ThisThreadBlock,
/* typename SrcElementwiseOperation,              */    AElementwiseOperation,
/* typename DstElementwiseOperation,              */    ck::tensor_operation::element_wise::PassThrough,
/* InMemoryDataOperationEnum DstInMemOp,          */    InMemoryDataOperationEnum::Set,
/* typename BlockSliceLengths,                    */    Sequence<K0PerBlock, MPerBlock, K1>,
/* typename ThreadClusterLengths,                 */    ABlockTransferThreadClusterLengths_K0_M_K1,
/* typename ThreadClusterArrangeOrder,            */    ABlockTransferThreadClusterArrangeOrder,
/* typename SrcData,                              */    FloatAB,
/* typename DstData,                              */    FloatAB,
/* typename SrcDesc,                              */    decltype(a_grid_desc_k0_m_k1),
/* typename DstDesc,                              */    decltype(a_block_desc_k0_k10_m_k1perinst),
/* typename SrcDimAccessOrder,                    */    ABlockTransferSrcAccessOrder,
/* typename DstDimAccessOrder,                    */    Sequence<1, 0, 2>,
/* index_t SrcVectorDim,                          */    ABlockTransferSrcVectorDim,
/* index_t DstVectorDim,                          */    2,
/* index_t SrcScalarPerVector,                    */    ABlockTransferSrcScalarPerVector,
/* index_t DstScalarPerVector,                    */    ABlockTransferDstScalarPerVector_K1,
/* index_t SrcScalarStrideInVector,               */    1,
/* index_t DstScalarStrideInVector,               */    1,
/* bool ThreadTransferSrcResetCoordinateAfterRun, */    AThreadTransferSrcResetCoordinateAfterRun,
/* bool ThreadTransferDstResetCoordinateAfterRun, */    true>(
                a_grid_desc_k0_m_k1,
                make_multi_index(0, m_block_data_idx_on_grid, 0),
                a_element_op,
                a_block_desc_k0_k10_m_k1perinst,
                make_multi_index(0, 0, 0),
                ck::tensor_operation::element_wise::PassThrough{});

        // B matrix blockwise copy
        auto b_blockwise_copy =
            ThreadGroupTensorSliceTransfer_v4r1<ThisThreadBlock,
                                                BElementwiseOperation,
                                                ck::tensor_operation::element_wise::PassThrough,
                                                InMemoryDataOperationEnum::Set,
                                                Sequence<K0PerBlock, NPerBlock, K1>,
                                                BBlockTransferThreadClusterLengths_K0_N_K1,
                                                BBlockTransferThreadClusterArrangeOrder,
                                                FloatAB,
                                                FloatAB,
                                                decltype(b_grid_desc_k0_n_k1),
                                                decltype(b_block_desc_k0_k10_n_k1perinst),
                                                BBlockTransferSrcAccessOrder,
                                                Sequence<1, 0, 2>,
                                                BBlockTransferSrcVectorDim,
                                                2,
                                                BBlockTransferSrcScalarPerVector,
                                                BBlockTransferDstScalarPerVector_K1,
                                                1,
                                                1,
                                                BThreadTransferSrcResetCoordinateAfterRun,
                                                true>(
                b_grid_desc_k0_n_k1,
                make_multi_index(0, n_block_data_idx_on_grid, 0),
                b_element_op,
                b_block_desc_k0_k10_n_k1perinst,
                make_multi_index(0, 0, 0),
                ck::tensor_operation::element_wise::PassThrough{});

        // GEMM definition
        //   c_mtx += transpose(a_mtx) * b_mtx
        //     a_mtx[K0PerBlock, MPerBlock] is in LDS
        //     b_mtx[K0PerBlock, NPerBlock] is in LDS
        //     c_mtx[MPerBlock, NPerBlock] is distributed among threads, and saved in
        //       register
        // sanity check

        auto blockwise_gemm =
            BlockwiseGemmWmmaops_k0mk1_k0nk1_m0n0m1n1m2m3m4n2_v1<BlockSize,
                                                                FloatAB,
                                                                FloatAcc,
                                                                decltype(a_block_desc_k0_k10_m_k1perinst),
                                                                decltype(b_block_desc_k0_k10_n_k1perinst),
                                                                MPerWmma,
                                                                NPerWmma,
                                                                MWmmaPerWave,
                                                                NWmmaPerWave,
                                                                K1>{};

        auto c_thread_buf = blockwise_gemm.GetCThreadBuffer();

        // LDS allocation for A and B: be careful of alignment
        constexpr auto a_block_space_size_aligned =
            math::integer_least_multiple(a_block_desc_k0_k10_m_k1perinst.GetElementSpaceSize(), max_lds_align);

        auto a_block_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            static_cast<FloatAB*>(p_shared), a_block_desc_k0_k10_m_k1perinst.GetElementSpaceSize());

        auto b_block_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
            static_cast<FloatAB*>(p_shared) + a_block_space_size_aligned,
            b_block_desc_k0_k10_n_k1perinst.GetElementSpaceSize());

        constexpr auto a_block_slice_copy_step = make_multi_index(K0PerBlock, 0, 0);
        constexpr auto b_block_slice_copy_step = make_multi_index(K0PerBlock, 0, 0);

        // gridwise GEMM pipeline
        const index_t K0BlockMainLoop = __builtin_amdgcn_readfirstlane(K0 / K0PerBlock);

        GridwiseGemmPipe::template Run<HasMainKBlockLoop>(a_grid_desc_k0_m_k1,
                                                          a_block_desc_k0_k10_m_k1perinst,
                                                          a_blockwise_copy,
                                                          a_grid_buf,
                                                          a_block_buf,
                                                          a_block_slice_copy_step,
                                                          b_grid_desc_k0_n_k1,
                                                          b_block_desc_k0_k10_n_k1perinst,
                                                          b_blockwise_copy,
                                                          b_grid_buf,
                                                          b_block_buf,
                                                          b_block_slice_copy_step,
                                                          blockwise_gemm,
                                                          c_thread_buf,
                                                          K0BlockMainLoop);
#ifndef DISABLE_C_SHUFFLE  
        // shuffle C and write out
        {
            static_assert(MWmmaPerWave % CShuffleMWmmaPerWavePerShuffle == 0 &&
                              NWmmaPerWave % CShuffleNWmmaPerWavePerShuffle == 0,
                          "wrong!");

            constexpr index_t MWave = MPerBlock / (MWmmaPerWave * MPerWmma);
            constexpr index_t NWave = NPerBlock / (NWmmaPerWave * NPerWmma);

            // TODO: hacky, fix it!
            constexpr auto c_thread_desc_m0_n0_m1_n1_m2_m3_m4_n2 =
                blockwise_gemm.GetCThreadDescriptor_M0_N0_M1_N1_M2_M3_M4_N2();

            // TODO: hacky, fix it!
            // c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp is only used to get lengths
            constexpr auto c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp =
                blockwise_gemm.GetCBlockDescriptor_M0_N0_M1_N1_M2_M3_M4_N2();

            constexpr auto M0 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I0);
            constexpr auto N0 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I1);
            constexpr auto M1 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I2);
            constexpr auto N1 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I3);
            constexpr auto M2 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I4);
            constexpr auto M3 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I5);
            constexpr auto M4 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I6);
            constexpr auto N2 = c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2_tmp.GetLength(I7);

            constexpr auto c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma =
                GetCBlockDescriptor_MBlock_NWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma();

            auto c_block_buf = make_dynamic_buffer<AddressSpaceEnum::Lds>(
                static_cast<FloatC*>(p_shared),
                c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma
                    .GetElementSpaceSize());

            constexpr auto c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2 = transform_tensor_descriptor(
                c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                make_tuple(make_freeze_transform(I0), // freeze mblock
                           make_pass_through_transform(
                               Number<CShuffleMWmmaPerWavePerShuffle>{}), // M0 (MWmmaPerWave) per
                                                                         // shuffle
                           make_unmerge_transform(
                               make_tuple(M1, M2, M3, M4)), // M1 = MWave, M2 * M3 * M4 = MPerWmma
                           make_freeze_transform(I0),       // freeze nblock
                           make_pass_through_transform(
                               Number<CShuffleNWmmaPerWavePerShuffle>{}), // N0 (NWmmaPerWave) per
                                                                         // shuffle
                           make_unmerge_transform(
                               make_tuple(N1, N2))), // M1 = MWave, M2 * M3 * M4 = MPerWmma
                make_tuple(Sequence<0>{},
                           Sequence<1>{},
                           Sequence<2>{},
                           Sequence<3>{},
                           Sequence<4>{},
                           Sequence<5>{}),
                make_tuple(Sequence<>{},
                           Sequence<0>{},
                           Sequence<2, 4, 5, 6>{},
                           Sequence<>{},
                           Sequence<1>{},
                           Sequence<3, 7>{})

            );

            // calculate origin of thread output tensor on global memory
            //     blockwise GEMM c matrix starting index
            const auto c_thread_mtx_on_block =
                blockwise_gemm.CalculateCThreadOriginDataIndex(I0, I0, I0, I0);

            const index_t m_thread_data_on_block = c_thread_mtx_on_block[I0];
            const index_t n_thread_data_on_block = c_thread_mtx_on_block[I1];

            const auto m_thread_data_on_block_to_m0_m1_m2_m3_m4_adaptor =
                make_single_stage_tensor_adaptor(
                    make_tuple(make_merge_transform(make_tuple(M0, M1, M2, M3, M4))),
                    make_tuple(Sequence<0, 1, 2, 3, 4>{}),
                    make_tuple(Sequence<0>{}));

            const auto m_thread_data_on_block_idx =
                m_thread_data_on_block_to_m0_m1_m2_m3_m4_adaptor.CalculateBottomIndex(
                    make_multi_index(m_thread_data_on_block));

            const auto n_thread_data_on_block_to_n0_n1_n2_adaptor =
                make_single_stage_tensor_adaptor(
                    make_tuple(make_merge_transform(make_tuple(N0, N1, N2))),
                    make_tuple(Sequence<0, 1, 2>{}),
                    make_tuple(Sequence<0>{}));

            const auto n_thread_data_on_block_idx =
                n_thread_data_on_block_to_n0_n1_n2_adaptor.CalculateBottomIndex(
                    make_multi_index(n_thread_data_on_block));

            // VGPR to LDS
            auto c_thread_copy_vgpr_to_lds =
                ThreadwiseTensorSliceTransfer_v1r3<FloatAcc,
                                                   FloatC,
                                                   decltype(c_thread_desc_m0_n0_m1_n1_m2_m3_m4_n2),
                                                   decltype(c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2),
                                                   ck::tensor_operation::element_wise::PassThrough,
                                                   Sequence<CShuffleMWmmaPerWavePerShuffle,
                                                            CShuffleNWmmaPerWavePerShuffle,
                                                            I1,
                                                            I1,
                                                            M2,
                                                            I1,
                                                            M4,
                                                            I1>,
                                                   Sequence<0, 1, 2, 3, 4, 5, 6, 7>,
                                                   7,
                                                   1,
                                                   InMemoryDataOperationEnum::Set,
                                                   1,
                                                   true>{
                    c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2,
                    make_multi_index(0,
                                     0,
                                     m_thread_data_on_block_idx[I1],
                                     n_thread_data_on_block_idx[I1],
                                     m_thread_data_on_block_idx[I2],
                                     m_thread_data_on_block_idx[I3],
                                     m_thread_data_on_block_idx[I4],
                                     n_thread_data_on_block_idx[I2]),
                    ck::tensor_operation::element_wise::PassThrough{}};

            auto c_block_copy_lds_to_global = ThreadGroupTensorSliceTransfer_v6r3<
                ThisThreadBlock,            // ThreadGroup
                CElementwiseOperation,      // ElementwiseOperation,
                CGlobalMemoryDataOperation, // DstInMemOp,
                Sequence<1,
                         CShuffleMWmmaPerWavePerShuffle,
                         MWave * MPerWmma,
                         1,
                         CShuffleNWmmaPerWavePerShuffle,
                         NWave * NPerWmma>, // BlockSliceLengths,
                CBlockTransferClusterLengths_MBlock_MWmmaPerWave_MWaveMPerWmma_NBlock_NWmmaPerWave_NWaveNPerWmma,
                Sequence<0, 1, 2, 3, 4, 5>, // typename ThreadClusterArrangeOrder,
                FloatC,                     // typename Src0Data,
                FloatC,                     // typename Src1Data,
                FloatC,                     // typename Src2Data,
                FloatC,                     // typename DstData,
                decltype(
                    c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma),
                decltype(
                    c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma),
                decltype(
                    c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma),
                decltype(
                    c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma),
                Sequence<0, 1, 2, 3, 4, 5>,                 // typename DimAccessOrder,
                5,                                          // index_t VectorDim,
                CBlockTransferScalarPerVector_NWaveNPerWmma, // index_t ScalarPerVector,
                true,  // bool ThreadTransferSrc0ResetCoordinateAfterRun,
                false, // bool ThreadTransferSrc1ResetCoordinateAfterRun,
                false, // bool ThreadTransferSrc2ResetCoordinateAfterRun,
                false> // bool ThreadTransferDstResetCoordinateAfterRun>
                {c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                 make_multi_index(0, 0, 0, 0, 0, 0),
                 c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                 make_multi_index(block_work_idx[I0], 0, 0, block_work_idx[I1], 0, 0),
                 c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                 make_multi_index(block_work_idx[I0], 0, 0, block_work_idx[I1], 0, 0),
                 c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                 make_multi_index(block_work_idx[I0], 0, 0, block_work_idx[I1], 0, 0),
                 c_element_op};

            constexpr auto mwmmaperwave_forward_step =
                make_multi_index(0, CShuffleMWmmaPerWavePerShuffle, 0, 0, 0, 0);
            constexpr auto nwmmaperwave_forward_step =
                make_multi_index(0, 0, 0, 0, CShuffleNWmmaPerWavePerShuffle, 0);
            constexpr auto nwmmaperwave_backward_step =
                make_multi_index(0, 0, 0, 0, -CShuffleNWmmaPerWavePerShuffle, 0);

            static_for<0, MWmmaPerWave, CShuffleMWmmaPerWavePerShuffle>{}([&](auto mwmmaperwave_iter) {
                constexpr auto mwmmaperwave = mwmmaperwave_iter;

                static_for<0,
                           NWmmaPerWave,
                           CShuffleNWmmaPerWavePerShuffle>{}([&](auto nwmmaperwave_iter) {
                    constexpr bool nwmmaperwave_forward_sweep =
                        (mwmmaperwave % (2 * CShuffleMWmmaPerWavePerShuffle) == 0);

                    constexpr index_t nwmmaperwave_value =
                        nwmmaperwave_forward_sweep
                            ? nwmmaperwave_iter
                            : (NWmmaPerWave - nwmmaperwave_iter - CShuffleNWmmaPerWavePerShuffle);

                    constexpr auto nwmmaperwave = Number<nwmmaperwave_value>{};

                    // make sure it's safe to do ds_write
                    block_sync_lds();

                    // VGPR to LDS
                    c_thread_copy_vgpr_to_lds.Run(
                        c_thread_desc_m0_n0_m1_n1_m2_m3_m4_n2,
                        make_tuple(mwmmaperwave, nwmmaperwave, I0, I0, I0, I0, I0, I0),
                        c_thread_buf,
                        c_block_desc_m0_n0_m1_n1_m2_m3_m4_n2,
                        c_block_buf);

                    // make sure it's safe to do ds_read
                    block_sync_lds();

                    // LDS to global
                    c_block_copy_lds_to_global.Run(
                        c_block_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                        c_block_buf,
                        c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                        c0_grid_buf,
                        c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                        c1_grid_buf,
                        c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                        c_grid_buf);

                    // move on nwmmaperwave dimension
                    if constexpr(nwmmaperwave_forward_sweep &&
                                 (nwmmaperwave < NWmmaPerWave - CShuffleNWmmaPerWavePerShuffle))
                    {
                        c_block_copy_lds_to_global.MoveSrc1SliceWindow(
                            c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                            nwmmaperwave_forward_step);

                        c_block_copy_lds_to_global.MoveSrc2SliceWindow(
                            c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                            nwmmaperwave_forward_step);

                        c_block_copy_lds_to_global.MoveDstSliceWindow(
                            c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                            nwmmaperwave_forward_step);
                    }
                    else if constexpr((!nwmmaperwave_forward_sweep) && (nwmmaperwave > 0))
                    {
                        c_block_copy_lds_to_global.MoveSrc1SliceWindow(
                            c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                            nwmmaperwave_backward_step);

                        c_block_copy_lds_to_global.MoveSrc2SliceWindow(
                            c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                            nwmmaperwave_backward_step);

                        c_block_copy_lds_to_global.MoveDstSliceWindow(
                            c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                            nwmmaperwave_backward_step);
                    }
                });

                // move on mwmmaperwave dimension
                if constexpr(mwmmaperwave < MWmmaPerWave - CShuffleMWmmaPerWavePerShuffle)
                {
                    c_block_copy_lds_to_global.MoveSrc1SliceWindow(
                        c0_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                        mwmmaperwave_forward_step);

                    c_block_copy_lds_to_global.MoveSrc2SliceWindow(
                        c1_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                        mwmmaperwave_forward_step);

                    c_block_copy_lds_to_global.MoveDstSliceWindow(
                        c_grid_desc_mblock_mwmmaperwave_mwavemperwmma_nblock_nwmmaperwave_nwavenperwmma,
                        mwmmaperwave_forward_step);
                }
            });
        }
#endif
    }
};

} // namespace ck
