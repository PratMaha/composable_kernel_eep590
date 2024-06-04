import subprocess
import sys

lower_bound = int(sys.argv[1])
upper_bound = int(sys.argv[2])

for k in range(lower_bound, upper_bound):
    subprocess.run([
        'omniperf',
        'profile',
        '-n',
        f'test{k}',
        '--',
        '../ck/build/bin/example_splitK_gemm_xdl_fp16',
        '1',
        '2',
        '1',
        str(1 if k == 0 else k * 10),
        '3840',
        '4096',
        '4096',
        '4096',
        '4096',
        '4096'])

