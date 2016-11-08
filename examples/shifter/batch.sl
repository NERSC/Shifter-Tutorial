#!/bin/bash
#SBATCH -N 1 -C haswell
#SBATCH --reservation=sc16
#SBATCH --image docker:ubuntu

srun -N 1 shifter /app/app.py
