FROM ubuntu:xenial-20180808
ARG RESOLVER
ARG GHC_VERSION
WORKDIR /root

# install packages
RUN apt update && \
    apt -y install curl

# Haskell stack install & config
ENV PATH "/root/.local/bin:${PATH}"
RUN curl -sSL https://get.haskellstack.org/ | sh && \
    stack config set system-ghc --global true && \
    stack config set install-ghc --global false && \
    stack --resolver="${RESOLVER}" setup && \

ENV GHC_VERSION "${GHC_VERSION}"
