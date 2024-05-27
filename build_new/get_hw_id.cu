#include <iostream>
#include <hip/hip_runtime.h>

__global__ void test_cu(unsigned int* mem_buffer, uint len) {
    uint temp = 0;
    __asm__ __volatile__("s_getreg_b32 %0 hwreg(HW_REG_HW_ID)\ns_nop 2\n" : "=s"(temp));
    if (blockIdx.x < len && threadIdx.x == 0) {
        mem_buffer[blockIdx.x] = temp;
    }
}

static uint32_t se_from_hwid(uint32_t hwid) {
    return (hwid >> 13) & 0x7;
}

static uint32_t cu_from_hwid(uint32_t hwid) {
    return (hwid >> 8) & 0xf;
}

static uint32_t simd_from_hwid(uint32_t hwid) {
    return (hwid >> 4) & 0x3;
}

int main() {
    const uint buffer_size = 120;
    unsigned int* d_mem_buffer;

    // Allocate memory on the GPU
    hipMalloc(&d_mem_buffer, buffer_size * sizeof(unsigned int));

    // Launch the kernel
    dim3 grid(buffer_size);
    dim3 block(64);
    test_cu<<<grid, block>>>(d_mem_buffer, buffer_size);

    // Retrieve the results from the GPU
    unsigned int h_mem_buffer[buffer_size];
    hipMemcpy(h_mem_buffer, d_mem_buffer, buffer_size * sizeof(unsigned int), hipMemcpyDeviceToHost);

    // Print decoded information
    for (uint i = 0; i < buffer_size; ++i) {
        uint32_t hwid = h_mem_buffer[i];
        std::cout << "Blockidx= " << i << ", Shader Engine# (0-7)=" << se_from_hwid(hwid)
                  << ", local_CU_idx_within_SE# (not consecutive; few CUs within SE maybe disabled in any order)=" << cu_from_hwid(hwid) 
                  << ", SIMD=" << simd_from_hwid(hwid) << std::endl;
    }

    // Clean up
    hipFree(d_mem_buffer);
    return 0;
}
