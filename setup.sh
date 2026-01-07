#!/bin/bash

set -e


if command -v apptainer &> /dev/null; then
    CONTAINER_CMD="apptainer"
    VERSION=$(apptainer --version)
    echo "Apptainer found: $VERSION"
else 
    echo "Apptainer is not installed! Please install before running the setup.sh"
    exit 1
fi

if sudo -n true 2>/dev/null; then
    echo "Building with sudo..."
    BUILD_CMD="sudo apptainer build warptools.sif warptools.def"
else
    echo "Cannot use sudo. Trying --fakeroot..."
    BUILD_CMD="apptainer build --fakeroot warptools.sif warptools.def"
fi

$BUILD_CMD