import numpy as np
import matplotlib.pyplot as plt
import re

def parse_line(line):
    blocks = int(re.search(r'NUM_BLOCK=(\d+)', line).group(1))
    threads = int(re.search(r'NUM_THREAD=(\d+)', line).group(1))
    time = float(re.search(r'computed in (\d+\.\d+)', line).group(1))
    pi = float(re.search(r'PI = ([\d\.]+)', line).group(1))
    return blocks, threads, time, pi

def read_data(filename):
    blocks, threads, times, pis = [], [], [], []
    with open(filename, 'r') as f:
        for line in f:
            b, t, time, pi = parse_line(line)
            blocks.append(b)
            threads.append(t)
            times.append(time)
            pis.append(pi)
    return np.array(blocks), np.array(threads), np.array(times), np.array(pis)

def create_visualization(blocks, threads, times):
    unique_blocks = np.sort(np.unique(blocks))
    unique_threads = np.sort(np.unique(threads))
    
    time_grid = np.zeros((len(unique_blocks), len(unique_threads)))
    
    for b, t, time in zip(blocks, threads, times):
        i = np.where(unique_blocks == b)[0][0]
        j = np.where(unique_threads == t)[0][0]
        time_grid[i, j] = time
    
    plt.figure(figsize=(12, 8))
    
    im = plt.pcolormesh(unique_threads, unique_blocks, time_grid, 
                        shading='nearest', cmap='viridis')
    
    cbar = plt.colorbar(im)
    cbar.set_label('Computation Time (seconds)', rotation=270, labelpad=15)
    
    plt.xlabel('Number of Threads')
    plt.ylabel('Number of Blocks')
    plt.title('PI Computation Performance')
    
    plt.grid(True, which='major', color='white', linestyle='-', alpha=0.3)
    
    for i in range(len(unique_blocks)):
        for j in range(len(unique_threads)):
            plt.text(unique_threads[j], unique_blocks[i], 
                    f'{time_grid[i,j]:.3f}',
                    horizontalalignment='center',
                    verticalalignment='center',
                    color='white' if time_grid[i,j] < np.mean(time_grid) else 'black')

    plt.tight_layout()
    
    plt.savefig('performance_visualization.png')
    plt.close()

def main():
    blocks, threads, times, pis = read_data('output_ex3.txt')
    
    create_visualization(blocks, threads, times)
    
    print(f"Fastest computation: {np.min(times):.4f} seconds")
    print(f"Slowest computation: {np.max(times):.4f} seconds")
    print(f"Average computation time: {np.mean(times):.4f} seconds")
    print(f"Configuration for fastest result:")
    fastest_idx = np.argmin(times)
    print(f"  Blocks: {blocks[fastest_idx]}")
    print(f"  Threads: {threads[fastest_idx]}")

if __name__ == "__main__":
    main()
