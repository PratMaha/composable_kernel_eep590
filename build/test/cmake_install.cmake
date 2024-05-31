# Install script for directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/test

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/opt/rocm")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-build/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/magic_number_division/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/space_filling_curve/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/conv_util/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/reference_conv_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_add/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_layernorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_split_k/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_universal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/gemm_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/batched_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/batched_gemm_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/batched_gemm_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/batched_gemm_softmax_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/batched_gemm_softmax_gemm_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/convnd_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/convnd_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_convnd_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_convnd_bwd_weight/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/block_to_ctile_map/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/softmax/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/normalization_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/normalization_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/normalization_bwd_gamma_beta/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/data_type/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/elementwise_normalization/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/batchnorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/contraction/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/pool/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/batched_gemm_multi_d/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/grouped_convnd_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/conv_tensor_rearrange/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/transpose/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/permute_scale/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/wrapper/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/test/position_embedding/cmake_install.cmake")
endif()

