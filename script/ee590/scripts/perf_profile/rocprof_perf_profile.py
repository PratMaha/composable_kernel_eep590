import subprocess

cmd = 'rocprof' 
args = '--stats --basenames on ./build/bin/example_splitK_gemm_xdl_fp16'
verification = '1' # yes
initialization = '2' # decimal value
time_kernel = '1' # yes
M = '3840'
N = '4096'
K = '4096'
strideA = '4096'
strideB = '4096'
strideC = '4096'

file = open("rocprof_perf_output.txt", "w")

for k in range(64):
    k_batch = k + 1
    print(f'running iteration: {k_batch}')
    subprocess.run([
            cmd,
            '--stats',
            '--basenames',
            'on',
            './build/bin/example_splitK_gemm_xdl_fp16',
            verification, 
            initialization, 
            time_kernel, 
            str(k_batch), 
            M, 
            N, 
            K, 
            strideA, 
            strideB, 
            strideC
        ])


    runtime = 0 
    with open('results.stats.csv') as results_file:
        for idx, line in enumerate(results_file.readlines()):
            if idx != 0:
                runtime = runtime + int(line.split(",")[2].strip())

    file.write(f'{k_batch} {runtime}\n') 

file.close()
