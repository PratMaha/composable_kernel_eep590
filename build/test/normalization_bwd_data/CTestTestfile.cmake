# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/normalization_bwd_data
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/normalization_bwd_data
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_layernorm2d_bwd_data_fp32 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_layernorm2d_bwd_data_fp32")
set_tests_properties(test_layernorm2d_bwd_data_fp32 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/normalization_bwd_data/CMakeLists.txt;3;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/normalization_bwd_data/CMakeLists.txt;0;")
add_test(test_groupnorm_bwd_data_fp32 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/test_groupnorm_bwd_data_fp32")
set_tests_properties(test_groupnorm_bwd_data_fp32 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/CMakeLists.txt;135;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/normalization_bwd_data/CMakeLists.txt;9;add_gtest_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/normalization_bwd_data/CMakeLists.txt;0;")
