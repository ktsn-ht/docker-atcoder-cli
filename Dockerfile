FROM centos:centos8
ENV DEBIAN_FRONTEND=noninteractive
ARG username
ARG reponame

RUN yum update -y && yum install -y \
    git \
    gcc-c++ \
    python3 \
    nodejs \
 && npm update -g npm && npm install -g atcoder-cli \
 && pip3 install online-judge-tools \
 && acc config oj-path /usr/local/bin/oj \
 && acc config default-test-dirname-format test \
 && acc config default-template cpp \
 && acc config default-task-choice all
COPY cpp /root/.config/atcoder-cli-nodejs/cpp
COPY ssh /root/.ssh

WORKDIR /work
RUN chmod 600 /root/.ssh/* \
 && git clone git@github.com:${username}/${reponame}.git
