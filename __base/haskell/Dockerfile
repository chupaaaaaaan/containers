FROM ubuntu:xenial-20180808
ARG RESOLVER
ARG GHC_VERSION
WORKDIR /root

# install packages
RUN apt update && \
    apt -y install curl

# Haskell stack settings
ENV PATH "$HOME/.local/bin:${PATH}"
RUN curl -sSL https://get.haskellstack.org/ | sh

# Haskell stack settings
RUN stack --resolver="${RESOLVER}" setup && \
    echo "alias stack='stack --resolver=${RESOLVER}'" >> /root/.bashrc

ENV GHC_VERSION "${GHC_VERSION}"
