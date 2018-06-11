ARG FROM_IMG_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME="uplain-openmpi"
ARG FROM_IMG_TAG="latest"
ARG FROM_IMG_HASH=""
FROM ${FROM_IMG_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

RUN apt-get update \
 && apt-get install -y openssh-server
COPY opt/entry/19-cluser-setup.sh \
 opt/entry/20-mkdir.sh \
 opt/entry/21-sshd.sh \
 /opt/entry/
ENV SSHD_PORT=22
COPY opt/qnib/bashrc /opt/qnib/bashrc
