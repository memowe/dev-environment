FROM ubuntu:20.04

# Install useful packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        texlive \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-lang-german \
        texlive-humanities \
        ghostscript

# Install a new pandoc package (Ubuntu 18.10's is rather old)
COPY pandoc.deb /tmp/pandoc.deb
RUN dpkg -i /tmp/pandoc.deb

# Done
CMD ["/bin/bash"]
