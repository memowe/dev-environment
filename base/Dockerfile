FROM ubuntu:18.04

# Install useful packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        wget \
        build-essential \
        docker.io \
        docker-compose \
        ruby-dev \
        vim-nox \
        tmux \
        git

# Expose web development port
EXPOSE 3000

# Done
CMD ["/bin/bash"]
