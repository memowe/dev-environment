FROM ubuntu:18.10

# Install useful packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        locales \
        wget \
        lynx \
        build-essential \
        socat \
        docker.io \
        docker-compose \
        ruby-dev \
        vim-nox \
        tmux \
        git

# Set locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Expose web development port
EXPOSE 3000

# Done
CMD ["/bin/bash"]
