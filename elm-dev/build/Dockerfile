FROM ubuntu:xenial-20180808
WORKDIR /root

RUN : install emacs / some packages / set timezone && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EAAFC9CD && \
    echo 'deb http://ppa.launchpad.net/kelleyk/emacs/ubuntu xenial main' > /etc/apt/sources.list.d/ubuntu-emacs26-xenial.list && \
    apt update && \
    apt -y install emacs26 curl git nkf tzdata unzip zip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    : ===========================end===========================

RUN : put dotfiles && \
    git clone https://github.com/chupaaaaaaan/dotfiles.git && \
    chmod +x ./dotfiles/deploy.sh && ./dotfiles/deploy.sh && \
    : ===========================end===========================

ENV NVM_DIR "/root/.nvm"

RUN : install node / install elm && \
    mkdir -p "$NVM_DIR" && \
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    nvm install stable && \
    nvm alias default stable && \
    npm config set -g user root && \
    npm install -g http-server elm elm-format elm-oracle elm-test && \
    : ===========================end===========================

RUN emacs --daemon

ENTRYPOINT ["tail","-f","/dev/null"]
