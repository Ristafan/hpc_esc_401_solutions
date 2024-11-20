#!/bin/bash -l
#SBATCH --job-name="ex3"
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

for dimensions in 10 100 1000 10000; do
	srun -n 1 ./dot.openacc $dimensions >> dot.out
	done
