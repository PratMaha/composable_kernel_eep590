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
# rocprof --hip-trace bin/example_tall_and_skinny_gemm_splitk_fp16 1 2 1 231
# rocprof --list-basic
# rocprof --list-derived
# rocprof -i result_input.txt -o output.csv bin/example_tall_and_skinny_gemm_splitk_fp16 1 2 1 231
omniperf profile -n result/ -- bin/example_tall_and_skinny_gemm_splitk_fp16 1 2 1 231
omniperf analyze -p /work1/sadasivan/student30/composable_kernel/build_new/workloads/result/mi100 &>analysis.txt