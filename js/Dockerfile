FROM ubuntu:20.04

# Install node basics
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        nodejs \
        npm

# Install js frameworks
RUN npm install --global --unsafe-perm=true --allow-root --loglevel verbose \
    jquery \
    vue \
    leaflet \
    d3

# START
CMD ["/bin/bash"]
