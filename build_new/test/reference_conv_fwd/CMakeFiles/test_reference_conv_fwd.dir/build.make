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
include test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/compiler_depend.make

# Include the progress variables for this target.
include test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/progress.make

# Include the compile flags for this target's objects.
include test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/flags.make

test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o: test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/flags.make
test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o: /work1/sadasivan/student30/composable_kernel/test/reference_conv_fwd/reference_conv_fwd.cpp
test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o: test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/reference_conv_fwd && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o -MF CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o.d -o CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o -c /work1/sadasivan/student30/composable_kernel/test/reference_conv_fwd/reference_conv_fwd.cpp

test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.i"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/reference_conv_fwd && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student30/composable_kernel/test/reference_conv_fwd/reference_conv_fwd.cpp > CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.i

test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.s"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/reference_conv_fwd && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student30/composable_kernel/test/reference_conv_fwd/reference_conv_fwd.cpp -o CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.s

# Object files for target test_reference_conv_fwd
test_reference_conv_fwd_OBJECTS = \
"CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o"

# External object files for target test_reference_conv_fwd
test_reference_conv_fwd_EXTERNAL_OBJECTS =

bin/test_reference_conv_fwd: test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/reference_conv_fwd.cpp.o
bin/test_reference_conv_fwd: test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/build.make
bin/test_reference_conv_fwd: lib/libgtest_main.a
bin/test_reference_conv_fwd: lib/libutility.a
bin/test_reference_conv_fwd: lib/libgtest.a
bin/test_reference_conv_fwd: /opt/rocm-5.7.1/lib/libamdhip64.so.5.7.50701
bin/test_reference_conv_fwd: /opt/rocm-5.7.1/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/test_reference_conv_fwd: test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/test_reference_conv_fwd"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/reference_conv_fwd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_reference_conv_fwd.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/build: bin/test_reference_conv_fwd
.PHONY : test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/build

test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/clean:
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/reference_conv_fwd && $(CMAKE_COMMAND) -P CMakeFiles/test_reference_conv_fwd.dir/cmake_clean.cmake
.PHONY : test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/clean

test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/depend:
	cd /work1/sadasivan/student30/composable_kernel/build_new && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student30/composable_kernel /work1/sadasivan/student30/composable_kernel/test/reference_conv_fwd /work1/sadasivan/student30/composable_kernel/build_new /work1/sadasivan/student30/composable_kernel/build_new/test/reference_conv_fwd /work1/sadasivan/student30/composable_kernel/build_new/test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/reference_conv_fwd/CMakeFiles/test_reference_conv_fwd.dir/depend

