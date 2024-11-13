
// Using CUDA device to calculate pi
#include <stdio.h>
#include <cuda.h>
extern "C" double getTime(void);

#define NBIN 1000000000  // Number of bins

// Kernel that executes on the CUDA device
__global__ void cal_pi(double *sum, int nbin, double step, int nthreads, int nblocks) {
    int i;
    double x;
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Sequential thread index across the blocks
    for (i = idx; i < nbin; i += nthreads * nblocks) {
        x = (i + 0.5) * step;
        sum[idx] += 4.0 / (1.0 + x * x);
    }
}

// Main routine that executes on the host
int main(void) {
    int num_blocks[] = {60, 120, 180, 240, 300, 360, 420, 600};
    int num_threads[] = {16, 32, 48, 64, 80, 96, 112, 128, 144, 160};

    double *sumHost, *sumDev;  // Pointer to host & device arrays
    double pi = 0;
    double step = 1.0 / NBIN;  // Step size

    for (int b = 0; b < sizeof(num_blocks) / sizeof(num_blocks[0]); b++) {
        for (int t = 0; t < sizeof(num_threads) / sizeof(num_threads[0]); t++) {
            int NUM_BLOCK = num_blocks[b];
            int NUM_THREAD = num_threads[t];

            dim3 dimGrid(NUM_BLOCK, 1, 1);   // Grid dimensions
            dim3 dimBlock(NUM_THREAD, 1, 1); // Block dimensions

            size_t size = NUM_BLOCK * NUM_THREAD * sizeof(double);  // Array memory size
            sumHost = (double *)malloc(size);  // Allocate array on host
            cudaMalloc((void **)&sumDev, size);  // Allocate array on device

            double start = getTime();

            // Initialize array in device to 0
            cudaMemset(sumDev, 0, size);

            // Do calculation on device
            cal_pi<<<dimGrid, dimBlock>>>(sumDev, NBIN, step, NUM_THREAD, NUM_BLOCK); // call CUDA kernel

            // Retrieve result from device and store it in host array
            cudaMemcpy(sumHost, sumDev, size, cudaMemcpyDeviceToHost);

            pi = 0.0;
            for (int tid = 0; tid < NUM_THREAD * NUM_BLOCK; tid++) {
                pi += sumHost[tid];
            }
            pi *= step;

            double delta = getTime() - start;
            printf("NUM_BLOCK=%d, NUM_THREAD=%d: PI = %.16g computed in %.4g seconds\n", NUM_BLOCK, NUM_THREAD, pi, delta);

            //Cleanup
            free(sumHost);
            cudaFree(sumDev);
        }
    }

    return 0;
}

