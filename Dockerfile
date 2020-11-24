# -*- dockerfile -*-
FROM ubuntu:latest

#
# Docker file system locations
#

ARG docker_api_dir=/api
ARG docker_lib_dir=${docker_api_dir}/lib
ARG docker_models_dir=${docker_api_dir}/models

RUN mkdir -p ${docker_api_dir} && mkdir -p ${docker_lib_dir} && mkdir -p ${docker_models_dir} && mkdir -p ${docker_liblinear_dir}

#
# Deps
#


# System

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
    build-essential \
    checkinstall \
    curl \
    libbz2-dev \
    libc6-dev \
    libgdbm-dev \
    libncursesw5-dev \
    libreadline-gplv2-dev \
    libsqlite3-dev \
    libssl-dev \
    tk-dev \
    wget \
    git-core \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*


# install packages
COPY ./requirements.txt ${docker_api_dir}
RUN pip3 install -r ${docker_api_dir}/requirements.txt


#
# Source code
#


COPY . ${docker_api_dir}
WORKDIR ${docker_api_dir}
COPY ./models/review.dict ${docker_models_dir}
COPY ./models/review.liblinear.model ${docker_models_dir}


ENV MODEL_FILE="${docker_models_dir}/review.liblinear.model"
ENV DICT_FILE="${docker_models_dir}/review.dict"

# Entry-point

EXPOSE ${HTTP_PORT}
CMD ["sh", "api_entrypoint.sh"]
