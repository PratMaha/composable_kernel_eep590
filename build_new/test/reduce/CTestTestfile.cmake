# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student30/composable_kernel/test/reduce
# Build directory: /work1/sadasivan/student30/composable_kernel/build_new/test/reduce
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_reduce_no_index "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_reduce_no_index")
set_tests_properties(test_reduce_no_index PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;53;add_test;/work1/sadasivan/student30/composable_kernel/test/reduce/CMakeLists.txt;1;add_test_executable;/work1/sadasivan/student30/composable_kernel/test/reduce/CMakeLists.txt;0;")
add_test(test_reduce_with_index "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_reduce_with_index")
set_tests_properties(test_reduce_with_index PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;53;add_test;/work1/sadasivan/student30/composable_kernel/test/reduce/CMakeLists.txt;2;add_test_executable;/work1/sadasivan/student30/composable_kernel/test/reduce/CMakeLists.txt;0;")
