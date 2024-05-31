# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_grouped_gemm_splitk "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_grouped_gemm_splitk")
set_tests_properties(test_grouped_gemm_splitk PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/CMakeLists.txt;3;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/CMakeLists.txt;0;")
add_test(test_grouped_gemm_two_stage_splitk "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_grouped_gemm_two_stage_splitk")
set_tests_properties(test_grouped_gemm_two_stage_splitk PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/CMakeLists.txt;9;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/CMakeLists.txt;0;")
add_test(test_grouped_gemm_interface "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_grouped_gemm_interface")
set_tests_properties(test_grouped_gemm_interface PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/CMakeLists.txt;15;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/CMakeLists.txt;0;")
