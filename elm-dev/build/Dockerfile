FROM ubuntu:xenial-20180808
WORKDIR /root

# install packages
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
      curl \
      git \
      nkf \
      software-properties-common \
      unzip \
      zip

# node settings / elm settings
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
ENV NVM_DIR "/root/.nvm"
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    nvm install v8.11.4 && \
    nvm alias default v8.11.4 && \
    npm config set -g user root && \
    npm install -g http-server \
                   elm \
                   elm-format \
                   elm-oracle \
                   elm-package \
                   elm-make \
                   elm-repl \
                   elm-test

# install emacs
RUN add-apt-repository -y ppa:kelleyk/emacs && \
    apt update && \
    apt install -y emacs26

# put dotfiles
RUN git clone https://github.com/chupaaaaaaan/dotfiles.git && \
    chmod +x ./dotfiles/deploy.sh && ./dotfiles/deploy.sh

RUN emacs --daemon

ENTRYPOINT ["tail","-f","/dev/null"]
