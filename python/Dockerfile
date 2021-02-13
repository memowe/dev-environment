FROM ubuntu:18.10

# Install python basics
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        python \
        python3 \
        python-dev \
        python3-dev \
        python-pip \
        python3-pip \
        python-virtualenv \
        python3-venv

# START
CMD ["/bin/bash"]
