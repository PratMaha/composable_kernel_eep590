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

# Utility rule file for test_batched_gemm_softmax_gemm.

# Include any custom commands dependencies for this target.
include test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/compiler_depend.make

# Include the progress variables for this target.
include test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/progress.make

test_batched_gemm_softmax_gemm: test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/build.make
.PHONY : test_batched_gemm_softmax_gemm

# Rule to build all files generated by this target.
test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/build: test_batched_gemm_softmax_gemm
.PHONY : test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/build

test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/clean:
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm_softmax_gemm && $(CMAKE_COMMAND) -P CMakeFiles/test_batched_gemm_softmax_gemm.dir/cmake_clean.cmake
.PHONY : test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/clean

test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/depend:
	cd /work1/sadasivan/student30/composable_kernel/build_new && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student30/composable_kernel /work1/sadasivan/student30/composable_kernel/test/batched_gemm_softmax_gemm /work1/sadasivan/student30/composable_kernel/build_new /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm_softmax_gemm /work1/sadasivan/student30/composable_kernel/build_new/test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/batched_gemm_softmax_gemm/CMakeFiles/test_batched_gemm_softmax_gemm.dir/depend

