FROM ubuntu:18.10

ENV HOME /home/memowe

# Prepare userland
RUN useradd -m -d $HOME memowe && \
    mkdir -p $HOME && \
    chown -R memowe:memowe $HOME
WORKDIR $HOME

# Install vim configuration environment
RUN git clone --recurse-submodules https://github.com/memowe/vim-conf.git .vim
RUN cd .vim/bundle/command-t/ruby/command-t/ext/command-t && \
    ruby extconf.rb && \
    make
RUN chown -R memowe:memowe .vim

# Install tmux configuration
COPY --chown=memowe:memowe tmux.conf .tmux.conf

# Install git configuration
COPY --chown=memowe:memowe gitconfig .gitconfig

# Install tig git gui configuration
COPY --chown=memowe:memowe tigrc .tigrc

# git autocomplete
COPY --chown=memowe:memowe git-completion.bash .git-completion.bash
COPY --chown=memowe:memowe git-completion_bashrc .bashrc

# Go to userland
USER memowe
CMD ["/bin/bash"]
