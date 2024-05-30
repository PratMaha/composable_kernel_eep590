import subprocess

trial = 15

# rocprof = "rocprof"
# i = '-i'
# inputfile = 'result_input.txt'
# o = "-o"
# outputfile = 'output4.csv'

#adjust path according to location
cmd =  './bin/example_gemm_xdl_streamk'

verification = '1' # yes
initialization = '2' # decimal value
time_kernel = '1' # yes
M = '3840'
N = '4096'
K = '4096'
strideA = '4096'
strideB = '4096'
strideC = '4096'
kcu = '120'

file = open(f"output_{trial}.txt", "w")
# file2 = open(f"output2_{trial}.txt", "w")
# file3 = open(f"output3_{trial}.txt", "w")

for i in range(1,51):
    print(f'running iteration: {i}')
    result = subprocess.run([
            # rocprof,
            # i,
            # inputfile,
            # o,            
            # outputfile,
            cmd, 
            verification, 
            initialization, 
            time_kernel,  
            M, 
            N, 
            K, 
            strideA, 
            strideB, 
            strideC,
            kcu
        ], 
        stdout=subprocess.PIPE)
    # # Run the cat command
    # with open(f"output3_{trial}.txt", 'a') as f:
    #     subprocess.run(['cat', 'output4.csv'], stdout=f)

    
    output = result.stdout.decode()
    print(output)
    lines = output.split("\n")
    print(len(lines))

    perf_data = result.stdout.decode().split("\n")[5].split(",") #23
    print(perf_data)
    ms = float(perf_data[0].split(" ")[1])
    tflops = float(perf_data[1].split(" ")[1])
    gbs = float(perf_data[2].split(" ")[1])

    file.write(f'{i} {ms} {tflops} {gbs}\n') 

    # perf_data2 = result.stdout.decode().split("\n")[39].split(",") # 24 no profile
    # print(perf_data2)
    # maxerror = float(perf_data2[0].split(":")[1])
    # nerror = int(perf_data2[1].split(":")[1])
    # perWrong = float(perf_data2[2].split("%")[0])

    # file2.write(f'{i} {maxerror} {nerror} {perWrong}\n') 

file.close()
# file2.close()
# file3.close()
