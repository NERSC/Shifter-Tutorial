# Setup instructions

## Docker

If your Docker installation fails,
check [#If the Docker installation fails] at the end of this document.

### Linux

Choose your distribution from https://docs.docker.com/engine/installation/linux/
and follow the instructions.
You need a reasonably new kernel version (3.10 or higher).

### Docker for Mac
Uses `xhyve` to run a Linux virtual machine
https://docs.docker.com/engine/installation/mac/#docker-for-mac

### Docker for Windows:
Uses `Hyper-V` to run a Linux virtual machine
https://docs.docker.com/engine/installation/windows/#/docker-for-windows
(Requires Windows 10).

### Fallback: the Docker Toolbox

For older versions of Windows or macOS you can use the Docker Toolbox:
https://docs.docker.com/engine/installation/windows/#/docker-for-windows.
It uses VirtualBox instead of the native virtualization technologies.

### Check if everything is working

Run the following commands:

```bash
$ docker pull ubuntu:14.04
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

On Windows,
install [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) ([Direct Download](https://the.earth.li/~sgtatham/putty/latest/x86/putty.exe))

## If the Docker installation fails

You can use http://play-with-docker.com/ to try Docker,
but it won't work if all of us try it once!
So use it only as a last resort,
and it is up to you to use any important information
(like the Docker hub account) inside it.

