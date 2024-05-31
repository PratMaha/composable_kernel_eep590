# Install script for directory: /work1/sadasivan/student51/assignments/finalProject/composable_kernel/example/40_conv2d_fwd_quantization

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

if(CMAKE_INSTALL_COMPONENT STREQUAL "examples" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perlayer_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perlayer_quantization_int8")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perlayer_quantization_int8"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_conv2d_fwd_xdl_perlayer_quantization_int8")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perlayer_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perlayer_quantization_int8")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perlayer_quantization_int8")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "examples" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perchannel_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perchannel_quantization_int8")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perchannel_quantization_int8"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_conv2d_fwd_xdl_perchannel_quantization_int8")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perchannel_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perchannel_quantization_int8")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_perchannel_quantization_int8")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "examples" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perlayer_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perlayer_quantization_int8")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perlayer_quantization_int8"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_conv2d_fwd_xdl_bias_relu_perlayer_quantization_int8")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perlayer_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perlayer_quantization_int8")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perlayer_quantization_int8")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "examples" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perchannel_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perchannel_quantization_int8")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perchannel_quantization_int8"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/bin/example_conv2d_fwd_xdl_bias_relu_perchannel_quantization_int8")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perchannel_quantization_int8" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perchannel_quantization_int8")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/example_conv2d_fwd_xdl_bias_relu_perchannel_quantization_int8")
    endif()
  endif()
endif()

