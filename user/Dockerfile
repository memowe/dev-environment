FROM ubuntu:20.04

ENV HOME /home/memowe

# Prepare userland
RUN useradd -m -d $HOME memowe && \
    adduser memowe sudo
WORKDIR $HOME

# Copy dotfiles
COPY --chown=memowe:memowe dotfiles/ /home/memowe/
COPY --chown=memowe:memowe entrypoint.sh /home/memowe/entrypoint.sh
RUN chmod a+x $HOME/entrypoint.sh

# Go to userland
USER memowe

# "Autostart"
RUN $HOME/entrypoint.sh

CMD ["/bin/bash"]
