# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-src"
  "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-build"
  "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-subbuild/gtest-populate-prefix"
  "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-subbuild/gtest-populate-prefix/tmp"
  "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-subbuild/gtest-populate-prefix/src/gtest-populate-stamp"
  "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-subbuild/gtest-populate-prefix/src"
  "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-subbuild/gtest-populate-prefix/src/gtest-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-subbuild/gtest-populate-prefix/src/gtest-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/work1/sadasivan/student51/assignments/finalProject/composable_kernel/build/_deps/gtest-subbuild/gtest-populate-prefix/src/gtest-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
