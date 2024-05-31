# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/20_grouped_conv_bwd_weight
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/20_grouped_conv_bwd_weight
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_grouped_conv_bwd_weight_xdl_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_grouped_conv_bwd_weight_xdl_fp16")
set_tests_properties(example_grouped_conv_bwd_weight_xdl_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/20_grouped_conv_bwd_weight/CMakeLists.txt;2;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/20_grouped_conv_bwd_weight/CMakeLists.txt;0;")
add_test(example_grouped_conv_bwd_weight_xdl_bf16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_grouped_conv_bwd_weight_xdl_bf16")
set_tests_properties(example_grouped_conv_bwd_weight_xdl_bf16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/20_grouped_conv_bwd_weight/CMakeLists.txt;5;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/20_grouped_conv_bwd_weight/CMakeLists.txt;0;")
add_test(example_grouped_conv_bwd_weight_xdl_fp16_comp_bf8_fp8 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_grouped_conv_bwd_weight_xdl_fp16_comp_bf8_fp8")
set_tests_properties(example_grouped_conv_bwd_weight_xdl_fp16_comp_bf8_fp8 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/20_grouped_conv_bwd_weight/CMakeLists.txt;8;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/20_grouped_conv_bwd_weight/CMakeLists.txt;0;")
