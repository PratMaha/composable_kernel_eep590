# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/ohpc/pub/utils/cmake/3.25.2/bin/cmake

# The command to remove a file.
RM = /opt/ohpc/pub/utils/cmake/3.25.2/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /work1/sadasivan/student51/assignments/finalProject/composable_kernel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build

# Include any dependencies generated for this target.
include test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/compiler_depend.make

# Include the progress variables for this target.
include test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/progress.make

# Include the compile flags for this target's objects.
include test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/flags.make

test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o: test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/flags.make
test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp
test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o: test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o -MF CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o.d -o CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp

test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp > CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.i

test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp -o CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.s

# Object files for target test_grouped_gemm_two_stage_splitk
test_grouped_gemm_two_stage_splitk_OBJECTS = \
"CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o"

# External object files for target test_grouped_gemm_two_stage_splitk
test_grouped_gemm_two_stage_splitk_EXTERNAL_OBJECTS = \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_mk_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_mk_nk_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_km_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_km_nk_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_nk_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_kn_mn_irregular_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_nk_mn_irregular_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f8_f16_mk_kn_mn_irregular_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f8_f16_f16_mk_kn_mn_irregular_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_f16_f16_f16_mk_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_bf16_bf16_mk_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_bf16_bf16_mk_nk_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_i8_bf16_mk_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_i8_bf16_mk_nk_mn_instance.cpp.o"

bin/test_grouped_gemm_two_stage_splitk: test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/test_grouped_gemm_two_stage_multiple_d_splitk_xdl.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_mk_kn_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_mk_nk_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_km_kn_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_f16_f16_f16_km_nk_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_kn_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_nk_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_kn_mn_irregular_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f16_f16_mk_nk_mn_irregular_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f16_f8_f16_mk_kn_mn_irregular_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_xdl_splitk_f8_f16_f16_mk_kn_mn_irregular_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_f16_f16_f16_mk_kn_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_bf16_bf16_mk_kn_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_bf16_bf16_mk_nk_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_i8_bf16_mk_kn_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: library/src/tensor_operation_instance/gpu/grouped_gemm/CMakeFiles/device_grouped_gemm_instance.dir/device_grouped_gemm_multiple_d_splitk_xdl_two_stage_bf16_i8_bf16_mk_nk_mn_instance.cpp.o
bin/test_grouped_gemm_two_stage_splitk: test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/build.make
bin/test_grouped_gemm_two_stage_splitk: lib/libgtest_main.a
bin/test_grouped_gemm_two_stage_splitk: lib/libutility.a
bin/test_grouped_gemm_two_stage_splitk: lib/libgtest.a
bin/test_grouped_gemm_two_stage_splitk: /opt/rocm-6.0.2/lib/libamdhip64.so.6.0.60002
bin/test_grouped_gemm_two_stage_splitk: /opt/rocm-6.0.2/lib/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/test_grouped_gemm_two_stage_splitk: test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/test_grouped_gemm_two_stage_splitk"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/build: bin/test_grouped_gemm_two_stage_splitk
.PHONY : test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/build

test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm && $(CMAKE_COMMAND) -P CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/cmake_clean.cmake
.PHONY : test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/clean

test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/grouped_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/grouped_gemm/CMakeFiles/test_grouped_gemm_two_stage_splitk.dir/depend

