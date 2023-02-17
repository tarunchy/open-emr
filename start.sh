#!/bin/sh

# Build the Docker image
docker build -t openemr-demo .

# Run the Docker container
docker run -p 8082:80 openemr-demo

