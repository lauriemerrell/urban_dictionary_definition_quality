#!/usr/bin/env bash
# create a docker image
docker build -t ud_classify -f Dockerfile .
# create a docker container
docker container run --publish 5001:5001  ud_classify
