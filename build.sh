#!/bin/bash

if [ "$1" != "--custom-artifacts" ]; then
   echo "Downloading prebuilt artifacts..."
   ./download-artifacts.sh
fi

# Build OS
sudo debos ospack.yaml

# Build Video
sudo debos --memory=4Gb osvideopack.yaml

# Build Image
sudo debos --memory=4Gb image.yaml
