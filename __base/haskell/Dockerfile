FROM ubuntu:xenial-20180808
ARG RESOLVER
ARG GHC_VERSION
WORKDIR /root

ENV PATH "/root/.local/bin:${PATH}"

RUN : Haskell stack install / configure && \
    apt update && apt -y install curl && \
    curl -sSL https://get.haskellstack.org/ | sh && \
    stack --resolver="${RESOLVER}" setup && \
    stack config set install-ghc --global false && \
    apt clean && rm -rf /var/lib/apt/lists/* && \
    : ===========================end===========================
