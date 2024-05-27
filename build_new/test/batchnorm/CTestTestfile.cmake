# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student30/composable_kernel/test/batchnorm
# Build directory: /work1/sadasivan/student30/composable_kernel/build_new/test/batchnorm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(test_batchnorm_fwd_rank_4 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_batchnorm_fwd_rank_4")
set_tests_properties(test_batchnorm_fwd_rank_4 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/batchnorm/CMakeLists.txt;1;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/batchnorm/CMakeLists.txt;0;")
add_test(test_batchnorm_bwd_rank_4 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_batchnorm_bwd_rank_4")
set_tests_properties(test_batchnorm_bwd_rank_4 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/batchnorm/CMakeLists.txt;2;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/batchnorm/CMakeLists.txt;0;")
add_test(test_batchnorm_infer_rank_4 "/work1/sadasivan/student30/composable_kernel/build_new/bin/test_batchnorm_infer_rank_4")
set_tests_properties(test_batchnorm_infer_rank_4 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student30/composable_kernel/test/CMakeLists.txt;113;add_test;/work1/sadasivan/student30/composable_kernel/test/batchnorm/CMakeLists.txt;3;add_gtest_executable;/work1/sadasivan/student30/composable_kernel/test/batchnorm/CMakeLists.txt;0;")
