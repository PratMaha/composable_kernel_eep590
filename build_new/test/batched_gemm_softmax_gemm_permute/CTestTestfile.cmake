# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute
# Build directory: /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm_softmax_gemm_permute
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_batched_gemm_softmax_gemm_permute_fp16 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_batched_gemm_softmax_gemm_permute_fp16")
set_tests_properties(test_batched_gemm_softmax_gemm_permute_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;6;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;0;")
add_test(test_batched_gemm_bias_softmax_gemm_permute_fp16 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_batched_gemm_bias_softmax_gemm_permute_fp16")
set_tests_properties(test_batched_gemm_bias_softmax_gemm_permute_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;11;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;0;")
add_test(test_batched_gemm_softmax_gemm_permute_bf16 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_batched_gemm_softmax_gemm_permute_bf16")
set_tests_properties(test_batched_gemm_softmax_gemm_permute_bf16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;17;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;0;")
add_test(test_batched_gemm_bias_softmax_gemm_permute_bf16 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_batched_gemm_bias_softmax_gemm_permute_bf16")
set_tests_properties(test_batched_gemm_bias_softmax_gemm_permute_bf16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;22;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm_permute/CMakeLists.txt;0;")
