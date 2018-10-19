FROM ubuntu:18.04

# https://github.com/memowe/dev-environment
LABEL maintainer="Mirko Westermeier <mirko@westermeier.de>"

# Install useful packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        vim-nox \
        git

# Install vim configuration environment
RUN git clone --recurse-submodules https://github.com/memowe/vim-conf.git .vim

# START
CMD ["/bin/bash"]
