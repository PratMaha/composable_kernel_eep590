# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-src"
  "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-build"
  "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-subbuild/googletest-populate-prefix"
  "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-subbuild/googletest-populate-prefix/tmp"
  "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp"
  "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-subbuild/googletest-populate-prefix/src"
  "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/work1/sadasivan/student30/composable_kernel/build_new/_deps/googletest-subbuild/googletest-populate-prefix/src/googletest-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
