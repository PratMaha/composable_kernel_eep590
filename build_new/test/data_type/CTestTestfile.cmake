# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student30/composable_kernel/test/data_type
# Build directory: /work1/sadasivan/student30/composable_kernel/build_new/test/data_type
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_fp8 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_fp8")
set_tests_properties(test_fp8 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/data_type/CMakeLists.txt;8;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/data_type/CMakeLists.txt;0;")
add_test(test_bf8 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_bf8")
set_tests_properties(test_bf8 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/data_type/CMakeLists.txt;12;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/data_type/CMakeLists.txt;0;")
add_test(test_type_convert_const "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_type_convert_const")
set_tests_properties(test_type_convert_const PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/data_type/CMakeLists.txt;17;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/data_type/CMakeLists.txt;0;")
