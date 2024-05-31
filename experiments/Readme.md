# Experiments on MI100 GPU for Stream-K Optimization

This repository contains the experiments and scripts used to analyze and optimize the performance of the Stream-K algorithm on the MI100 GPU.

## Experiments

### 1. Analyzing the Effect of Number of Compute Units (CUs)
- **Objective**: To study the impact of varying the number of CUs on throughput, latency, and percentage of wrong values.
- **Goal**: To find the optimal configuration for running Stream-K on MI100.

### 2. Kernel Launch Configuration Optimization
- **Objective**: To optimize kernel launch parameters.
- **Parameters Varying**:
  - Block Size
  - MPer Block
  - NPer Block
  - MXdl Per Wave
  - NXdl Per Wave
  - ABlockTransferThreadCluster
  - BBlockTransferThreadCluster
  - CBlockTransferClusterLengths

### 3. Loop Unrolling in GridwiseGemmPipeline_v3
- **Objective**: To experiment with loop unrolling to enhance performance.

### 4. Workspace Size Alignment Experimentation
- **Objective**: To experiment with different alignment values to change the workspace size.
- **Alignment Values**: 64, 128, 256

### 5. Varying Number of CUs
- **Objective**: To experiment with the number of CUs in the range [0, 360] to observe the effects on performance.

### 6. Pipeline Optimizations
- **Prefetching and Minimizing Thread Synchronization**: Prefetching the next blocks and minimizing thread synchronization.
- **Main Loop Unrolling**: Unrolling the main loop by factors of 4 and 16.

### 7. Alignment Value Experimentation for Workspace Size
- **Objective**: To experiment with alignment values (64, 128, 256) to change workspace size and observe the effects.

## Profiling Tools
- **Rocprof**: Used for profiling the experiments.
- **Omniperf**: Used for detailed performance analysis.

## Scripts
- **Running Experiments**: 
  - Scripts to run Stream-K for varying K values and plot graphs.
  - Streamlined scripts for running Omniperf for easy profiling.
  - Scripts to convert Omniperf results from table format to JSON for further analysis.

## Setup and Usage
1. **Clone the repository**: clone the `ck_streamk_2tile_sk_dp` branch
   ```sh
   git clone -b ck_streamk_2tile_sk_dp https://github.com/arnabk001/composable_kernel_eep590.git
   ```
2. **Run the experiments**:
 - Ensure you have the necessary dependencies and environment setup as per the requirements.
 - Use the provided scripts in `experiments/scripts` directory to run your experiments.
 
 
3. **Example**

 The preferred mathod is to use sbatch to run your experiments
```sh
 python3 script.py
```
or 
```sh
sbatch script_launch.slurm
```
To reproduce the omniperf logs, change the configurations in `gemm_xdl_streamk.cpp`
and build the code binaries
```sh
make example_gemm_xdl_streamk
```
then run the omniperf prtofiler
```sh
sbatch omniperf.slurm
```
make sure you change the experiment name in both profile and analyze commands
```sh
#!/bin/bash
# The interpreter used to execute the script

#“#SBATCH” directives that convey submission options:

#SBATCH --job-name=omniperf_profiler
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=15:00
#SBATCH --account=sadasivan
#SBATCH --partition=mi1004x

module load rocm/5.7.1
module load omniperf

cd /work1/sadasivan/student36/composable_kernel/build/results/

omniperf profile -n pipelinev1 -- ../bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120

omniperf analyze -p workloads/pipelinev1/mi100 &> analysis_pipelinev1.txt
```

for other experiments, change the parameters in `block_to_ctile_map.hpp` and `gridwise_gemm_xdlops_streamk.hpp` to reproduce the results