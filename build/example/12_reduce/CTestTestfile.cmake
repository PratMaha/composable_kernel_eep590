# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/12_reduce
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/12_reduce
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_reduce_blockwise "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_reduce_blockwise")
set_tests_properties(example_reduce_blockwise PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/12_reduce/CMakeLists.txt;1;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/12_reduce/CMakeLists.txt;0;")
add_test(example_reduce_multiblock_atomic_add "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_reduce_multiblock_atomic_add")
set_tests_properties(example_reduce_multiblock_atomic_add PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/12_reduce/CMakeLists.txt;2;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/12_reduce/CMakeLists.txt;0;")
add_test(example_reduce_blockwise_two_call "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_reduce_blockwise_two_call")
set_tests_properties(example_reduce_blockwise_two_call PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/12_reduce/CMakeLists.txt;3;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/12_reduce/CMakeLists.txt;0;")
