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
d) No it is not true, since memory usually isn't allocated next to each other.
e) Code in file `swap_array.cpp`
```

# Exercise 3



