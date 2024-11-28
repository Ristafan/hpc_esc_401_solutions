## Exercise 1
```
Hello World!
```

## Exercise 2
```
11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	
11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	11.000000	
PASSED !!
```

## Exercise 3
```
PASSED
```

## Exercise 4
```
Convolution took  0.000100 sec. on GPU
Convolution took  0.008997 sec. on CPU
PASSED
Convolution took  0.000137 sec. on GPU
Block size: 32, GPU time: 0.002482 sec.
Convolution took  0.000130 sec. on GPU
Block size: 64, GPU time: 0.000787 sec.
Convolution took  0.000127 sec. on GPU
Block size: 128, GPU time: 0.000781 sec.
Convolution took  0.000132 sec. on GPU
Block size: 256, GPU time: 0.000792 sec.
Convolution took  0.000133 sec. on GPU
Block size: 512, GPU time: 0.000789 sec.
Convolution took  0.008878 sec. on CPU
PASSED
```
- The GPU is always faster than the CPU.
- For `N = 1000` the best blocksize was 128.
- Smaller sizes were slower, probably due to overhead.
- Larger sizes were slower, probably due to less efficient memory access.
