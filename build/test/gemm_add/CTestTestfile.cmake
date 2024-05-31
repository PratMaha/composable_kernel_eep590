# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_add
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_gemm_add "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_add")
set_tests_properties(test_gemm_add PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;1;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;0;")
add_test(test_gemm_add_relu "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_add_relu")
set_tests_properties(test_gemm_add_relu PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;6;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;0;")
add_test(test_gemm_add_silu "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_add_silu")
set_tests_properties(test_gemm_add_silu PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;11;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;0;")
add_test(test_gemm_add_fastgelu "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_gemm_add_fastgelu")
set_tests_properties(test_gemm_add_fastgelu PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;16;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_add/CMakeLists.txt;0;")
