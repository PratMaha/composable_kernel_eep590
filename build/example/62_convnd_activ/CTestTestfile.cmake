# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/62_convnd_activ
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/62_convnd_activ
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_convnd_fwd_xdl_scaleadd_scaleadd_relu_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_convnd_fwd_xdl_scaleadd_scaleadd_relu_fp16")
set_tests_properties(example_convnd_fwd_xdl_scaleadd_scaleadd_relu_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/62_convnd_activ/CMakeLists.txt;7;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/62_convnd_activ/CMakeLists.txt;0;")
add_test(example_convnd_fwd_xdl_scaleadd_scaleadd_relu_bcasted_bias_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_convnd_fwd_xdl_scaleadd_scaleadd_relu_bcasted_bias_fp16")
set_tests_properties(example_convnd_fwd_xdl_scaleadd_scaleadd_relu_bcasted_bias_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/62_convnd_activ/CMakeLists.txt;9;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/62_convnd_activ/CMakeLists.txt;0;")
subdirs("binary")
subdirs("multi_AB")
subdirs("unary")
