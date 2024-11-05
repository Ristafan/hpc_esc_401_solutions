# Exercise 1
- a) a pointer to an integer (int[10])
- b) an integer (first element in the array) 
- c) a pointer to an array of integers
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
- a) M is a pointer to a pointer to an integer
- b) As already stated M is a pointer to a pointer to an integer (meaning the address of it), *M is a pointer to an integer (again meaning the address of it) and **M is the address of the integer pointer that points to an array (M[0])
- c) M[1][3] is 8, *(M[0]+1) is 5 and *(*(M+1)+3) is 8 as well
- d) No it is not true, since memory usually isn't allocated next to each other.
- e) Code in file `swap_array.cpp`


# Exercise 3



