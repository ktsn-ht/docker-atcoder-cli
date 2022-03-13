FROM centos:centos8

WORKDIR /work
COPY cpp /root/.config/atcoder-cli-nodejs/cpp
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-* \
 && yum update -y && yum install -y \
    git \
    gcc-c++ \
    python3 \
    nodejs \
 && npm update -g npm && npm install -g atcoder-cli \
 && pip3 install online-judge-tools \
 && acc config oj-path /usr/local/bin/oj \
 && acc config default-test-dirname-format test \
 && acc config default-template cpp \
 && acc config default-task-choice all \
 && echo 'alias acclogin="acc login"' >> ~/.bashrc \
 && echo 'alias ojlogin="oj login https://beta.atcoder.jp/"' >> ~/.bashrc
