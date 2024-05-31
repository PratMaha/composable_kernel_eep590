# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_gemm_fp32 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_fp32")
set_tests_properties(test_gemm_fp32 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;65;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;1;add_test_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;0;")
add_test(test_gemm_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_fp16")
set_tests_properties(test_gemm_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;65;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;5;add_test_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;0;")
add_test(test_gemm_standalone_xdl_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_standalone_xdl_fp16")
set_tests_properties(test_gemm_standalone_xdl_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;65;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;16;add_test_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;0;")
add_test(test_gemm_bf16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_bf16")
set_tests_properties(test_gemm_bf16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;65;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;21;add_test_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;0;")
add_test(test_gemm_int8 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_int8")
set_tests_properties(test_gemm_int8 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;65;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;25;add_test_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm/CMakeLists.txt;0;")
