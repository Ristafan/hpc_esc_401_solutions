## Exercise 1
![Figure_1](https://github.com/user-attachments/assets/aa7eedd1-b75d-4854-82d4-99c57fdfb892)

- The GPU (OpenACC) is not optimal for small test sizes due to its overheads.
- The CPU (OpenMP) is more efficient for smaller workloads.
- For very large datasets, GPUs become competitive and can match or even outperform CPUs, particularly when the computation can fully utilize the GPU's parallelism.

## Exercise 2
- Frequent data transfer leads to a high overhead. The incorrect memory management can also lead to computation errors
- pcopy moves the data to the gpu at once in the beginning and retrieves the data in the end reducing the overhead.
- 
- For smaller test sizes, the GPU execution time improves from ~0.006s–0.6s (naive) to ~0.003s–0.03s.
- For larger test sizes, the GPU execution time improves from ~13s (naive) to ~3.2s, which is around a 4x speedup.

# Exercise 3
