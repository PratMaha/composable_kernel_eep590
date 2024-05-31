# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_batched_gemm_gemm_xdl_fp32 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_batched_gemm_gemm_xdl_fp32")
set_tests_properties(example_batched_gemm_gemm_xdl_fp32 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/CMakeLists.txt;1;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/CMakeLists.txt;0;")
add_test(example_batched_gemm_gemm_xdl_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_batched_gemm_gemm_xdl_fp16")
set_tests_properties(example_batched_gemm_gemm_xdl_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/CMakeLists.txt;2;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/CMakeLists.txt;0;")
add_test(example_batched_gemm_gemm_xdl_bf16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_batched_gemm_gemm_xdl_bf16")
set_tests_properties(example_batched_gemm_gemm_xdl_bf16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/CMakeLists.txt;3;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/CMakeLists.txt;0;")
