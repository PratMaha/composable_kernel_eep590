# Instructions for ```example_tall_and_skinny_gemm_splitk_fp16```

## Create directory
```bash
$ mkdir build
```
```bash
$ cd build
$ ../script/cmake-ck-dev.sh ..
```
After these steps, there would have abundant files generated for execution assistance.

## Load Profiler
```bash
$ module load rocm/5.7.1
$ module load omniperf
```
These steps used for load the omniperf profiler that help user to analyze the performance of the GPUs more efficiently.

## submit_jobs.sh
```bash
#!/bin/bash
#SBATCH --job-name=example_job
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:03:00
#SBATCH --account=sadasivan
#SBATCH --partition=devel
# or use --partition=mi1004x if required

 # Run your code. Example given below.
omniperf profile -n result/ -- bin/example_tall_and_skinny_gemm_splitk_fp16 1 2 1 231
omniperf analyze -p /work1/sadasivan/student30/composable_kernel/build_new/workloads/result/mi100 &>analysis.txt
```
```bash
$ sbatch ./submit_jobs.sh
```
The submit_jobs.sh file used to send the request to the server to run the profiler and generate a analysis.txt file that is user-friendly to analyze the performance.

## Run ```example_tall_and_skinny_gemm_splitk_fp16```
```bash
#arg1: verification (0=no, 1=yes)
#arg2: initialization (0=no init, 1=integer value, 2=decimal value)
#arg3: run kernel # of times (>1)
#arg4: number of splitk batches
bin/example_tall_and_skinny_gemm_splitk_fp16 1 2 1 231

```

Result (MI250 @ 800Mhz, 181.05TFlops peak FP16)
```
a_m_k: dim 2, lengths {16, 1024}, strides {1024, 1}
b_k_n: dim 2, lengths {1024, 16}, strides {16, 1}
c_m_n: dim 2, lengths {16, 16}, strides {16, 1}
Perf: 0.0065438 ms, 0.0801198 TFlops, 10.0932 GB/s, deviceTsmmDl<64, 16, 128, 4, 2, 16, 2, 1>
```
## Code Modification
## 1. 2D Array Handling in the Kernel
Include the 2D array handling within the Run function of the device written in 'gridwise_tall_and_skinny_gemm_splitk.hpp', 
and further explanation is provided in the report: 
```bash
__device__ static void Run(const Argument& karg) {
    // constexpr index_t shared_block_size =
    //     GridwiseTsmm::GetSharedMemoryNumberOfByte() / sizeof(FloatAB);
    constexpr index_t tile_size_m = MPerBlock;
    constexpr index_t tile_size_n = NPerBlock;

    __shared__ FloatAB p_shared_block[tile_size_m][tile_size_n];
   // following code ...
}
```
## 2. Block to CTile Map Code Modification

The function `convert_1D_block_idx_to_3D_tuple` written in 'block_to_ctile_map.hpp' efficiently maps a 1D block index to a 3D tuple representing different dimensions (M, N, K) of the problem space. This helps in mapping the computational tasks onto the hardware more efficiently and optimally utilizing the Compute Units (CUs). Here's a brief on how the function works:

```bash
__host__ __device__ inline constexpr auto convert_1D_block_idx_to_3D_tuple(
    const index_t& block_1d_id, const index_t& N, const index_t& k_batch) const
{
    // Calculate the number of blocks per N dimension
    const auto Ndim = math::integer_divide_ceil(N, NPerBlock);

    // Divide the 1D block index by the number of k_batch to find the overall batch position
    const auto div_k_batch = block_1d_id / k_batch;

    // Calculate the M index (Mid) by dividing the overall batch position by Ndim
    // Calculate the N index (Nid) by taking the remainder of the division of the batch position by Ndim
    // Calculate the K index (Kid) by taking the remainder of the 1D block index with k_batch
    return make_tuple(div_k_batch / Ndim,
                      div_k_batch % Ndim,
                      block_1d_id % k_batch); // returns 3D tuple as (Mid,Nid,Kid)
}
```
## 3. Block and Grid Configuration

The configuration of blocks and grids written in 'tall_and_skinny_gemm_splitk_fp16.cpp' plays a crucial role in optimizing the execution of GPU kernels for performance and accuracy. Below are the macro definitions used to set up the kernel's block and grid dimensions:

```cpp
#define K1 2   // Default setting for kernel dimension. For higher accuracy, set to 4.
#define K0 4   // Default setting for kernel dimension. For higher accuracy, set to 8.
#define N1 2   // Sets the dimension for kernel execution.
#define B 256   // Block size setting: default is 64. Can be increased to 256 for different performance characteristics.
#define M1 16  // Sets another dimension for the kernel execution.
