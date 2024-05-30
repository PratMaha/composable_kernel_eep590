{\rtf1\ansi\ansicpg1252\cocoartf2761
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Italic;\f1\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;\red0\green0\blue0;\red64\green70\blue106;
\red153\green160\blue204;\red179\green189\blue242;\red142\green199\blue87;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;\csgray\c0\c0;\cssrgb\c31765\c34902\c49020;
\cssrgb\c66275\c69412\c83922;\cssrgb\c75294\c79216\c96078;\cssrgb\c61961\c80784\c41569;}
\margl1440\margr1440\vieww19080\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\i\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec4 #!/bin/bash
\f1\i0 \strokec5 \

\f0\i \strokec4 #SBATCH --job-name=example_job
\f1\i0 \strokec5 \

\f0\i \strokec4 #SBATCH --mail-type=BEGIN,END
\f1\i0 \strokec5 \

\f0\i \strokec4 #SBATCH --nodes=1
\f1\i0 \strokec5 \

\f0\i \strokec4 #BATCH --ntasks-per-node=1
\f1\i0 \strokec5 \

\f0\i \strokec4 #SBATCH --time=03:00:00
\f1\i0 \strokec5 \

\f0\i \strokec4 #SBATCH --account=sadasivan
\f1\i0 \strokec5 \

\f0\i \strokec4 #SBATCH --partition=mi1004x
\f1\i0 \strokec5 \

\f0\i \strokec4 # or use --partition=devel if required
\f1\i0 \strokec5 \
\

\f0\i \strokec4 # Run your code. Example given below.
\f1\i0 \strokec5 \

\f0\i \strokec4 # rocprof --hip-trace bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
\f1\i0 \strokec5 \

\f0\i \strokec4 #rocprof --hsa-trace bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
\f1\i0 \strokec5 \

\f0\i \strokec4 #rocprof --sys-trace bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
\f1\i0 \strokec5 \
\pard\pardeftab720\partightenfactor0
\cf2 \strokec6 python\strokec5  \strokec7 /work1/sadasivan/student12/project/composable_kernel/pyscript_iteration.py\strokec5 \
\pard\pardeftab720\partightenfactor0

\f0\i \cf2 \strokec4 #python /work1/sadasivan/student12/project/composable_kernel/pyscript_singletile.py
\f1\i0 \strokec5 \

\f0\i \strokec4 #rocprof --list-basic bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
\f1\i0 \strokec5 \

\f0\i \strokec4 #rocprof --list-derived -o output4.csv bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
\f1\i0 \strokec5 \

\f0\i \strokec4 #rocprof -i result_input.txt -o output4.csv bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 120
\f1\i0 \strokec5 \

\f0\i \strokec4 #omniperf profile -n result -- bin/example_gemm_xdl_streamk 1 2 1 3840 4096 4096 4096 4096 4096 312
\f1\i0 \strokec5 \

\f0\i \strokec4 #omniperf analyze -p /work1/sadasivan/student12/project/composable_kernel/build/workloads/result/mi100 analysis.txt
\f1\i0 \strokec5 \
}