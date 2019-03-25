FROM ubuntu:18.10

# Install useful packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        locales \
        sudo \
        wget \
        curl \
        lynx \
        build-essential \
        socat \
        docker.io \
        docker-compose \
        htop \
        tree \
        ruby-dev \
        vim-nox \
        tmux \
        git \
        tig

# Enable sudo for all users
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Disable Ctrl-S and Ctrl-Q (pauses terminal for ancient reasons)
RUN echo -e "stty stop ''\nstty start ''\nstty -ixon\nstty -ixoff" >> /etc/bash.bashrc

# Expose web development port
EXPOSE 3000

# Done
CMD ["/bin/bash"]
