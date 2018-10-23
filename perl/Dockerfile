FROM perl:5.28.0


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
    Mojolicious::Plugin::Subdispatch

# Install important other perl modules
RUN cpanm -qn \
    Clone \
    Config::Any \
    Module::Starter

# Install some of my own perl modules
RUN cpanm -qn \
    Contenticious \
    EventStore::Tiny

# START
CMD ["/bin/bash"]
