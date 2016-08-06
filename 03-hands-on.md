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
salloc -N 1 --image ubuntu:14.04
shifter bash
```

You should be able to browse inside the image and confirm that it matches what you pushed to dockerhub earlier.

```bash
ls -l /app
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
#SBATCH -N 1
#SBATCH --image ubuntu:latest

srun -N 1 shifter /app/app.py
EOF
```
Use the Slurm sbatch command to submit the script.

```bash
sbatch ./submit.sl
```

## Running a parallel Python MPI job

It is possible to run MPI jobs in Shifter and obtain native performance.  There are several ways to achieve this. We will demonstrate one approach here.

On your laptop create and push a docker image with MPICH and a sample application installed.


First, create and save a Hello World MPI application.
```code
// Hello World MPI app
#include <mpi.h>

int main(int argc, char** argv) {
    int size, rank;
    char buffer[1024];

    MPI_Init(&argc, &argv);

    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    gethostname(buffer, 1024);

    printf("hello from %d of %d on %s\n", rank, size, buffer);

    MPI_Barrier(MPI_COMM_WORLD);

    MPI_Finalize();
    return 0;
}
```

Next create, a Dockerfile that install MPICH and the application.

```bash
# MPI Dockerfile
FROM ubuntu:14.04
RUN apt-get update && \
    apt-get install -y autoconf automake gcc g++ make gfortran
ADD http://www.mpich.org/static/downloads/3.2/mpich-3.2.tar.gz /usr/local/src/
RUN cd /usr/local/src/ && \
    tar xf mpich-3.2.tar.gz && \
    cd mpich-3.2 && \
    ./configure && \
    make && make install && \
    cd /usr/local/src && \
    rm -rf mpich-3.2

ADD helloworld.c /
RUN mkdir /app && mpicc helloworld.c -o /app/hello

ENV PATH=/usr/bin:/bin:/app
```

Build and push the image.
```bash
docker build -t <mydockerid>/hello:latest .
docker push <mydockerid>/hello:latest
```

Next, return to your Cori login, pull your image down and run it.

```bash
shifterimg pull <mydockerid>/hello:latest
#Wait for it to complete
salloc -N 2 --image <mydockerid>/hello:latest
# Wait for prepare_compilation_report
# Cori has 32 physical cores per node with 2 hyper-threads per core.  
# So you can run up to 64 tasks per node.
srun -N 2 -n 128 shifter /app/hello
exit
```

If you have your own MPI applications, you can attempt to Docker-ize them using the steps above and run it on Cori.  As a courtesy, limit your job sizes to leave sufficient resources for other participants.  _Don't forget to exit from any "salloc" shells once you are done testing._
