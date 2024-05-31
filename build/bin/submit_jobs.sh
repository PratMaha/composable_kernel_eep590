#!/bin/bash
#SBATCH --job-name=example_job
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=5:00
#SBATCH --account=sadasivan
#SBATCH --partition=devel 
# or use --partition=devel / mi1004xif required
 
 # Run your code. Example given below.
# omniperf profile -n bin -- ./example_splitK_gemm_xdl_fp16 1 2 1 1 3840 4096 4096 4096 4096 4096
omniperf analyze -p workloads/bin/mi100/ &> analyse_k1.txt
