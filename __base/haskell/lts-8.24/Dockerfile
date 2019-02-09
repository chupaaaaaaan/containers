FROM stack:base

# Haskell stack settings
RUN stack --resolver=lts-8.24 setup && \
    echo "alias stack='stack --resolver=lts-8.24'" >> /root/.bashrc
