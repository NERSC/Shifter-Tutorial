#!/bin/bash
#SBATCH -N 1 -C haswell -p debug
#SBATCH --image docker:ubuntu

srun -N 1 shifter /app/app.py
