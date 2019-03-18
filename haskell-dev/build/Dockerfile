ARG RESOLVER
FROM stack:${RESOLVER}
ARG RESOLVER
WORKDIR /root

RUN : install emacs / some packages && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv EAAFC9CD && \
    echo 'deb http://ppa.launchpad.net/kelleyk/emacs/ubuntu xenial main' > /etc/apt/sources.list.d/ubuntu-emacs26-xenial.list && \
    apt update && \
    apt install -y emacs26 git nkf unzip zip libicu-dev libtinfo-dev libgmp-dev && \
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

RUN : install Haskell IDE Engine && \
    git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules && \
    sed -i -e "/^resolver:/cresolver: ${RESOLVER}" /root/haskell-ide-engine/stack.yaml && \
    make -C /root/haskell-ide-engine hie-$($(stack path --compiler-exe) --numeric-version) && \
    make -C /root/haskell-ide-engine build-doc-$($(stack path --compiler-exe) --numeric-version) && \
    rm -rf haskell-ide-engine && \
    : ===========================end===========================

RUN emacs --daemon && emacsclient -e "(kill-emacs)"

ENTRYPOINT ["tail", "-f", "/dev/null"]
