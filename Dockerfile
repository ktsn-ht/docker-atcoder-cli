FROM alpine:3.16.0

ARG USER=atcoder
ENV ENV="/etc/profile"
RUN apk update && apk add --no-cache \
    npm \
    py3-pip \
    g++ \
 && npm update -g npm && npm install -g atcoder-cli \
 && pip install online-judge-tools \
 && echo 'alias acclogin="acc login"' >> $ENV \
 && echo 'alias ojlogin="oj login https://beta.atcoder.jp/"' >> $ENV \
 && addgroup -g 1000 -S ${USER} \
 && adduser -u 1000 -S ${USER} -G ${USER} \
 && echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
 && echo "${USER}:${USER}" | chpasswd

USER ${USER}
WORKDIR /work
RUN mkdir -p /home/${USER}/.config/atcoder-cli-nodejs
COPY --chown=${USER}:${USER} cpp /home/${USER}/.config/atcoder-cli-nodejs/cpp
RUN acc config oj-path /usr/bin/oj \
 && acc config default-test-dirname-format test \
 && acc config default-template cpp \
 && acc config default-task-choice all
