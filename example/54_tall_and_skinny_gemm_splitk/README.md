# Instructions for ```example_gemv_splitk```

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

## Run ```example_gemv_splitk```
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
