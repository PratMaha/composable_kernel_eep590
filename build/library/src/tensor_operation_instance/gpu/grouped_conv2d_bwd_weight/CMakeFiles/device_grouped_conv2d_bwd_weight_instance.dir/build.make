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
include library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.make

# Include the progress variables for this target.
include library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/progress.make

# Include the compile flags for this target's objects.
include library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o -MF CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o.d -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp > CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.i

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.s

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o -MF CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o.d -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp > CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.i

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.s

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o -MF CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o.d -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp > CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.i

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.s

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o -MF CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o.d -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp > CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.i

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.s

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o -MF CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o.d -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp > CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.i

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.s

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o -MF CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o.d -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp > CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.i

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.s

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/flags.make
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o -MF CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o.d -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o -c /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.i"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp > CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.i

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.s"
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && /opt/rocm-5.7.1/bin/hipcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp -o CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.s

device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f16_instance.cpp.o
device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_f32_instance.cpp.o
device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_gnhwc_gkyxc_gnhwk_bf16_instance.cpp.o
device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o
device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_f32_instance.cpp.o
device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_xdl_nhwgc_gkyxc_nhwgk_bf16_instance.cpp.o
device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/xdl/device_grouped_conv2d_bwd_weight_two_stage_xdl_nhwgc_gkyxc_nhwgk_f16_instance.cpp.o
device_grouped_conv2d_bwd_weight_instance: library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/build.make
.PHONY : device_grouped_conv2d_bwd_weight_instance

# Rule to build all files generated by this target.
library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/build: device_grouped_conv2d_bwd_weight_instance
.PHONY : library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/build

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight && $(CMAKE_COMMAND) -P CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/cmake_clean.cmake
.PHONY : library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/clean

library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/CMakeFiles/device_grouped_conv2d_bwd_weight_instance.dir/depend

