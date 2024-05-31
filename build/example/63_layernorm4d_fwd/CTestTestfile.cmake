# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/63_layernorm4d_fwd
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/63_layernorm4d_fwd
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_layernorm4d_fwd_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_layernorm4d_fwd_fp16")
set_tests_properties(example_layernorm4d_fwd_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/63_layernorm4d_fwd/CMakeLists.txt;1;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/63_layernorm4d_fwd/CMakeLists.txt;0;")
add_test(example_layernorm4d_fwd_splitk_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_layernorm4d_fwd_splitk_fp16")
set_tests_properties(example_layernorm4d_fwd_splitk_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/63_layernorm4d_fwd/CMakeLists.txt;2;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/63_layernorm4d_fwd/CMakeLists.txt;0;")
