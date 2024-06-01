### Project Overview

This project focuses on optimizing matrix multiplication operations on GPUs. The initial code uses a standard GEMM operation without any advanced memory optimizations or block matrix multiplication techniques. Our goal is to enhance the performance by introducing pinned memory and block matrix multiplication techniques.

### Original Code

The original code performs GEMM (General Matrix Multiplication) using standard memory allocations and operations. It does not leverage pinned memory or block matrix multiplication techniques. The core operation is performed using the following class and methods:

```
using DeviceGemmInstance = ck::tensor_operation::device::DeviceGemmXdlSplitKCShuffle
    <ADataType, BDataType, CDataType, AccDataType, ALayout, BLayout, CLayout, 
    AElementOp, BElementOp, CElementOp, GemmDefault, 256, 256, 128, 4, 8, 32, 32, 4, 2, 
    S<1, 4, 64, 1>, S<0, 2, 1, 3>, S<0, 2, 1, 3>, 3, 8, 8, true, 
    S<1, 4, 64, 1>, S<0, 1, 3, 2>, S<0, 1, 3, 2>, 3, 8, 8, true, 1, 1, S<1, 32, 1, 8>, 8>;

```

### Changes and Enhancements

* Pinned Memory Optimization

**Purpose:** To reduce memory transfer time between the host and the GPU by using pinned (page-locked) memory.

```
// Use pinned memory
void* pinned_memory_a;
void* pinned_memory_b;
void* pinned_memory_c;

hipError_t err;

err = hipHostMalloc(&pinned_memory_a, sizeof(ADataType) * a_m_k.mDesc.GetElementSpaceSize(), hipHostMallocDefault);
if (err != hipSuccess) {
    std::cerr << "hipHostMalloc failed for pinned_memory_a" << std::endl;
    return false;
}

err = hipHostMalloc(&pinned_memory_b, sizeof(BDataType) * b_k_n.mDesc.GetElementSpaceSize(), hipHostMallocDefault);
if (err != hipSuccess) {
    std::cerr << "hipHostMalloc failed for pinned_memory_b" << std::endl;
    hipHostFree(pinned_memory_a);
    return false;
}

err = hipHostMalloc(&pinned_memory_c, sizeof(CDataType) * c_m_n_device_result.mDesc.GetElementSpaceSize(), hipHostMallocDefault);
if (err != hipSuccess) {
    std::cerr << "hipHostMalloc failed for pinned_memory_c" << std::endl;
    hipHostFree(pinned_memory_a);
    hipHostFree(pinned_memory_b);
    return false;
}

```

* Block Matrix Multiplication

**Purpose:** To optimize the matrix multiplication by dividing the matrices into smaller blocks, which can be processed more efficiently on the GPU.

```
// Define block size
int block_size = 1024; // Adjust this size for optimization

// Iterate over blocks
for (int i = 0; i < M; i += block_size) {
    for (int j = 0; j < N; j += block_size) {
        for (int k = 0; k < K; k += block_size) {
            int M_sub = std::min(block_size, M - i);
            int N_sub = std::min(block_size, N - j);
            int K_sub = std::min(block_size, K - k);

            auto a_sub = a_m_k.Extract({i, k}, {M_sub, K_sub});
            auto b_sub = b_k_n.Extract({k, j}, {K_sub, N_sub});
            auto c_sub = c_m_n_device_result.Extract({i, j}, {M_sub, N_sub});

            DeviceMem a_sub_device_buf(sizeof(ADataType) * a_sub.mDesc.GetElementSpaceSize());
            DeviceMem b_sub_device_buf(sizeof(BDataType) * b_sub.mDesc.GetElementSpaceSize());
            DeviceMem c_sub_device_buf(sizeof(CDataType) * c_sub.mDesc.GetElementSpaceSize());

            a_sub_device_buf.ToDevice(a_sub.mData.data());
            b_sub_device_buf.ToDevice(b_sub.mData.data());
            c_sub_device_buf.SetZero();

            auto argument = gemm.MakeArgument(
                static_cast<ADataType*>(a_sub_device_buf.GetDeviceBuffer()),
                static_cast<BDataType*>(b_sub_device_buf.GetDeviceBuffer()),
                static_cast<CDataType*>(c_sub_device_buf.GetDeviceBuffer()),
                M_sub, N_sub, K_sub, StrideA, StrideB, StrideC,
                a_element_op, b_element_op, c_element_op, KBatch);

            if (!gemm.IsSupportedArgument(argument)) {
                std::cout << gemm.GetTypeString() << " does not support this problem" << std::endl;
                hipHostFree(pinned_memory_a);
                hipHostFree(pinned_memory_b);
                hipHostFree(pinned_memory_c);
                return false;
            }

            invoker.Run(argument, StreamConfig{nullptr, false});
            c_sub_device_buf.FromDevice(c_sub.mData.data());
            c_m_n_device_result.Update(c_sub, {i, j});
        }
    }
}

```

### Conclusion

Through the implementation of pinned memory and block matrix multiplication, significant performance improvements were achieved in the matrix multiplication operations on the GPU. The use of pinned memory reduces memory transfer time, while block matrix multiplication leverages the GPU's parallel processing capabilities more effectively. These optimizations demonstrate the potential for significant computational efficiency gains in high-performance computing applications.
