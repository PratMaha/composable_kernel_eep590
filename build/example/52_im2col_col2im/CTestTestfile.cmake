# CMake generated Testfile for 
# Source directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/52_im2col_col2im
# Build directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/52_im2col_col2im
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(example_image_to_column_f32 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_image_to_column_f32")
set_tests_properties(example_image_to_column_f32 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/52_im2col_col2im/CMakeLists.txt;3;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/52_im2col_col2im/CMakeLists.txt;0;")
add_test(example_column_to_image_f32 "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_column_to_image_f32")
set_tests_properties(example_column_to_image_f32 PROPERTIES  _BACKTRACE_TRIPLES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/CMakeLists.txt;72;add_test;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/52_im2col_col2im/CMakeLists.txt;6;add_example_executable;/work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/52_im2col_col2im/CMakeLists.txt;0;")
