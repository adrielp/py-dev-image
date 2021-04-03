#!/bin/zsh

docker run --rm -it \
    --network host \
    -v "$(pwd)":/home/adriel/python \
    -u $(id -u):$(id -g) \
    python:development \
    /bin/zsh
