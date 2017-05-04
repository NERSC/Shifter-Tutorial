# Setup instructions

## Docker

Docker has versions for Mac, Windows, and many flavors of Linux at https://www.docker.com/community-edition#/download

### Check if everything is working

Run the following commands:

```bash
$ docker pull ubuntu:14.04
$ docker pull nersc/ubuntu-mpi:14.04
```

## Docker hub account

Register for an account at https://hub.docker.com/
(take note of your Docker Hub ID and password).
With docker installed, run
```bash
$ docker login -u <your docker hub ID>
```
and enter your password.

## SSH access to NERSC

If you're using Linux or macOS,
you already have the `ssh` client installed.

On Windows, install [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html)


## If the Docker installation fails

You can use http://play-with-docker.com/ to try Docker,
but it won't work if all of us try it once!
So use it only as a last resort,
and it is up to you to not use any important information
(like the Docker hub account) inside it.

