FROM ubuntu:18.04

ENV NAME memowe
ENV HOME /home/$NAME

# Prepare userland
RUN useradd -m -d $HOME $NAME && \
    mkdir -p $HOME && \
    chown -R $NAME:$NAME $HOME
WORKDIR $HOME

# Install vim configuration environment
RUN git clone --recurse-submodules https://github.com/memowe/vim-conf.git .vim
RUN cd .vim/bundle/command-t/ruby/command-t/ext/command-t && \
    ruby extconf.rb && \
    make
RUN chown -R $NAME:$NAME .vim

# Install tmux configuration
COPY tmux.conf .tmux.conf
RUN chown $NAME:$NAME .tmux.conf

# Install git configuration
COPY gitconfig .gitconfig
RUN chown $NAME:$NAME .gitconfig

# git autocomplete
COPY git-completion.bash .git-completion.bash
COPY git-completion_bashrc .bashrc
RUN chown $NAME:$NAME .git-completion.bash .bashrc

# Go to userland
USER $NAME
CMD ["/bin/bash"]
