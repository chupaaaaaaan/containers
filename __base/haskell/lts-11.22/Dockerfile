FROM stack:base

# Haskell stack settings
RUN stack --resolver=lts-11.22 setup && \
    echo "alias stack='stack --resolver=lts-11.22'" >> /root/.bashrc
