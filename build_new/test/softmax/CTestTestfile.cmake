# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student30/composable_kernel/test/softmax
# Build directory: /work1/sadasivan/student30/composable_kernel/build_new/test/softmax
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_softmax_rank3 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_softmax_rank3")
set_tests_properties(test_softmax_rank3 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/softmax/CMakeLists.txt;3;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/softmax/CMakeLists.txt;0;")
add_test(test_softmax_rank4 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_softmax_rank4")
set_tests_properties(test_softmax_rank4 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/softmax/CMakeLists.txt;4;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/softmax/CMakeLists.txt;0;")
add_test(test_softmax_interface "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_softmax_interface")
set_tests_properties(test_softmax_interface PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/softmax/CMakeLists.txt;5;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/softmax/CMakeLists.txt;0;")
