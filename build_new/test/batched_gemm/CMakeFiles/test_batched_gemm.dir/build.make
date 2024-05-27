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
CMAKE_SOURCE_DIR = /work1/sadasivan/student30/composable_kernel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /work1/sadasivan/student30/composable_kernel/build_new

# Include any dependencies generated for this target.
include test/batched_gemm/CMakeFiles/test_batched_gemm.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/batched_gemm/CMakeFiles/test_batched_gemm.dir/compiler_depend.make

# Include the progress variables for this target.
include test/batched_gemm/CMakeFiles/test_batched_gemm.dir/progress.make

# Include the compile flags for this target's objects.
include test/batched_gemm/CMakeFiles/test_batched_gemm.dir/flags.make

test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o: test/batched_gemm/CMakeFiles/test_batched_gemm.dir/flags.make
test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o: /work1/sadasivan/student30/composable_kernel/test/batched_gemm/test_batched_gemm.cpp
test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o: test/batched_gemm/CMakeFiles/test_batched_gemm.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o -MF CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o.d -o CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o -c /work1/sadasivan/student30/composable_kernel/test/batched_gemm/test_batched_gemm.cpp

test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.i"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student30/composable_kernel/test/batched_gemm/test_batched_gemm.cpp > CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.i

test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.s"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student30/composable_kernel/test/batched_gemm/test_batched_gemm.cpp -o CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.s

# Object files for target test_batched_gemm
test_batched_gemm_OBJECTS = \
"CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o"

# External object files for target test_batched_gemm
test_batched_gemm_EXTERNAL_OBJECTS = \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gmk_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gmk_gnk_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gkm_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gkm_gnk_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gmk_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gmk_gnk_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gkm_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gkm_gnk_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gmk_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gmk_gnk_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gkm_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gkm_gnk_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gmk_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gmk_gnk_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gkm_gkn_gmn_instance.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gkm_gnk_gmn_instance.cpp.o"

bin/test_batched_gemm: test/batched_gemm/CMakeFiles/test_batched_gemm.dir/test_batched_gemm.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gmk_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gmk_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gkm_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f16_f16_f16_gkm_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gmk_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gmk_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gkm_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_bf16_bf16_bf16_gkm_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gmk_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gmk_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gkm_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_f32_f32_f32_gkm_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gmk_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gmk_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gkm_gkn_gmn_instance.cpp.o
bin/test_batched_gemm: library/src/tensor_operation_instance/gpu/batched_gemm/CMakeFiles/device_batched_gemm_instance.dir/device_batched_gemm_xdl_int8_int8_int8_gkm_gnk_gmn_instance.cpp.o
bin/test_batched_gemm: test/batched_gemm/CMakeFiles/test_batched_gemm.dir/build.make
bin/test_batched_gemm: lib/libgtest_main.a
bin/test_batched_gemm: lib/libutility.a
bin/test_batched_gemm: lib/libgtest.a
bin/test_batched_gemm: /opt/rocm-5.7.1/lib/libamdhip64.so.5.7.50701
bin/test_batched_gemm: /opt/rocm-5.7.1/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/test_batched_gemm: test/batched_gemm/CMakeFiles/test_batched_gemm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/test_batched_gemm"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_batched_gemm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/batched_gemm/CMakeFiles/test_batched_gemm.dir/build: bin/test_batched_gemm
.PHONY : test/batched_gemm/CMakeFiles/test_batched_gemm.dir/build

test/batched_gemm/CMakeFiles/test_batched_gemm.dir/clean:
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm && $(CMAKE_COMMAND) -P CMakeFiles/test_batched_gemm.dir/cmake_clean.cmake
.PHONY : test/batched_gemm/CMakeFiles/test_batched_gemm.dir/clean

test/batched_gemm/CMakeFiles/test_batched_gemm.dir/depend:
	cd /work1/sadasivan/student30/composable_kernel/build_new && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student30/composable_kernel /work1/sadasivan/student30/composable_kernel/test/batched_gemm /work1/sadasivan/student30/composable_kernel/build_new /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm/CMakeFiles/test_batched_gemm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/batched_gemm/CMakeFiles/test_batched_gemm.dir/depend

