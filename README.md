# Container Computing for HPC and Scientific Workflows

Container computing is revolutionizing the way applications are developed and delivered. It offers opportunities that never existed before for significantly improving efficiency of scientific workflows and easily moving these workflows from the laptop to the supercomputer. Tools like Docker and Shifter enable a new paradigm for scientific and technical computing. However, to fully unlock its potential, users and administrators need to understand how to utilize these new approaches. This tutorial will introduce attendees to the basics of creating container images, explain best practices, and cover more advanced topics such as creating images to be run on HPC platforms using Shifter. The tutorial will also explain how research scientists can utilize container-based computing to accelerate their research and how these tools can boost the impact of their research by enabling better reproducibility and sharing of their scientific process without compromising security.  

## Prerequisites

To do the hands-on portions of this tutorial, participants will need to install Docker on a laptop or desktop system (see the [Setup](setup.md) section for details). Users should also create a docker account in advance at [https://cloud.docker.com/](https://cloud.docker.com/). This account will be needed to create images on docker cloud and dockerhub.

For more detailed instructions, see [Setup](setup.md).

## Shifter Github Repository
Shifter is available using a modified BSD license. The Shifter code stack is available in the [NERSC github repository](https://github.com/NERSC/shifter).

## Modules

- [Intro to Containers](00-intro.md)
- [First hands-on](01-hands-on.md)
- [Second hands-on - Shifter](03-hands-on.md)
    - This requires a NERSC account.
