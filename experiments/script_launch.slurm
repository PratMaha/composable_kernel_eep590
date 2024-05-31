#!/bin/bash
# The interpreter used to execute the script

#“#SBATCH” directives that convey submission options:

#SBATCH --job-name=script
#SBATCH --mail-type=BEGIN,END
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=2:00:00
#SBATCH --account=sadasivan
#SBATCH --partition=mi1004x


python3 /work1/sadasivan/student36/composable_kernel/build/results/scripts/script.py