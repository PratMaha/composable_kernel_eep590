# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/22_cgemm
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_cgemm_xdl_bf16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_cgemm_xdl_bf16")
set_tests_properties(example_cgemm_xdl_bf16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;3;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;0;")
add_test(example_cgemm_xdl_fp16 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_cgemm_xdl_fp16")
set_tests_properties(example_cgemm_xdl_fp16 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;6;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;0;")
add_test(example_cgemm_xdl_fp32 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_cgemm_xdl_fp32")
set_tests_properties(example_cgemm_xdl_fp32 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;9;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;0;")
add_test(example_cgemm_xdl_int8 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_cgemm_xdl_int8")
set_tests_properties(example_cgemm_xdl_int8 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;12;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/22_cgemm/CMakeLists.txt;0;")
