FROM ubuntu:xenial-20180808
ENV container docker
WORKDIR /root

# install packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
            curl \

# Haskell stack settings
RUN curl -sSL https://get.haskellstack.org/ | sh
