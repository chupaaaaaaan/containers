FROM stack:lts-9.21
WORKDIR /root

# install packages
RUN apt -y install \
  git \
  nkf \
  software-properties-common \
  unzip \
  zip

# install emacs
RUN add-apt-repository -y ppa:kelleyk/emacs && \
    apt update && \
    apt install -y emacs26

# put dotfiles
RUN git clone https://github.com/chupaaaaaaan/dotfiles.git && \
    chmod +x ./dotfiles/deploy.sh && ./dotfiles/deploy.sh

# Haskell stack settings
RUN echo "extra-deps:"       >> .stack/global-project/stack.yaml && \
    echo "- ghc-mod-5.8.0.0" >> .stack/global-project/stack.yaml && \
    stack install ghc-mod

RUN emacs --daemon

ENTRYPOINT ["tail", "-f", "/dev/null"]
