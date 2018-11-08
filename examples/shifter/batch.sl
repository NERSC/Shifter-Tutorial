#!/bin/bash
#SBATCH -N 1 -C haswell -p regular
#SBATCH --reservation=sc18_shifter
#SBATCH --image docker:ubuntu

srun -N 1 shifter /app/app.py
