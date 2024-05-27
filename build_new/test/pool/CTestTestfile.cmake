# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student30/composable_kernel/test/pool
# Build directory: /work1/sadasivan/student30/composable_kernel/build_new/test/pool
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_avg_pool3d_bwd "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_avg_pool3d_bwd")
set_tests_properties(test_avg_pool3d_bwd PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;3;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;0;")
add_test(test_max_pool3d_bwd "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_max_pool3d_bwd")
set_tests_properties(test_max_pool3d_bwd PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;4;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;0;")
add_test(test_avg_pool3d_fwd "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_avg_pool3d_fwd")
set_tests_properties(test_avg_pool3d_fwd PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;5;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;0;")
add_test(test_max_pool3d_fwd "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_max_pool3d_fwd")
set_tests_properties(test_max_pool3d_fwd PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;6;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/pool/CMakeLists.txt;0;")
