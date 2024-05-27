# Install script for directory: /work1/sadasivan/student30/composable_kernel/example

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
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/01_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/02_gemm_bilinear/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/03_gemm_bias_relu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/04_gemm_add_add_fastgelu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/09_convnd_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/10_convnd_fwd_multiple_d_multiple_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/12_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/13_pool2d_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/14_gemm_quantization/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/15_grouped_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/16_gemm_multi_d_multi_reduces/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/17_convnd_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/18_batched_gemm_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/19_binary_elementwise/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/20_grouped_conv_bwd_weight/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/21_gemm_layernorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/22_cgemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/23_softmax/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/24_batched_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/25_gemm_bias_e_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/26_contraction/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/27_layernorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/28_grouped_gemm_bias_e_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/29_batched_gemm_bias_e_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/30_grouped_conv_fwd_multiple_d/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/31_batched_gemm_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/32_batched_gemm_scale_softmax_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/33_multiple_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/34_batchnorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/35_splitK_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/36_sparse_embedding/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/37_batched_gemm_add_add_relu_gemm_add/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/38_grouped_conv_bwd_data_multiple_d/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/39_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/40_conv2d_fwd_quantization/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/41_grouped_conv_conv_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/42_groupnorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/43_splitk_gemm_bias_e_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/44_elementwise_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/45_elementwise_normalization/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/46_gemm_add_multiply/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/47_gemm_bias_softmax_gemm_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/48_pool3d_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/49_maxpool2d_bwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/50_put_element/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/51_avgpool3d_bwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/52_im2col_col2im/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/53_gemv_splitk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/54_tall_and_skinny_gemm_splitk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/60_gemm_multi_ABD/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/61_contraction_multi_ABD/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student30/composable_kernel/build_new/example/62_conv_fwd_activ/cmake_install.cmake")
endif()

