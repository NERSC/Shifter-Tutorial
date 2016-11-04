# Welcome and intro to Docker

## What is a container?


### One application, one physical server

`App / OS / Hardware`

- Slow deployment times
- Huge costs
- Wasted resources
- Difficult to scale
- Difficult to migrate
- Vendor lock in


### Hypervisor-based Virtualization

`(App / guest OS, App / guest OS) / Hypervisor / Host OS / Hardware`

- One physical server can contain multiple application
- Each application runs in a virtual machine (VM)

- Benefits of VMs
  * Better resource pooling
    - One physical machine divided into multiple VM
  - Easier to scale
  - VM's in the cloud
    * Rapid elasticity
    * Pay as you go model

- Limitations of VMs
  - Each VM still requires
    * CPU allocation
    * Storage
    * RAM
    * An entire guest OS
  - The more VM's you run, the more resources you need
  - Guest OS means wasted resources
  * Application portability not guaranteed

### Containers

`(App / container, App / container) / (OS Kernel / Host OS) /  Hardware`

Container based virtualization uses the kernel on the host's OS to run
multiple guest instances

- Each guest instance is called a *container*
- Each container has its own
  * Root filesystem
  * Processes
  * Memory
  * Devices
  * Network ports

- Isolated application platform

- Containers vs VMs
  * Containers are more lightweight
  * No need to install guest OS
  * Less CPU, RAM, storage space required
  * More containers per machine than VMs
  * Greater portability

### Docker

- Docker is many different things:
 * CLI (client)
 * Engine (server)
   * Enables containers to be built, shipped and run
   * uses Linux Kernel namespaces and control groups
   * Namespaces allow isolated workspace
     - `Cgroup      CLONE_NEWCGROUP   Cgroup root directory
       IPC         CLONE_NEWIPC      System V IPC, POSIX message queues
       Network     CLONE_NEWNET      Network devices, stacks, ports, etc.
       Mount       CLONE_NEWNS       Mount points
       PID         CLONE_NEWPID      Process IDs
       User        CLONE_NEWUSER     User and group IDs
       UTS         CLONE_NEWUTS      Hostname and NIS domain name`

   * `(App/container, App/container) / Docker Engine / (Linux kernel / OS) / Hardware`
   * 

 * Distributed cluster (swarm mode - cluster of Docker Engines)
 - Machine (deploy Docker Engine locally or to remote servers)
 - Image format
 - A company maintaining and developing the Docker platform
