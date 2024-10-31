# Ex 1
- inif_f: Initializes the matrix f to store boundary and interior source terms based on given parameters.

- jacobi_step: Calculates the root mean square difference between two matrices mat1 and mat2.

- norm_diff: Performs a single Jacobi iteration on matrices u_new and u_old to solve the Poisson equation, updating boundary conditions as needed.

![test2](https://github.com/user-attachments/assets/628f09c0-a7af-4562-8cde-3677b39c854e)

![test](https://github.com/user-attachments/assets/aaa294d6-5929-48bc-8fb5-b6dd453a0ae6)

# Ex 2

For this exercise I wrote a small python script that compares the outputs and it returned as expected ```True``` which means the outputs are the same.

# Ex 3
As seen in the following outputs, the result remained the same using different number of threads.

### Num threads = 1
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016

### Num threads = 2
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016

### Num threads = 3
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016

### Num threads = 10
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016

## 
The second loop does have a race conditions, which means we cannot just insert the usual #pragma omp parallel for.
This means we have to modify this clause to make it work as we intend it to work. Thats why I created a new file and added #pragma omp atomic to update the 0 count.
