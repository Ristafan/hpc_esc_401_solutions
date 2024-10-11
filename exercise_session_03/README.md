# Exercise 1
## Values of execution time
### With 4 processes:
- MPI timing: 0.3724 seconds
- Total execution time: 0.3786 seconds

### With 8 processes:
- MPI timing: 0.1871 seconds
- Total execution time: 0.1973 seconds

## Why are they different?
The total execution time includes the initialization of the MPI enviornment and the cleanup, where we get the additional extra time.

# Exercise 2
## What results does your code produce?
See files outputO0.txt, outputO1.txt, outputO2.txt, outputO3.txt

##  Do you know other ways to get timings?
Maybe by using the `clock()` function.

## How big is the difference in execution time with the different flags?
The difference between O0 and O1 is approximately 3.021 seconds.
The difference between O1 and O2/O3 is about 0.87 seconds.
- The optimizations in O1 significantly improve performance
- Moving from O2 to O3 yields marginal improvements

##  How did the compiler optimize the code?
- Functions that are frequently called may be replaced with their actual code, reducing call overhead.
- Removing any code that does not affect the program's outcome.

## How can you make it even faster?
- Further parallelization
- Optimizing algorithms
- Memory optimizations

## How did you compile? Provide your code and the job script.
```bash
gcc -O1 -o sum_O1 sum.c gettime.c -lm
gcc -O2 -o sum_O2 sum.c gettime.c -lm
gcc -O3 -o sum_O3 sum.c gettime.c -lm
```

I always changed the `OMP_NUM_THREADS` and ran the script again.
```bash
[eiger][mfaehnri@eiger-ln004 exercise_session_03]$ export OMP_NUM_THREADS=8
[eiger][mfaehnri@eiger-ln004 exercise_session_03]$ ./sum_openmp >> outputex2.txt
```

## Plot the speedup and discuss.
![Figure_1](https://github.com/user-attachments/assets/58b69ce5-851d-4d77-a7e3-a5f39956d098)
Initially, the speedup grows steadily, which is expected by adding more threads that allow parallelism. We then get to the peak speedup region between 64 and 128 threads. It seems as if the weokload is distributed the best in this region. After 128 threads the speedup starts to decline, which could be due to various reasons, like overhead of thread management or maybe the workload is too little for each thread that could lead to inefficiencies.

# Exercise 3
## How can you explain such behaviour (superlinear speedup)?
- cache usage: With a smaller portion of the data the processors cache might be used better
- memory optimization: More processors can allow more efficient use of memory hierarchies
- load balancing: If the sequential version of the program has uneven workload distribution or bottlenecks then the parallel version might resolve those issues
