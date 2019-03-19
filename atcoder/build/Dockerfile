ARG RESOLVER
FROM stack:${RESOLVER}
ARG RESOLVER
WORKDIR /root

RUN : install emacs / some packages && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EAAFC9CD && \
    echo 'deb http://ppa.launchpad.net/kelleyk/emacs/ubuntu xenial main' > /etc/apt/sources.list.d/ubuntu-emacs26-xenial.list && \
    apt update && \
    apt install -y emacs26 git nkf unzip zip && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    : ===========================end===========================

RUN : put dotfiles && \
    git clone https://github.com/chupaaaaaaan/dotfiles.git && \
    chmod +x ./dotfiles/deploy.sh && ./dotfiles/deploy.sh && \
    mkdir /root/.bashrc.d && \
    echo "alias stack='stack --resolver=${RESOLVER}'" >> /root/.bashrc.d/stack && \
    echo 'eval "$(stack --bash-completion-script stack)"' >> /root/.bashrc.d/stack && \
    : ===========================end===========================

RUN : install ghc-mod && \
    stack install ghc-mod && \
    : ===========================end===========================

RUN stack exec -- emacs --daemon

ENTRYPOINT ["tail", "-f", "/dev/null"]
