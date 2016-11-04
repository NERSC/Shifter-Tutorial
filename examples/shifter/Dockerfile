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
