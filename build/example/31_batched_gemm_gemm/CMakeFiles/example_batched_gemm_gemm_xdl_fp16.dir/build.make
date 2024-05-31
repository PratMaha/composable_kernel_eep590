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
include example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/compiler_depend.make

# Include the progress variables for this target.
include example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/progress.make

# Include the compile flags for this target's objects.
include example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/flags.make

example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o: example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/flags.make
example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/batched_gemm_gemm_xdl_fp16.cpp
example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o: example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o -MF CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o.d -o CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/batched_gemm_gemm_xdl_fp16.cpp

example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/batched_gemm_gemm_xdl_fp16.cpp > CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.i

example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm/batched_gemm_gemm_xdl_fp16.cpp -o CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.s

# Object files for target example_batched_gemm_gemm_xdl_fp16
example_batched_gemm_gemm_xdl_fp16_OBJECTS = \
"CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o"

# External object files for target example_batched_gemm_gemm_xdl_fp16
example_batched_gemm_gemm_xdl_fp16_EXTERNAL_OBJECTS =

bin/example_batched_gemm_gemm_xdl_fp16: example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/batched_gemm_gemm_xdl_fp16.cpp.o
bin/example_batched_gemm_gemm_xdl_fp16: example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/build.make
bin/example_batched_gemm_gemm_xdl_fp16: lib/libutility.a
bin/example_batched_gemm_gemm_xdl_fp16: /opt/rocm-6.0.2/lib/libamdhip64.so.6.0.60002
bin/example_batched_gemm_gemm_xdl_fp16: /opt/rocm-6.0.2/lib/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/example_batched_gemm_gemm_xdl_fp16: example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_batched_gemm_gemm_xdl_fp16"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/build: bin/example_batched_gemm_gemm_xdl_fp16
.PHONY : example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/build

example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm && $(CMAKE_COMMAND) -P CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/cmake_clean.cmake
.PHONY : example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/clean

example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/31_batched_gemm_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/31_batched_gemm_gemm/CMakeFiles/example_batched_gemm_gemm_xdl_fp16.dir/depend

