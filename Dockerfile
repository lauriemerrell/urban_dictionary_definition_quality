# -*- dockerfile -*-
FROM ubuntu:latest

#
# Docker file system locations
#

ARG docker_api_dir=/api
ARG docker_lib_dir=${docker_api_dir}/lib
ARG docker_models_dir=${docker_api_dir}/models

RUN mkdir -p ${docker_api_dir} && mkdir -p ${docker_lib_dir} && mkdir -p ${docker_models_dir}

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
COPY ./models/logistic/logistic_cv.p ${docker_models_dir}
COPY ./models/logistic/logistic_tfidf.p ${docker_models_dir}
COPY ./models/logistic/best_logistic.p ${docker_models_dir}


ENV MODEL_LOCATION="${docker_models_dir}/best_logistic.p"
ENV VECTORIZER_LOCATION="${docker_models_dir}/logistic_cv.p"
ENV TFIDF_LOCATION="${docker_models_dir}/logistic_tfidf.p"

# Entry-point

EXPOSE 50001
CMD ["sh", "api_entrypoint.sh"]
