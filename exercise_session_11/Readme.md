## Exercise 1
- The average process time for the code execution is 13.07 seconds.
- Memory usage is minimal at 46.4 MiB, with negligible memory traffic, suggesting the bottleneck is computational rather than memory-related.
- No specific indications of vectorization efficiency in this output.
- The entire workload is accounted under `main`, with all sampling attributed to the computational loops in the `forces` function.
- The program consumed approximately 2880 J total energy, mostly allocated to the memory and CPU.

## Exercise 2
```
real    0m12.711s
user    0m12.705s
sys     0m0.001s
-----------------
real    0m7.202s
user    0m7.159s
sys     0m0.009s
```

## Exercise 3
The changes to the `particles` structure (switching from an array of structs to struct of arrays) allowed the compiler to optimize memory access patterns and apply vectorization successfully. This is evident in the report showing vectorized operations for major loops. Performance improvements should now be measurable when the code is run and profiled again.

## Exercise 4
```
real	0m4.293s
user	0m4.276s
sys	0m0.005s
```
