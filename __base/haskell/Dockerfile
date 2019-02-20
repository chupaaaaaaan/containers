FROM ubuntu:xenial-20180808
ARG RESOLVER="lts-6.35"
ARG GHC_VERSION="7.10.3"
WORKDIR /root

# install packages
RUN apt update && \
    apt -y install curl

# Haskell stack settings
RUN curl -sSL https://get.haskellstack.org/ | sh

# Haskell stack settings
RUN stack --resolver="${RESOLVER}" setup && \
    echo "alias stack='stack --resolver=${RESOLVER}'" >> /root/.bashrc

ENV GHC_VERSION "${GHC_VERSION}"
