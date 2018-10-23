FROM ubuntu:18.04

ENV NAME memowe
ENV HOME /home/$NAME

# Go to userland
RUN useradd -m -d $HOME $NAME && \
    mkdir -p $HOME && \
    chown -R $NAME:$NAME $HOME
WORKDIR $HOME
USER $NAME

# Install vim configuration environment
RUN git clone --recurse-submodules https://github.com/memowe/vim-conf.git .vim
RUN cd .vim/bundle/command-t/ruby/command-t/ext/command-t && \
    ruby extconf.rb && \
    make

# Install tmux configuration
COPY tmux.conf .tmux.conf

# Done
CMD ["/bin/bash"]
