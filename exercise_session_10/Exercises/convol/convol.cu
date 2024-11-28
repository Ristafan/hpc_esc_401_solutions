#include <time.h>
#include <cuda.h>
#include <stdio.h>
#define STOP 0
#define START 1


extern "C" void chrono (int kind, float *time);

__global__ void kconvol (float *gpu_a, float *gpu_b, int n) {
  int i, j, l;
  // TO DO : evaluate the global 1D index l of the current thread,
  // using blockDim, blockIdx and threadIdx.
  l = blockDim.x*blockIdx.x+threadIdx.x;
  
  // TO DO : evaluate global indeces of thread (i,j) from the index l
  j = l / n;
  i = l % n;

  if ((i >= n) || (j >= n)) return;
  if ((i == 0) || (j == 0) || (i == n-1) || (j == n-1))  {
    gpu_b[l] = gpu_a[l]; // edges are untouched
  }
  else
    // TO DO : fill up the MISSING indices below
    gpu_b[l]=(1./5.)*(gpu_a[l-n] + gpu_a[l-1] + gpu_a[l] + gpu_a[l+1]+ gpu_a[l+n]);
}

extern "C" void gpu_convol (float *a, float *b, int n, int blockSize) {
  float *gpu_a;
  float *gpu_b;
  cudaError_t err;
  float time;
  
  err = cudaMalloc (&gpu_a, n*n*sizeof(float));
  if (err != 0) {
    printf ("Error allocating gpu_a: %s\n", cudaGetErrorString (err));
    exit (1);
  }
  err = cudaMalloc (&gpu_b, n*n*sizeof(float));
  if (err != 0) {
    printf ("Error allocating gpu_b: %s\n", cudaGetErrorString (err));
    exit (1);
  }
  
  cudaMemcpy (gpu_a, a, n*n*sizeof(float), cudaMemcpyHostToDevice);
    
  // NOTE : the chronometer below does not contemplate overhead of memory allocation and
  // memory transfer.
  chrono (START, &time);
  // TO DO : the number of blocks is missing below in the kernel invocation
  kconvol <<<((n*n) + blockSize - 1)/blockSize,blockSize>>> (gpu_a, gpu_b, n);
  err=cudaDeviceSynchronize ();
  chrono (STOP, &time);
  printf ("Convolution took  %f sec. on GPU\n", time);
  cudaMemcpy (b, gpu_b, n*n*sizeof(float), cudaMemcpyDeviceToHost);
  if (err != 0) {
    printf ("%s\n", cudaGetErrorString (err));
    exit (1);
  }
  cudaFree (gpu_a);
  cudaFree (gpu_b);
}

