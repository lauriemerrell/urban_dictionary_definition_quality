#!/usr/bin/env bash
# create a docker image
docker build -t sentiment-classification-docker-image -f Dockerfile .
# create a docker container
docker container run --publish 5001:5001  sentiment-classification-docker-image
