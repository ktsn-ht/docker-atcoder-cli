FROM alpine:3.16.0

WORKDIR /work
ENV ENV="/etc/profile"
COPY cpp /root/.config/atcoder-cli-nodejs/cpp
RUN apk update && apk add --no-cache \
    npm \
    py3-pip \
    g++ \
 && npm update -g npm && npm install -g atcoder-cli \
 && pip install online-judge-tools \
 && acc config oj-path /usr/bin/oj \
 && acc config default-test-dirname-format test \
 && acc config default-template cpp \
 && acc config default-task-choice all \
 && echo 'alias acclogin="acc login"' >> $ENV \
 && echo 'alias ojlogin="oj login https://beta.atcoder.jp/"' >> $ENV
