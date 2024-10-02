#!/bin/bash -l
#SBATCH --job-name="omp_cpi_job"
#SBATCH --account="uzh8"
#SBATCH --time=00:05:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=128
#SBATCH --partition=debug
#SBATCH --constraint=mc    # Add this line
#SBATCH --output="omp_cpi_output.log"
#SBATCH --error="omp_cpi_error.log"

export OMP_NUM_THREADS=128

srun ./cpi_omp

