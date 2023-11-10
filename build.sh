#!/bin/bash

if [ "$1" != "--custom-artifacts" ]; then
   echo "Downloading prebuilt artifacts..."
   ./download-artifacts.sh
fi

# Build OS
debos ospack.yaml

# Build Video
debos --memory=4Gb osvideopack.yaml

# Build Image
debos --memory=4Gb image.yaml
