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
include test/softmax/CMakeFiles/test_softmax_interface.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/softmax/CMakeFiles/test_softmax_interface.dir/compiler_depend.make

# Include the progress variables for this target.
include test/softmax/CMakeFiles/test_softmax_interface.dir/progress.make

# Include the compile flags for this target's objects.
include test/softmax/CMakeFiles/test_softmax_interface.dir/flags.make

test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o: test/softmax/CMakeFiles/test_softmax_interface.dir/flags.make
test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o: /work1/sadasivan/student30/composable_kernel/test/softmax/test_softmax_interface.cpp
test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o: test/softmax/CMakeFiles/test_softmax_interface.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/softmax && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o -MF CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o.d -o CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o -c /work1/sadasivan/student30/composable_kernel/test/softmax/test_softmax_interface.cpp

test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.i"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/softmax && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student30/composable_kernel/test/softmax/test_softmax_interface.cpp > CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.i

test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.s"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/softmax && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student30/composable_kernel/test/softmax/test_softmax_interface.cpp -o CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.s

# Object files for target test_softmax_interface
test_softmax_interface_OBJECTS = \
"CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o"

# External object files for target test_softmax_interface
test_softmax_interface_EXTERNAL_OBJECTS = \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank3_reduce1.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank3_reduce2.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank3_reduce3.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce1.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce2.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce3.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce4.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank3_reduce1.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank3_reduce2.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank3_reduce3.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce1.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce2.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce3.cpp.o" \
"/work1/sadasivan/student30/composable_kernel/build_new/library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce4.cpp.o"

bin/test_softmax_interface: test/softmax/CMakeFiles/test_softmax_interface.dir/test_softmax_interface.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank3_reduce1.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank3_reduce2.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank3_reduce3.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce1.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce2.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce3.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f16_f16_instance_rank4_reduce4.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank3_reduce1.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank3_reduce2.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank3_reduce3.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce1.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce2.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce3.cpp.o
bin/test_softmax_interface: library/src/tensor_operation_instance/gpu/softmax/CMakeFiles/device_softmax_instance.dir/device_softmax_f32_f32_instance_rank4_reduce4.cpp.o
bin/test_softmax_interface: test/softmax/CMakeFiles/test_softmax_interface.dir/build.make
bin/test_softmax_interface: lib/libgtest_main.a
bin/test_softmax_interface: lib/libutility.a
bin/test_softmax_interface: lib/libgtest.a
bin/test_softmax_interface: /opt/rocm-5.7.1/lib/libamdhip64.so.5.7.50701
bin/test_softmax_interface: /opt/rocm-5.7.1/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/test_softmax_interface: test/softmax/CMakeFiles/test_softmax_interface.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/test_softmax_interface"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/softmax && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_softmax_interface.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/softmax/CMakeFiles/test_softmax_interface.dir/build: bin/test_softmax_interface
.PHONY : test/softmax/CMakeFiles/test_softmax_interface.dir/build

test/softmax/CMakeFiles/test_softmax_interface.dir/clean:
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/softmax && $(CMAKE_COMMAND) -P CMakeFiles/test_softmax_interface.dir/cmake_clean.cmake
.PHONY : test/softmax/CMakeFiles/test_softmax_interface.dir/clean

test/softmax/CMakeFiles/test_softmax_interface.dir/depend:
	cd /work1/sadasivan/student30/composable_kernel/build_new && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student30/composable_kernel /work1/sadasivan/student30/composable_kernel/test/softmax /work1/sadasivan/student30/composable_kernel/build_new /work1/sadasivan/student30/composable_kernel/build_new/test/softmax /work1/sadasivan/student30/composable_kernel/build_new/test/softmax/CMakeFiles/test_softmax_interface.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/softmax/CMakeFiles/test_softmax_interface.dir/depend

