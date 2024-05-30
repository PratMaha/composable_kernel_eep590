#!/bin/bash
#SBATCH --job-name=example_job
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#BATCH --ntasks-per-node=1
#SBATCH --time=03:00:00
#SBATCH --account=sadasivan
#SBATCH --partition=mi1004x
# or use --partition=devel if required
# Run your code. Example given below.

#rocprof --hip-trace bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
#rocprof --hsa-trace bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
#rocprof --sys-trace bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
python /work1/sadasivan/student12/project/composable_kernel/pyscript_iteration.py
#python /work1/sadasivan/student12/project/composable_kernel/pyscript_singletile.py
#rocprof --list-basic bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
#rocprof --list-derived -o output4.csv bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
#rocprof -i result_input.txt -o output4.csv bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
#omniperf profile -n result -- bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 312
#omniperf analyze -p /work1/sadasivan/student12/project/composable_kernel/build/workloads/result/mi100 analysis.txt
