FROM ubuntu:18.04

# Install useful packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        pandoc \
        texlive \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-lang-german \
        texlive-humanities

# Done
CMD ["/bin/bash"]
