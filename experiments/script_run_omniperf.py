import subprocess
import time

student_no = "student17"
cmd =  '../bin/example_gemm_xdl_streamk'
verification = '1' # yes
initialization = '2' # decimal value
time_kernel = '1' # yes
M = '3840'
N = '4096'
K = '4096'
strideA = '4096'
strideB = '4096'
strideC = '4096'
stream_k_list = list(range(1,3))

i = 0
for k_batch in stream_k_list:
    print(f'running iteration: {k_batch}')
    analysis_file_name = f"analysis_{k_batch}.txt"

    bash_script_content = f"""#!/bin/bash
# The interpreter used to execute the script

#“#SBATCH” directives that convey submission options:

#SBATCH --job-name=omniperf_profiler
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=15:00
#SBATCH --account=sadasivan
#SBATCH --partition=mi1004x

cd /work1/sadasivan/{student_no}/composable_kernel/build/results/

omniperf profile -n opf -- {cmd} {verification} {initialization} {time_kernel} {M} {N} {K} {strideA} {strideB} {strideC} {k_batch}

omniperf analyze -p /work1/sadasivan/{student_no}/composable_kernel/build/results/workloads/opf/mi100/ &> {analysis_file_name}
"""
    # Write the content to a text file
    with open("composable_kernel/build/omniperf.slurm", "w") as file:
        file.write(bash_script_content)

    command_list = ["module load rocm/5.7.1", "module load omniperf", "sbatch composable_kernel/build/omniperf.slurm"]
    for command in command_list:
        try:
            result = subprocess.run(command, shell=True, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
            output = result.stdout
            print(f"INFO: Ran command {command}")
        except Exception as e:
            print(f"ERROR: {e}")
            sys.exit()
        print(output)

    if i < len(stream_k_list) - 1:
        print(f"INFO: Sleeping 300 seconds")
        time.sleep(300)
    i += 1
