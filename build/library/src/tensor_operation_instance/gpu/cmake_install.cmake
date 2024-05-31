# Install script for directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/src/tensor_operation_instance/gpu

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
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/avg_pool3d_bwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batched_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batched_gemm_add_relu_gemm_add/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batched_gemm_bias_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batched_gemm_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batched_gemm_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batched_gemm_softmax_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batched_gemm_softmax_gemm_permute/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/batchnorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/column_to_image/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/contraction_bilinear/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/contraction_scale/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/conv1d_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/conv2d_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/conv2d_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/conv2d_fwd_bias_relu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/conv2d_fwd_bias_relu_add/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/conv3d_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/elementwise/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/elementwise_normalization/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_add/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_add_add_fastgelu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_add_fastgelu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_add_multiply/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_add_relu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_add_relu_add_layernorm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_add_silu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_bias_add_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_bilinear/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_fastgelu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_multi_abd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_multiply_add/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_splitk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_streamk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/gemm_universal/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv1d_bwd_weight/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv1d_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_bwd_weight/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv2d_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data_bilinear/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_data_scale/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_weight/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_weight_bilinear/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_bwd_weight_scale/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_fwd_bilinear/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_fwd_scale/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_fwd_scaleadd_ab/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_conv3d_fwd_scaleadd_scaleadd_relu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm_bias/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm_fastgelu/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm_fixed_nk/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm_fixed_nk_multi_abd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/grouped_gemm_tile_loop/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/image_to_column/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/max_pool_bwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/normalization_bwd_data/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/normalization_bwd_gamma_beta/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/normalization_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/permute_scale/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/pool3d_fwd/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/quantization/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/reduce/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/softmax/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/transpose/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/lib/libdevice_other_operations.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_other_operationsTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_other_operationsTargets.cmake"
         "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_other_operationsTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_other_operationsTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_other_operationsTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_other_operationsTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_other_operationsTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/lib/libdevice_gemm_operations.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_gemm_operationsTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_gemm_operationsTargets.cmake"
         "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_gemm_operationsTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_gemm_operationsTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_gemm_operationsTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_gemm_operationsTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_gemm_operationsTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/lib/libdevice_conv_operations.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_conv_operationsTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_conv_operationsTargets.cmake"
         "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_conv_operationsTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_conv_operationsTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_conv_operationsTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_conv_operationsTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_conv_operationsTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/lib/libdevice_contraction_operations.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_contraction_operationsTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_contraction_operationsTargets.cmake"
         "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_contraction_operationsTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_contraction_operationsTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_contraction_operationsTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_contraction_operationsTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_contraction_operationsTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/lib/libdevice_reduction_operations.a")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_reduction_operationsTargets.cmake")
    file(DIFFERENT _cmake_export_file_changed FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_reduction_operationsTargets.cmake"
         "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_reduction_operationsTargets.cmake")
    if(_cmake_export_file_changed)
      file(GLOB _cmake_old_config_files "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_reduction_operationsTargets-*.cmake")
      if(_cmake_old_config_files)
        string(REPLACE ";" ", " _cmake_old_config_files_text "${_cmake_old_config_files}")
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel/composable_kerneldevice_reduction_operationsTargets.cmake\" will be replaced.  Removing files [${_cmake_old_config_files_text}].")
        unset(_cmake_old_config_files_text)
        file(REMOVE ${_cmake_old_config_files})
      endif()
      unset(_cmake_old_config_files)
    endif()
    unset(_cmake_export_file_changed)
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_reduction_operationsTargets.cmake")
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/composable_kernel" TYPE FILE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/library/src/tensor_operation_instance/gpu/CMakeFiles/Export/a9c4c0ae690f6016423ad1ead598bff8/composable_kerneldevice_reduction_operationsTargets-release.cmake")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "devel" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ck" TYPE DIRECTORY FILES
    "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/include/ck/"
    "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/library/include/ck/"
    )
endif()

