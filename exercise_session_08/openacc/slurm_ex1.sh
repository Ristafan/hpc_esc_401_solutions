#!/bin/bash -l

#SBATCH --job-name="ex08_1"
#SBATCH --account="uzg2"
#SBATCH --mail-type=ALL
#SBATCH --mail-user=martin.faehnrich@uzh.ch
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --hint=nomultithread

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export CRAY_CUDA_MPS=1

srun ./cpi_openacc >> output.txt
