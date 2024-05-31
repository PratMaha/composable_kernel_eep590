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
include test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/compiler_depend.make

# Include the progress variables for this target.
include test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/progress.make

# Include the compile flags for this target's objects.
include test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/flags.make

test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o: test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/flags.make
test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_reduce/gemm_reduce_fp16_xdl.cpp
test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o: test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o -MF CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o.d -o CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_reduce/gemm_reduce_fp16_xdl.cpp

test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_reduce/gemm_reduce_fp16_xdl.cpp > CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.i

test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_reduce/gemm_reduce_fp16_xdl.cpp -o CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.s

# Object files for target test_gemm_reduce_fp16
test_gemm_reduce_fp16_OBJECTS = \
"CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o"

# External object files for target test_gemm_reduce_fp16
test_gemm_reduce_fp16_EXTERNAL_OBJECTS = \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_mk_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_mk_nk_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_km_kn_mn_instance.cpp.o" \
"/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_km_nk_mn_instance.cpp.o"

bin/test_gemm_reduce_fp16: test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/gemm_reduce_fp16_xdl.cpp.o
bin/test_gemm_reduce_fp16: library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_mk_kn_mn_instance.cpp.o
bin/test_gemm_reduce_fp16: library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_mk_nk_mn_instance.cpp.o
bin/test_gemm_reduce_fp16: library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_km_kn_mn_instance.cpp.o
bin/test_gemm_reduce_fp16: library/src/tensor_operation_instance/gpu/gemm_reduce/CMakeFiles/device_gemm_reduce_instance.dir/device_gemm_reduce_xdl_cshuffle_f16_f16_f16_f32_f32_km_nk_mn_instance.cpp.o
bin/test_gemm_reduce_fp16: test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/build.make
bin/test_gemm_reduce_fp16: lib/libutility.a
bin/test_gemm_reduce_fp16: /opt/rocm-6.0.2/lib/libamdhip64.so.6.0.60002
bin/test_gemm_reduce_fp16: /opt/rocm-6.0.2/lib/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/test_gemm_reduce_fp16: test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/test_gemm_reduce_fp16"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_gemm_reduce_fp16.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/build: bin/test_gemm_reduce_fp16
.PHONY : test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/build

test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce && $(CMAKE_COMMAND) -P CMakeFiles/test_gemm_reduce_fp16.dir/cmake_clean.cmake
.PHONY : test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/clean

test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/gemm_reduce /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/gemm_reduce/CMakeFiles/test_gemm_reduce_fp16.dir/depend

