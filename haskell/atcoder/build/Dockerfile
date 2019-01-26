FROM ubuntu:xenial-20180808
ENV container docker
WORKDIR /root

# install packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
            curl \
            emacs24-nox \
            git \
            nkf \
            unzip \
            zip

# put dotfiles
RUN git clone https://github.com/chupaaaaaaan/dotfiles.git && \
    chmod +x ./dotfiles/deploy.sh && \
    ./dotfiles/deploy.sh

# Haskell stack settings
RUN curl -sSL https://get.haskellstack.org/ | sh && \
    echo "alias stack='stack --resolver=lts-6.35'" >> /root/.bashrc && \
    . /root/.bashrc && \
    stack setup && stack install ghc-mod

RUN emacs --daemon

ENTRYPOINT ["/bin/bash"]
