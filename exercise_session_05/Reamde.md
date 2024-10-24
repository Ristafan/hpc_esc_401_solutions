[eiger][mfaehnri@eiger-ln004 race_conditions]$ export OMP_NUM_THREADS=1
[eiger][mfaehnri@eiger-ln004 race_conditions]$ ./executable
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016
[eiger][mfaehnri@eiger-ln004 race_conditions]$ export OMP_NUM_THREADS=2
[eiger][mfaehnri@eiger-ln004 race_conditions]$ ./executable
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016
[eiger][mfaehnri@eiger-ln004 race_conditions]$ export OMP_NUM_THREADS=3
[eiger][mfaehnri@eiger-ln004 race_conditions]$ ./executable
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016
[eiger][mfaehnri@eiger-ln004 race_conditions]$ export OMP_NUM_THREADS=10
[eiger][mfaehnri@eiger-ln004 race_conditions]$ ./executable
Size of integer array/file: 1000000
max number in file: 38747
number of 0s in file: 646016
true number of 0s in file: 646016
[eiger][mfaehnri@eiger-ln004 race_conditions]$ export OMP_NUM_THREADS=10
