FROM ubuntu:20.04

# Install python basics
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-dev \
        python3-pip \
        python3-venv

# START
CMD ["/bin/bash"]
