# Container Computing for HPC and Scientific Workflows - CUG17 Tutorial

Container computing is revolutionizing the way applications are developed and delivered.  It offers opportunities that never existed before for significantly improving efficiency of scientific workflows and easily moving these workflows from the laptop to the supercomputer.  Tools like Docker and Shifter enable a new paradigm for scientific and technical computing.  However, to fully unlock its potential, users and administrators need to understand how to utilize these new approaches.  This tutorial will introduce attendees to the basics of creating container images, explain best practices, and cover more advanced topics such as creating images to be run on HPC platforms using Shifter.  The tutorial will also explain how research scientists can utilize container-based computing to accelerate their research and how these tools can boost the impact of their research by enabling better reproducibility and sharing of their scientific process without compromising security.  

The content for the handouts and slides will be posted and updated at [https://github.com/nersc/Shifter-Tutorial](https://github.com/nersc/Shifter-Tutorial).

## Prerequisites

This is hands-on tutorial. Participants should bring a laptop and pre-install software in advance to make the best use of time during the tutorial. Participants should [install Docker](https://docs.docker.com/) locally on their laptop.  Alternatively, participants can have remote access to a system that has docker installed and allows them to run docker commands.  Users can also create a dockerhub account in advance at [https://hub.docker.com/](https://hub.docker.com/).  This account will be needed to create images on dockerhub.  In addition, users should install an ssh client for their operating system so they can access the HPC resources we will use for the Shifter portion of the tutorials.

For more detailed instructions, see [Setup](setup.md).

## Communication
Please raise your hand if you need assistance. <!--- We've also set up a [Telegram group chat room](https://telegram.me/shifter_containers) where you can post questions and solutions to issues you encounter. To use this you will need to have Telegram installed already. Clicking on the the Telegram chat link above will guide you through installation. -->

## Shifter Github Repository
Shifter is available using a modified BSD license. The Shifter code stack is available in the [NERSC github repository](https://github.com/NERSC/shifter). 

## Feedback
<!--We'd appreciate you taking a few minutes to fill out [a very short survey](https://www.surveymonkey.com/r/C3NWBKD) about this tutorial at the end of the session. --> 
Feel free to join the [Shifter group](https://groups.google.com/forum/#!forum/shifter-hpc) or contact Shane, Doug, or Lisa if you have any questions about Shifter in the future.

## Agenda

- 8:30: [Welcome and Intro to Containers](00-intro.md)
    - Intro to Docker
    - [First hands-on](01-hands-on.md)
      - [Pulling and running an existing image](01-hands-on.md#pulling-and-running-an-existing-image)
      - [Making changes and committing them](01-hands-on.md#making-changes-and-committing-them)
      - [Creating and building a Dockerfile](01-hands-on.md#creating-and-building-a-dockerfile)
      - [Pushing a Dockerfile to dockerhub](01-hands-on.md#pushing-a-dockerfile-to-dockerhub)
    - [Intro to Shifter and how it is different](02-shifter.md)
- 9:30: Installing Shifter
    - Guided Tour of Shifter Installation
    - How to roll your own installation for CLE5 and CLE6
- 10:00: Break
    - Distribute NERSC logins. **Please obtain a NERSC login from tutorial staff during the break**
- 10:30: Installing Shifter Con't
    - Shifter Gateway Tour
- 11:00: [Second hands-on - Shifter](03-hands-on.md)
    - [Logging in to NERSC](03-hands-on.md#logging-in-to-nersc)
    - [Pulling an image](03-hands-on.md#pulling-an-image)
    - [Running an image interactively](03-hands-on.md#running-an-image-interactively)
    - [Submitting a Shifter batch job](03-hands-on.md#submitting-a-shifter-batch-job)
    - [Running a parallel Python MPI job](03-hands-on.md#running-a-parallel-python-mpi-job)
- 11:45: [Uses Cases and Optimization](04-use-cases.md)
    - [Science Use Cases](04-use-cases.md#lhc-astronomy)
    - [Controlling layers and making builds faster](05-hands-on.md#controlling-layers-and-making-builds-faster)
    - [What goes in the image and what should stay out](05-hands-on.md#what-goes-in-the-image-and-what-should-stay-out)
    - [Bring us your problem](05-hands-on.md#bring-us-your-problem)
- 12:00: Fin