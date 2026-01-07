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

### Option 1: Using command line
```bash
apptainer build {YOUR_PREFERRED_CONTAINER_NAME}.sif warptools.def
# Example 
# apptainer build warptools.sif warptools.def
```
### Option 2: Using setup.sh
```bash
./setup.sh
```

## Testing the Container
To test the container successfully created on the above step/s run the following command:
```bash
apptainer test {YOUR_PREFERRED_CONTAINER_NAME}.sif
# Example
# apptainer test warptools.sif
```

## Usage:
To use the container in interative shell mode use the following commands.
``` bash
# Without cuda (on host machine)
apptainer shell {YOUR_PREFERRED_CONTAINER_NAME}.sif

# With cuda (on host machine)

apptainer shell -nv {YOUR_PREFERRED_CONTAINER_NAME}.sif

# inside the interactive terminal run

source /opt/conda/bin/activate warp

```
## Toubleshooting if building on WSL

If you are trying to build the container on apptainer installed in WSL and face the following error:
> error CondaError: Failed to write to /opt/conda/pkgs/nsight-compute-2022.3.0.22-0.tar.bz2.partial errno: 28


or something similar this might be due to tmp folder size on wsl (the temp folder baloons to size ~20GiB) to fix this the easiest way is to tell apptainer to use a user defined folder as tmp directory.

To fix this use the following commands 
``` bash
   export APPTAINER_TMPDIR=/path/to/a/directory/with/ample/space/tmp
   ./setup.sh
   rm -rf /path/to/a/directory/with/ample/space/tmp
```