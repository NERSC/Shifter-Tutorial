# Setup instructions

## Docker

Docker has versions for Mac, Windows, and many flavors of Linux at https://www.docker.com/community-edition#/download

### Check if everything is working

Run the following commands:

```bash
$ docker run hello-world
$ docker pull ubuntu:14.04
$ docker pull nersc/ubuntu-mpi:14.04
```

## Docker hub account

Register for an account at https://cloud.docker.com/
(take note of your Docker ID and password).
With docker installed, run
```bash
$ docker login -u <your docker ID>
```
and enter your password.

## SSH access to NERSC

If you're using Linux or macOS,
you already have the `ssh` client installed.

On Windows, install [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)


## If you have problems installing Docker

You can use http://play-with-docker.com/ to try Docker.
We suggest using pay-with-docker only as a last resort.
