FROM ubuntu:18.10

# Install python basics
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        python \
        python3 \
        python-django \
        python3-django \
        python-flask \
        python3-flask

# START
CMD ["/bin/bash"]
