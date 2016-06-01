#!/bin/bash -x

docker run -it --rm -P \
    -v $1:/root/files \
    --name "text-mining" \
    "text-mining:latest"