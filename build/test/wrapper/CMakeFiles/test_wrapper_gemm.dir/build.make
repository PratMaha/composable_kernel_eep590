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
include test/wrapper/CMakeFiles/test_wrapper_gemm.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/wrapper/CMakeFiles/test_wrapper_gemm.dir/compiler_depend.make

# Include the progress variables for this target.
include test/wrapper/CMakeFiles/test_wrapper_gemm.dir/progress.make

# Include the compile flags for this target's objects.
include test/wrapper/CMakeFiles/test_wrapper_gemm.dir/flags.make

test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o: test/wrapper/CMakeFiles/test_wrapper_gemm.dir/flags.make
test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/wrapper/test_wrapper_gemm_xdl.cpp
test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o: test/wrapper/CMakeFiles/test_wrapper_gemm.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o -MF CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o.d -o CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/wrapper/test_wrapper_gemm_xdl.cpp

test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/wrapper/test_wrapper_gemm_xdl.cpp > CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.i

test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/wrapper/test_wrapper_gemm_xdl.cpp -o CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.s

# Object files for target test_wrapper_gemm
test_wrapper_gemm_OBJECTS = \
"CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o"

# External object files for target test_wrapper_gemm
test_wrapper_gemm_EXTERNAL_OBJECTS =

bin/test_wrapper_gemm: test/wrapper/CMakeFiles/test_wrapper_gemm.dir/test_wrapper_gemm_xdl.cpp.o
bin/test_wrapper_gemm: test/wrapper/CMakeFiles/test_wrapper_gemm.dir/build.make
bin/test_wrapper_gemm: lib/libgtest_main.a
bin/test_wrapper_gemm: lib/libutility.a
bin/test_wrapper_gemm: lib/libgtest.a
bin/test_wrapper_gemm: /opt/rocm-6.0.2/lib/libamdhip64.so.6.0.60002
bin/test_wrapper_gemm: /opt/rocm-6.0.2/lib/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/test_wrapper_gemm: test/wrapper/CMakeFiles/test_wrapper_gemm.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/test_wrapper_gemm"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_wrapper_gemm.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/wrapper/CMakeFiles/test_wrapper_gemm.dir/build: bin/test_wrapper_gemm
.PHONY : test/wrapper/CMakeFiles/test_wrapper_gemm.dir/build

test/wrapper/CMakeFiles/test_wrapper_gemm.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper && $(CMAKE_COMMAND) -P CMakeFiles/test_wrapper_gemm.dir/cmake_clean.cmake
.PHONY : test/wrapper/CMakeFiles/test_wrapper_gemm.dir/clean

test/wrapper/CMakeFiles/test_wrapper_gemm.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test/wrapper /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper/CMakeFiles/test_wrapper_gemm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/wrapper/CMakeFiles/test_wrapper_gemm.dir/depend

