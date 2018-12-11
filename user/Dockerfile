FROM ubuntu:18.10

ENV HOME /home/memowe

# Prepare userland
RUN useradd -m -d $HOME memowe && \
    mkdir -p $HOME && \
    chown -R memowe:memowe $HOME
WORKDIR $HOME

# Copy dotfiles
COPY --chown=memowe:memowe dotfiles/ /home/memowe/

# Go to userland
USER memowe
CMD ["/bin/bash"]
