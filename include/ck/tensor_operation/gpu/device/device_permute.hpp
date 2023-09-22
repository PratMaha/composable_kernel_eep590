
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Weverything"
// SPDX-License-Identifier: MIT
// Copyright (c) 2018-2023, Advanced Micro Devices, Inc. All rights reserved.

#pragma once

#ifndef __HIPCC_RTC__
#include <array>
#include <memory>
#include <type_traits>
#endif

#include "ck/tensor_operation/gpu/device/device_base.hpp"

namespace ck {
namespace tensor_operation {
namespace device {

template <index_t NumDim, typename InDataType, typename OutDataType, typename ElementwiseOperation>
struct DevicePermute : BaseOperator
{
    using Lengths = std::array<index_t, NumDim>;
    using Strides = Lengths;

    virtual std::unique_ptr<BaseArgument>
    MakeArgumentPointer(const Lengths& in_lengths,
                        const Strides& in_strides,
                        const Lengths& out_lengths,
                        const Strides& out_strides,
                        const void* in_dev_buffer,
                        void* out_dev_buffer,
                        ElementwiseOperation elementwise_op) = 0;

    virtual std::unique_ptr<BaseInvoker> MakeInvokerPointer() = 0;
};

} // namespace device
} // namespace tensor_operation
} // namespace ck

#pragma clang diagnostic pop
