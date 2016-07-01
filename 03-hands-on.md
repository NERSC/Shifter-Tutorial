# Second hands-on - Shifter

## Logging in to NERSC

Use ssh to connect to Cori.  The username and password will be on the training account sheet.  Once you are logged in, use module load to load the Shifter utilities.

```bash
ssh <account>@cori.nersc.gov
module load shifter```

## Pulling an image

Pull and image using shifterimg.  You will need to preface the image with "docker" to indicate this is a docker pull operation.

```bash
shifterimg pull docker:ubuntu:14.04```

## Running an image interactively

Use salloc and shifter to test the image.

```bash
salloc -N 1
shifter bash```

You should be able to browse inside the image and confirm that it matches what you pushed to dockerhub earlier.

```bash
ls -l /app
lsb_release -a```

Once you are done exploring, exit out.
```bash
exit
exit
```

## Submitting a Shifter batch job

Now create a batch submission script and try running a batch job with shifter.  Use vi or your other favorite editor to create the submission script or cat the contents into a file.

```bash
cat << EOF > submit.sl
#!/bin/bash
#SBATCH -N 1
#SBATCH --image docker:ubuntu

srun -N 1 shifter /app/app.py
EOF
```
Use the Slurm sbatch command to submit the script.

```bash
sbatch ./submit.sl
```

## Running a parallel Python MPI job

TODO
