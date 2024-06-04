import subprocess
import sys

for k in range(0, 51):
    print(f'iteration {k}')
    with open(f'omniperf_analysis_out/omniperf{k}.txt', "w") as outfile:
        subprocess.run([
            'omniperf',
            'analyze',
            '-p',
            f'workloads/test{k:02}/mi100/'], stdout=outfile)

