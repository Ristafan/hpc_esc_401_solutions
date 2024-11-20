#!/bin/bash -l
#SBATCH --job-name="ex2"
#SBATCH --account="uzg2"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=martinniels.faehnrich@uzh.ch
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --partition=debug
#SBATCH --constraint=gpu
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export CRAY_CUDA_MPS=1

for nsteps in 100 1000 10000 100000; do
  for power in 2 8 16 32; do
    srun -n 1 ./blur.openacc $power $nsteps >> blur_naive.out
  done
done
