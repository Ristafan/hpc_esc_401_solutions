import matplotlib.pyplot as plt

# Data extraction (assuming the data is in a consistent format)
test_sizes = [1, 2, 16, 32, 64, 256, 4096, 262144, 16777216, 67108864, 268435456]
openmp_times = [0, 0, 0, 0, 9.53674e-07, 0, 2.14577e-06, 0.000377893, 0.0215509, 0.0937889, 0.371247]
openacc_times = [0.000279903, 0.000257969, 0.000253916, 0.000258207, 0.000257015, 0.000257969, 0.00026989, 0.00114107, 0.033309, 0.130972, 0.521261]

# Plotting
plt.figure(figsize=(10, 6))
plt.plot(test_sizes, openmp_times, label='OpenMP', marker='o')
plt.plot(test_sizes, openacc_times, label='OpenACC', marker='x')
plt.xlabel('Test Size')
plt.ylabel('Execution Time (s)')
plt.title('OpenMP vs. OpenACC Performance')
plt.xscale('log')
plt.yscale('log')
plt.grid(True)
plt.legend()
plt.show()
