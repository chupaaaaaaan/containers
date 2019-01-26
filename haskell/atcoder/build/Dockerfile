FROM stack:lts-6.35
WORKDIR /root

# install packages
RUN apt-get -y install \
  emacs24-nox \
  git \
  nkf \
  unzip \
  zip

# put dotfiles
RUN git clone https://github.com/chupaaaaaaan/dotfiles.git && \
    chmod +x ./dotfiles/deploy.sh && ./dotfiles/deploy.sh

# Haskell stack settings
RUN echo "alias stack='stack --resolver=lts-6.35'" >> /root/.bashrc && \
    stack install ghc-mod

RUN emacs --daemon

ENTRYPOINT ["/bin/bash"]
