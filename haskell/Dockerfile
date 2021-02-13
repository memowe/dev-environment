FROM ubuntu:20.04

# Install haskell basics
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        ghc \
        cabal-install
RUN cabal new-update

# START
CMD ["/bin/bash"]
