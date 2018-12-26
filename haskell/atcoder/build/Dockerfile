FROM            ubuntu:xenial-20180808
MAINTAINER      Takayuki Uchida
ENV             container docker
RUN             apt-get update && apt-get -y upgrade && apt-get -y install \
  git   \
  nkf   \
  curl  \
  zip   \
  unzip \
  emacs24-nox
WORKDIR         /root
RUN             git clone https://github.com/chupaaaaaaan/dotfiles.git
WORKDIR         /root/dotfiles
RUN             chmod +x deploy.sh && ./deploy.sh
WORKDIR         /root
RUN             curl -sSL https://get.haskellstack.org/ | sh
RUN             stack --resolver=lts-6.35 setup && stack --resolver=lts-6.35 install ghc-mod
RUN             echo "alias stack='stack --resolver=lts-6.35'" >> .bashrc
RUN             emacs --daemon
ENTRYPOINT      ["/bin/bash"]
