# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/33_multiple_reduce
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/33_multiple_reduce
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_dual_reduce_multiblock "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_dual_reduce_multiblock")
set_tests_properties(example_dual_reduce_multiblock PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/33_multiple_reduce/CMakeLists.txt;1;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/33_multiple_reduce/CMakeLists.txt;0;")
add_test(example_dual_reduce_threadwise "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_dual_reduce_threadwise")
set_tests_properties(example_dual_reduce_threadwise PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/33_multiple_reduce/CMakeLists.txt;2;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/33_multiple_reduce/CMakeLists.txt;0;")
