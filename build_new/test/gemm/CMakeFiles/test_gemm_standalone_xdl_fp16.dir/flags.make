# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# compile CXX with /opt/rocm-5.7.1/bin/hipcc
CXX_DEFINES = -DCK_ENABLE_BF16 -DCK_ENABLE_BF8 -DCK_ENABLE_FP16 -DCK_ENABLE_FP32 -DCK_ENABLE_FP64 -DCK_ENABLE_FP8 -DCK_ENABLE_INT8 -D__HIP_PLATFORM_AMD__=1 -D__HIP_PLATFORM_HCC__=1

CXX_INCLUDES = -I/work1/sadasivan/student30/composable_kernel/profiler/include -I/work1/sadasivan/student30/composable_kernel -I/work1/sadasivan/student30/composable_kernel/library/include -I/work1/sadasivan/student30/composable_kernel/include -I/work1/sadasivan/student30/composable_kernel/build_new/include -I/work1/sadasivan/student30/composable_kernel/test/gemm/instance

CXX_FLAGS = -std=c++17 -O3 -ftemplate-backtrace-limit=0  -fPIE  -Wno-gnu-line-marker -O3 -DNDEBUG   -Wall -Wextra -Wcomment -Wendif-labels -Wformat -Winit-self -Wreturn-type -Wsequence-point -Wswitch -Wtrigraphs -Wundef -Wuninitialized -Wunreachable-code -Wunused -Wno-reserved-identifier -Werror -Wno-option-ignored -Wsign-compare -Wno-extra-semi-stmt -Wno-unused-template -Wno-missing-field-initializers -Wno-deprecated-declarations -Wall -Wextra -Wcomment -Wendif-labels -Wformat -Winit-self -Wreturn-type -Wsequence-point -Wswitch -Wtrigraphs -Wundef -Wuninitialized -Wunreachable-code -Wunused -Wno-reserved-identifier -Werror -Wno-option-ignored -Wsign-compare -Wno-extra-semi-stmt -Wno-unused-template -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-conversion -Wno-double-promotion -Wno-exit-time-destructors -Wno-extra-semi -Wno-float-conversion -Wno-gnu-anonymous-struct -Wno-gnu-zero-variadic-macro-arguments -Wno-missing-prototypes -Wno-nested-anon-types -Wno-padded -Wno-return-std-move-in-c++11 -Wno-shorten-64-to-32 -Wno-sign-conversion -Wno-unknown-warning-option -Wno-unused-command-line-argument -Wno-weak-vtables -Wno-covered-switch-default -Wno-unsafe-buffer-usage -Wno-bit-int-extension -fno-offload-uniform-block -Werror -Weverything -Oz -flto=thin -x hip --offload-arch=gfx908 --offload-arch=gfx90a --offload-arch=gfx940 -std=c++17

