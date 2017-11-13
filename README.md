# Container Computing for HPC and Scientific Workflows - SC17 Tutorial

Container computing is revolutionizing the way applications are developed and delivered. It offers opportunities that never existed before for significantly improving efficiency of scientific workflows and easily moving these workflows from the laptop to the supercomputer. Tools like Docker and Shifter enable a new paradigm for scientific and technical computing. However, to fully unlock its potential, users and administrators need to understand how to utilize these new approaches. This tutorial will introduce attendees to the basics of creating container images, explain best practices, and cover more advanced topics such as creating images to be run on HPC platforms using Shifter. The tutorial will also explain how research scientists can utilize container-based computing to accelerate their research and how these tools can boost the impact of their research by enabling better reproducibility and sharing of their scientific process without compromising security.  

The content for the handouts and slides will be posted and updated at [https://github.com/nersc/Shifter-Tutorial](https://github.com/nersc/Shifter-Tutorial). Previous versions of this tutorial have been stored as git tags.

## Prerequisites

This is hands-on tutorial. Participants should bring a laptop and pre-install Docker in advance to make the best use of time during the tutorial (see the [Setup](setup.md) section for details). Users can also create a docker account in advance at [https://cloud.docker.com/](https://cloud.docker.com/). This account will be needed to create images on docker cloud and dockerhub. In addition, users should install an ssh client for their operating system so they can access the HPC resources we will use for the Shifter portion of the tutorials.

For more detailed instructions, see [Setup](setup.md).

## Communication
Please raise your hand if you need assistance. You can also ask questions on this [Google Doc](https://docs.google.com/document/d/18N_yE7D7hAvrbpuhfhnjc1M-Eok6nE9d4IxrHeuqMgo/edit?usp=sharing).

## Shifter Github Repository
Shifter is available using a modified BSD license. The Shifter code stack is available in the [NERSC github repository](https://github.com/NERSC/shifter).

## Feedback
Please fill out [the SC survey](http://bit.ly/sc17-eval) about this tutorial at the end of the session.
Feel free to join the [Shifter group](https://groups.google.com/forum/#!forum/shifter-hpc) or contact Shane or Lisa if you have any questions about Shifter in the future.

## Agenda

- 13:30: [Welcome and Intro to Containers](00-intro.md)
    - [Intro to Containers](https://github.com/NERSC/Shifter-Tutorial/raw/master/presentations/Intro_to_Containers.pdf)
    - [First hands-on](01-hands-on.md)
      - [Pulling and running an existing image](01-hands-on.md#pulling-and-running-an-existing-image)
      - [Making changes and committing them](01-hands-on.md#making-changes-and-committing-them)
      - [Creating and building a Dockerfile](01-hands-on.md#creating-and-building-a-dockerfile)
      - [Pushing a Dockerfile to dockerhub](01-hands-on.md#pushing-a-dockerfile-to-dockerhub)
- 14:30: [Intro to Shifter](02-shifter.md)
    - Overview of Shifter
    - How is it different from Docker
    - Quick guide to Shifter Installation
- 15:00: Break
    - Distribute NERSC logins. **Please obtain a NERSC login from tutorial staff during the break**
- 15:30: [Second hands-on - Shifter](03-hands-on.md)
    - [Logging in to NERSC](03-hands-on.md#logging-in-to-nersc)
    - [Pulling an image](03-hands-on.md#pulling-an-image)
    - [Running an image interactively](03-hands-on.md#running-an-image-interactively)
    - [Submitting a Shifter batch job](03-hands-on.md#submitting-a-shifter-batch-job)
    - [Running a parallel Python MPI job](03-hands-on.md#running-a-parallel-python-mpi-job)
- 16:30: Advanced Shifter, Optimizations, and Uses Cases
    - [Advanced Shifter and Optimizations](https://github.com/NERSC/Shifter-Tutorial/raw/master/presentations/Shifter-Advanced-Optimizations.pdf)
    - [Controlling layers and making builds faster](04-optimizing.md#controlling-layers-and-making-builds-faster)
    - [What goes in the image and what should stay out](04-optimizing.md#what-goes-in-the-image-and-what-should-stay-out)
    - [Science Use Cases](05-use-cases.md)
- 17:00: [Wrap-Up](06-wrap-up.md)
