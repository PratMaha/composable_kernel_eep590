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

# Utility rule file for tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.

# Include any custom commands dependencies for this target.
include library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/compiler_depend.make

# Include the progress variables for this target.
include library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/progress.make

library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/xdl/device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "clang-tidy: Running clang-tidy on target xdl/device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance.cpp..."
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data && CLANG_TIDY_EXE-NOTFOUND -p /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build -checks='*,-abseil-*,-android-cloexec-fopen,-cert-msc30-c,-bugprone-exception-escape,-bugprone-macro-parentheses,-cert-env33-c,-cert-msc32-c,-cert-msc50-cpp,-cert-msc51-cpp,-cert-dcl37-c,-cert-dcl51-cpp,-clang-analyzer-alpha.core.CastToStruct,-clang-analyzer-optin.performance.Padding,-clang-diagnostic-deprecated-declarations,-clang-diagnostic-extern-c-compat,-clang-diagnostic-unused-command-line-argument,-cppcoreguidelines-avoid-c-arrays,-cppcoreguidelines-avoid-magic-numbers,-cppcoreguidelines-explicit-virtual-functions,-cppcoreguidelines-init-variables,-cppcoreguidelines-macro-usage,-cppcoreguidelines-non-private-member-variables-in-classes,-cppcoreguidelines-pro-bounds-array-to-pointer-decay,-cppcoreguidelines-pro-bounds-constant-array-index,-cppcoreguidelines-pro-bounds-pointer-arithmetic,-cppcoreguidelines-pro-type-member-init,-cppcoreguidelines-pro-type-reinterpret-cast,-cppcoreguidelines-pro-type-union-access,-cppcoreguidelines-pro-type-vararg,-cppcoreguidelines-special-member-functions,-fuchsia-*,-google-explicit-constructor,-google-readability-braces-around-statements,-google-readability-todo,-google-runtime-int,-google-runtime-references,-hicpp-vararg,-hicpp-braces-around-statements,-hicpp-explicit-conversions,-hicpp-named-parameter,-hicpp-no-array-decay,-hicpp-avoid-c-arrays,-hicpp-signed-bitwise,-hicpp-special-member-functions,-hicpp-uppercase-literal-suffix,-hicpp-use-auto,-hicpp-use-equals-default,-hicpp-use-override,-llvm-header-guard,-llvm-include-order,-llvmlibc-restrict-system-libc-headers,-llvmlibc-callee-namespace,-llvmlibc-implementation-in-namespace,-llvm-else-after-return,-llvm-qualified-auto,-misc-misplaced-const,-misc-non-private-member-variables-in-classes,-misc-no-recursion,-modernize-avoid-bind,-modernize-avoid-c-arrays,-modernize-pass-by-value,-modernize-use-auto,-modernize-use-default-member-init,-modernize-use-equals-default,-modernize-use-trailing-return-type,-modernize-use-transparent-functors,-performance-unnecessary-value-param,-readability-braces-around-statements,-readability-else-after-return,-readability-function-cognitive-complexity,-readability-isolate-declaration,-readability-magic-numbers,-readability-named-parameter,-readability-uppercase-literal-suffix,-readability-convert-member-functions-to-static,-readability-qualified-auto,-readability-redundant-string-init,-bugprone-narrowing-conversions,-cppcoreguidelines-narrowing-conversions,-altera-struct-pack-align,-cppcoreguidelines-prefer-member-initializer' -extra-arg=-DCK_USE_CLANG_TIDY -header-filter='.hpp$$' -config={CheckOptions:\ [{key:\ bugprone-reserved-identifier.AllowedIdentifiers,value:\ __HIP_PLATFORM_HCC__\;\ __HIP_PLATFORM_AMD__\;\ __HIP_ROCclr__}]} xdl/device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance.cpp -export-fixes=/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/fixits/device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.yaml

tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp: library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp
tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp: library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/build.make
.PHONY : tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp

# Rule to build all files generated by this target.
library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/build: tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp
.PHONY : library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/build

library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/clean:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data && $(CMAKE_COMMAND) -P CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/cmake_clean.cmake
.PHONY : library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/clean

library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/depend:
	cd /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /work1/sadasivan/student51/assignments/finalProject/composable_kernel /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data /work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/CMakeFiles/tidy-target-device_grouped_conv3d_bwd_data_instance-xdl_device_grouped_conv3d_bwd_data_xdl_ndhwgc_gkzyxc_ndhwgk_input_f16_comp_bf8_f8_instance_cpp.dir/depend

