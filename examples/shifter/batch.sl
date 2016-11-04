#!/bin/bash
#SBATCH -N 1
#SBATCH --image docker:ubuntu

srun -N 1 shifter /app/app.py
