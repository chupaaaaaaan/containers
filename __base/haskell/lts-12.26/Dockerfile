FROM stack:base

# Haskell stack settings
RUN stack --resolver=lts-12.26 setup && \
    echo "alias stack='stack --resolver=lts-12.26'" >> /root/.bashrc
