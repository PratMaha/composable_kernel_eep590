# GEMM split-k by Shangda Zhao and Yang Li

In the splitK_gemm_xdl_fp16_orign file, use the argument_sets to set the arguments of the test cases.

The value of argument_sets is in the same order as rugular arguments.

arg0: hold the place
arg1: verification (0=no, 1=yes)
arg2: initialization (0=no init, 1=integer value, 2=decimal value)\n"
arg3: time kernel (0=no, 1=yes)
arg5 to 11: M (256x), N(128x), K(32x), StrideA, StrideB, StrideC
