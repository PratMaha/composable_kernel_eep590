#!/bin/bash
#SBATCH --job-name=example_job
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=00:03:00
#SBATCH --account=sadasivan
#SBATCH --partition=mi1004x 
# or use --partition=devel if required
 
 # Run your code. Example given below.
python your_script.py
