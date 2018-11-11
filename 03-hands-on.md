# Second hands-on - Shifter

## Logging in to NERSC

Use ssh to connect to Cori.  The username and password will be on the training account sheet.

```bash
ssh <account>@cori.nersc.gov
```

## Pulling an image

Pull an image using shifterimg.  You can pull a standard image such as Ubuntu or an image you pushed to dockerhub in the previous session.

```bash
shifterimg pull ubuntu:14.04
# OR
shifterimg pull scanon/shanetest:latest
```

## Running an image interactively

Use salloc and shifter to test the image.

```bash
salloc -N 1 -C haswell -q regular --reservation=sc18_shifter --image ubuntu:14.04 -A ntrain
... wait for prompt ...
shifter bash
```

You should be able to browse inside the image and confirm that it matches what you pushed to dockerhub earlier.

```bash
lsb_release -a
```

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
#SBATCH -N 1 -C haswell
#SBATCH --reservation=sc18_shifter
#SBATCH -q regular
#SBATCH -A ntrain
#SBATCH --image=scanon/mpi:test

srun -N 1 shifter /app/hello
EOF
```
Use the Slurm sbatch command to submit the script.

```bash
sbatch ./submit.sl
```

## Running a parallel MPI job

It is possible to run MPI jobs in Shifter and obtain native performance.  There are several ways to achieve this. We will demonstrate one approach here.

If you did not do so earlier, tag and push the MPI image you created earlier.

```bash
docker tag hellompi mydockerid/hellompi
docker push mydockerid/hellompi
```

Now, return to your Cori login, pull your image down and run it.

```bash
shifterimg pull <mydockerid>/hellompi:latest
#Wait for it to complete
salloc -N 2 -C haswell -q regular -A ntrain --reservation=sc18_shifter --image <mydockerid>/hellompi:latest
# Wait for prepare_compilation_report
# Cori has 32 physical cores per node with 2 hyper-threads per core.  
# So you can run up to 64 tasks per node.
srun -N 2 -n 128 shifter /app/hello
exit
```

If you have your own MPI applications, you can attempt to Docker-ize them using the steps above and run it on Cori.  As a courtesy, limit your job sizes to leave sufficient resources for other participants.  _Don't forget to exit from any "salloc" shells once you are done testing._

## Using Volume mounts

Like Docker, Shifter allows you to mount directories into your container.
The syntax is similar to Docker but uses "--volume".  Here we will mount a
scratch directory into the volume as /data.

```bash
mkdir $SCRATCH/input
echo 3.141592 > $SCRATCH/input/data.txt
shifter --volume $SCRATCH/input:/data --image=ubuntu bash
cat /data/data.txt
```
