FROM ubuntu:16.04
LABEL maintainer="knepperjm@gmail.com"


RUN apt-get update && \
    apt-get install -y \
        git

RUN git clone https://github.com/ansible/awx.git

RUN 
