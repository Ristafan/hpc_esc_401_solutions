#!/bin/bash -l
#SBATCH --job-name="mpi_cpi_job"
#SBATCH --account="uzh8"
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --cpus-per-task=1
#SBATCH --partition=debug
#SBATCH --constraint=mc    # Add this line
#SBATCH --output="mpi_cpi_output.log"
#SBATCH --error="mpi_cpi_error.log"

export OMP_NUM_THREADS=1

srun ./cpi_mpi

