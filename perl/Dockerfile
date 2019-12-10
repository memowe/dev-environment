FROM ubuntu:18.10

# Install perl basics
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y \
        git \
        build-essential \
        perl \
        cpanminus \
        zlib1g-dev # for Gzip::Faster

# Install data management perl modules
RUN cpanm -qn \
    DBD::SQLite \
    DBIx::Class \
    DBIx::Class::Schema::Loader

# Install data handling perl modules
RUN cpanm -qn \
    Data::Compare \
    Data::Dump \
    DateTime DateTime::Format::ISO8601 \
    File::Copy::Recursive \
    File::Share \
    Graph::Centrality::Pagerank \
    Gzip::Faster \
    Text::Markdown \
    UUID::Tiny

# Install QA perl modules
RUN cpanm -qn \
    Devel::Cover \
    Devel::NYTProf \
    Perl::Critic \
    Test::Exception \
    Test::Perl::Critic \
    Test::Pod \
    Test::Pod::Coverage \
    Perl::Tidy

# Install OO perl modules
RUN cpanm -qn \
    Class::Tiny \
    Mo \
    Moo

# Install web perl modules
RUN cpanm -qn \
    Mojolicious \
    Mojolicious::Plugin::AssetPack \
    Mojolicious::Plugin::RelativeUrlFor \
    Mojolicious::Plugin::Subdispatch \
    ojo::ServeDir

# Install important other perl modules
RUN cpanm -qn \
    Clone \
    Config::Any \
    Module::Starter

# Install some of my own perl modules
RUN cpanm -qn \
    Contenticious \
    EventStore::Tiny

# Install Dirdown (not on CPAN)
RUN git clone https://github.com/memowe/dirdown.git /tmp/dd && \
    cd /tmp/dd && cpanm -qn . && cd -

# START
CMD ["/bin/bash"]
