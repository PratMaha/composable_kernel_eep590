#!/bin/bash
#SBATCH --job-name=example_job
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:30:00
#SBATCH --account=sadasivan
#SBATCH --partition=devel
 
 # Run your code. Example given below.
 python omniperf_analyze.py
