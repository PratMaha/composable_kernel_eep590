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
include test/magic_number_division/CMakeFiles/test_magic_number_division.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include test/magic_number_division/CMakeFiles/test_magic_number_division.dir/compiler_depend.make

# Include the progress variables for this target.
include test/magic_number_division/CMakeFiles/test_magic_number_division.dir/progress.make

# Include the compile flags for this target's objects.
include test/magic_number_division/CMakeFiles/test_magic_number_division.dir/flags.make

test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o: test/magic_number_division/CMakeFiles/test_magic_number_division.dir/flags.make
test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o: /work1/sadasivan/student30/composable_kernel/test/magic_number_division/magic_number_division.cpp
test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o: test/magic_number_division/CMakeFiles/test_magic_number_division.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/magic_number_division && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o -MF CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o.d -o CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o -c /work1/sadasivan/student30/composable_kernel/test/magic_number_division/magic_number_division.cpp

test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.i"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/magic_number_division && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student30/composable_kernel/test/magic_number_division/magic_number_division.cpp > CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.i

test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.s"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/magic_number_division && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student30/composable_kernel/test/magic_number_division/magic_number_division.cpp -o CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.s

# Object files for target test_magic_number_division
test_magic_number_division_OBJECTS = \
"CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o"

# External object files for target test_magic_number_division
test_magic_number_division_EXTERNAL_OBJECTS =

bin/test_magic_number_division: test/magic_number_division/CMakeFiles/test_magic_number_division.dir/magic_number_division.cpp.o
bin/test_magic_number_division: test/magic_number_division/CMakeFiles/test_magic_number_division.dir/build.make
bin/test_magic_number_division: lib/libutility.a
bin/test_magic_number_division: /opt/rocm-5.7.1/lib/libamdhip64.so.5.7.50701
bin/test_magic_number_division: /opt/rocm-5.7.1/llvm/lib/clang/17.0.0/lib/linux/libclang_rt.builtins-x86_64.a
bin/test_magic_number_division: test/magic_number_division/CMakeFiles/test_magic_number_division.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/work1/sadasivan/student30/composable_kernel/build_new/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/test_magic_number_division"
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/magic_number_division && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test_magic_number_division.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/magic_number_division/CMakeFiles/test_magic_number_division.dir/build: bin/test_magic_number_division
.PHONY : test/magic_number_division/CMakeFiles/test_magic_number_division.dir/build

test/magic_number_division/CMakeFiles/test_magic_number_division.dir/clean:
	cd /work1/sadasivan/student30/composable_kernel/build_new/test/magic_number_division && $(CMAKE_COMMAND) -P CMakeFiles/test_magic_number_division.dir/cmake_clean.cmake
.PHONY : test/magic_number_division/CMakeFiles/test_magic_number_division.dir/clean

test/magic_number_division/CMakeFiles/test_magic_number_division.dir/depend:
	cd /work1/sadasivan/student30/composable_kernel/build_new && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student30/composable_kernel /work1/sadasivan/student30/composable_kernel/test/magic_number_division /work1/sadasivan/student30/composable_kernel/build_new /work1/sadasivan/student30/composable_kernel/build_new/test/magic_number_division /work1/sadasivan/student30/composable_kernel/build_new/test/magic_number_division/CMakeFiles/test_magic_number_division.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/magic_number_division/CMakeFiles/test_magic_number_division.dir/depend

