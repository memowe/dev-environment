FROM ubuntu:18.10

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
    d3 \
    elm

# START
CMD ["/bin/bash"]
