import subprocess

cmd =  '/work1/sadasivan/student46/ck/build/bin/example_splitK_gemm_xdl_fp16'
verification = '1' # yes
initialization = '2' # decimal value
time_kernel = '1' # yes
M = '3840'
N = '4096'
K = '4096'
strideA = '4096'
strideB = '4096'
strideC = '4096'

file = open("perf_output.txt", "w")

k_batch = 1
while k_batch <= 8:
    print(f'running iteration: {k_batch}')
    result = subprocess.run([
            cmd, 
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
        ], 
        stdout=subprocess.PIPE)

    perf_data = result.stdout.decode().split("\n")[4].split(",")

    ms = float(perf_data[0].split(" ")[1])
    tflops = float(perf_data[1].split(" ")[1])
    gbs = float(perf_data[2].split(" ")[1])

    file.write(f'{k_batch} {ms} {tflops} {gbs}\n') 

    k_batch = k_batch * 2

file.close()
