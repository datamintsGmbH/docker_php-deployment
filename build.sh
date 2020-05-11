#!/usr/bin/env bash

# Ensure working directory is local to this script
# @see http://stackoverflow.com/a/20407874
cd "$(dirname "$0")"

# Check that we have at least two arguments (the image name and the tag).
if [ $# -lt 1 ]; then
	echo "Usage: $(basename "$0") <image> <tag>"
	exit 1
fi
IMAGE=$1
TAG=$2

# Check that tag directory exists.
if [ ! -d "./${TAG}" ]; then
	echo "Tag '${TAG}' not found!"
	exit 1
fi

# Build the image.
docker build --no-cache -t $IMAGE:$TAG ./$TAG

# Push the image.
docker push $IMAGE:$TAG
