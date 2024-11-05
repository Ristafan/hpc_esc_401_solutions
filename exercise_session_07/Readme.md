# Exercise 1
- a) a pointer to the first element of an array of integers (int*)
- b) an integer (first element in the array) 
- c) pointer to a pointer to an integer
- d) 10
- e) 10
- f) 40
- g) 60
- h) 15
- i) It would set the value of the memory one before p[0] to 42, but this results in an index error (**invalid**)
- j) It is also undefined behaviour due to the **invalid** index
- k) It is the same as p[9] and therefore 100
- l) It is again out of range and therefore is **invalid**


# Exercise 2
```
a) M is a pointer to a pointer to an integer
b) M is a pointer to an integer (**int)
  *M is a pointer to an integer, pointing to the first array (int*) which is which points to M[0]
  **M is the integer value at the start of the first array (M[0][0]) 
c) M[1][3] is 8
  *(M[0]+1) is 1 (M[0][1])
  *(*(M+1)+3) is 8 as well (M[1][3])
d) No it is not true.
e) Code in file `swap_array.cpp`
```

# Exercise 3
- a) y tells the row and x tells the column
- b) y * x = 14 * 6 = 84
- c) If stored in column-major order then (1,3) and (2,3) are adjacent, if stored in row-major order then (1,3) and (1,4) are adjacent in memory.
- d) If your operations mostly involve row-wise access, row-major order is generally better. If you need column-wise access, column-major order is preferable, meaning it depends on the access pattern.
- e) In this case the stride for the x dimension is 1.
- f) Since the length of each row is 14, the stride for the dimension y is 14.
- g) Since our formula is (x * strideX + y * strideY) => A[10] 
- h) using the formula => A[42]
- i) using the formula => A[102] which is no longer inside the index
- j) Code in file `compute_index.cpp`
