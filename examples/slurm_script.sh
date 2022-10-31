#!/bin/bash
#SBATCH -p normal
#SBATCH -A <your-group-name>             # the Slurm account to use (e.g. hpc-prf-dfhy)
#SBATCH --job-name=<name-of-job>         # create a short name for your job
#SBATCH --nodes=1                        # node count
#SBATCH --ntasks=1                       # total number of tasks across all nodes
#SBATCH --cpus-per-task=16               # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=12G                # memory per cpu-core (4G per cpu-core is default)
#SBATCH --time=09:55:00                  # total run time limit (HH:MM:SS)

module load system singularity
FOLDER=<absolute folder to your experiment code>

#SLURM_JOB_ID=test # this can be commented in if you want to run the script manually in the console prior to submitting

cd $FOLDER
echo "Working in $FOLDER"
echo "Job ID is: $SLURM_JOB_ID"
echo "Starting singularity."
singularity exec pc2.simg bash -c "python3.8 runexperiment.py $SLURM_JOB_ID"