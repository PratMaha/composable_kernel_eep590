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

# Utility rule file for example_gemm_scale_softmax_gemm.

# Include any custom commands dependencies for this target.
include example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/compiler_depend.make

# Include the progress variables for this target.
include example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/progress.make

example_gemm_scale_softmax_gemm: example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/build.make
.PHONY : example_gemm_scale_softmax_gemm

# Rule to build all files generated by this target.
example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/build: example_gemm_scale_softmax_gemm
.PHONY : example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/build

example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/32_batched_gemm_scale_softmax_gemm && $(CMAKE_COMMAND) -P CMakeFiles/example_gemm_scale_softmax_gemm.dir/cmake_clean.cmake
.PHONY : example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/clean

example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/32_batched_gemm_scale_softmax_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/32_batched_gemm_scale_softmax_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/32_batched_gemm_scale_softmax_gemm/CMakeFiles/example_gemm_scale_softmax_gemm.dir/depend

