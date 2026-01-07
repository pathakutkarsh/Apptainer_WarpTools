# WarpTools Apptainer Container

This repository contains an Apptainer container definition for WarpTools, a software package for cryo-EM data analysis.

The container is built on top of ubuntu:22.04 image.

## Prerequisites

1. **Apptainer/Singularity**: Install Apptainer
   - Ubuntu/Debian: `sudo apt-get install apptainer`
   - CentOS/RHEL: `sudo yum install apptainer`
   - Or build from source: https://apptainer.org/docs/admin/main/installation.html

2. **Conda dependencies** (handled automatically by the container)

## Building the Container

### Using command line
```bash
apptainer build {YOUR_PREFERRED_CONTAINER_NAME}.sif warptools.def
# example apptainer build warptools_1.0.0.sif warptools.def
```
## To Do

Create a setup.sh file to build the container image 


