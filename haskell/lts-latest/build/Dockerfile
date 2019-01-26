FROM stack:base
WORKDIR /root

# install packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
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
RUN stack setup && stack install ghc-mod

RUN emacs --daemon

ENTRYPOINT ["/bin/bash"]
