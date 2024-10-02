#!/bin/bash -l
#SBATCH --job-name="my_job"
#SBATCH --account="uzh8"
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --partition=debug
#SBATCH --constraint=mc
#SBATCH --output="mpi_output.log"
#SBATCH --error="mpi_error.log"
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun cpi_mpi
