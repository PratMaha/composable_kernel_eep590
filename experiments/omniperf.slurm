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

omniperf profile -n pipelinev34 -- ../bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120

omniperf analyze -p workloads/pipelinev34/mi100 &> analysis_pipelinev34.txt