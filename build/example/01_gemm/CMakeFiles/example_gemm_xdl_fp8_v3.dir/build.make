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
include example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/compiler_depend.make

# Include the progress variables for this target.
include example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/progress.make

# Include the compile flags for this target's objects.
include example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/flags.make

example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o: example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/flags.make
example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/01_gemm/gemm_xdl_fp8_v3.cpp
example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o: example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/01_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o -MF CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o.d -o CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/01_gemm/gemm_xdl_fp8_v3.cpp

example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/01_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/01_gemm/gemm_xdl_fp8_v3.cpp > CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.i

example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/01_gemm && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/01_gemm/gemm_xdl_fp8_v3.cpp -o CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.s

# Object files for target example_gemm_xdl_fp8_v3
example_gemm_xdl_fp8_v3_OBJECTS = \
"CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o"

# External object files for target example_gemm_xdl_fp8_v3
example_gemm_xdl_fp8_v3_EXTERNAL_OBJECTS =

bin/example_gemm_xdl_fp8_v3: example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/gemm_xdl_fp8_v3.cpp.o
bin/example_gemm_xdl_fp8_v3: example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/build.make
bin/example_gemm_xdl_fp8_v3: lib/libutility.a
bin/example_gemm_xdl_fp8_v3: /opt/rocm-6.0.2/lib/libamdhip64.so.6.0.60002
bin/example_gemm_xdl_fp8_v3: /opt/rocm-6.0.2/lib/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/example_gemm_xdl_fp8_v3: example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/example_gemm_xdl_fp8_v3"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/01_gemm && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/example_gemm_xdl_fp8_v3.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/build: bin/example_gemm_xdl_fp8_v3
.PHONY : example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/build

example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/01_gemm && $(CMAKE_COMMAND) -P CMakeFiles/example_gemm_xdl_fp8_v3.dir/cmake_clean.cmake
.PHONY : example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/clean

example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/01_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/01_gemm /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : example/01_gemm/CMakeFiles/example_gemm_xdl_fp8_v3.dir/depend

