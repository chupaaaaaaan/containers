FROM stack:base

# Haskell stack settings
RUN stack --resolver=lts-9.21 setup && \
    echo "alias stack='stack --resolver=lts-9.21'" >> /root/.bashrc
