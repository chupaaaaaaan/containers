FROM stack:base

# Haskell stack settings
RUN stack --resolver=lts-13.5 setup && \
    echo "alias stack='stack --resolver=lts-13.5'" >> /root/.bashrc
