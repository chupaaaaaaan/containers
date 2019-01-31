FROM stack:base

# Haskell stack settings
RUN stack --resolver=lts-6.35 setup && \
    echo "alias stack='stack --resolver=lts-6.35'" >> /root/.bashrc
