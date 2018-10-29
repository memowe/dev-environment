Docker configurations for my development environment
====================================================

[![Travis CI tests](https://travis-ci.org/memowe/dev-environment.svg?branch=master)](https://travis-ci.org/memowe/dev-environment)

Cache/build docker images:

```bash
$ make
```

Run it (with data):

```bash
$ make run
$ MOUNT=$HOME make run
```

Run it, but don't attach:

```bash
$ MOUNT=$HOME make detached
```

Test it:

```bash
$ make test
```

Have a look at the [build targets](Makefile) for more information.

## Contents

- **[base](base/Dockerfile)**
    - Installation of important stuff like git/vim etc.

- **[perl](perl/Dockerfile)**
    - Perl environment with modules important for me

- **[docs](docs/Dockerfile)**
    - LaTeX/Pandoc for documents

- **[user](user/Dockerfile)**
    - `vim` etc. configuration

All this is orchestrated with a funky [Makefile](Makefile).

## Author and license

(c) 2018 [Mirko Westermeier](http://mirko.westermeier.de/)

Released under the [MIT License](LICENSE).

## Resources

- [Docker Docs: **Dockerfile reference**][df-reference]
- [Docker Docs: **Dockerfile best practices**][docker-bp]
- [Jakub Skałecki: **How to write excellent Dockerfiles**][skalecki]
- [Docker Docs: **Multistage builds**][multistage]
- [Docker Docs: **docker-compose**][compose]
- [Jannis Hermanns: **The iPad Pro as main computer for programming**][hermanns]
    - [his `Dockerfile`][hermanns-df]

[df-reference]: https://docs.docker.com/engine/reference/builder/
[docker-bp]: https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
[skalecki]: https://rock-it.pl/how-to-write-excellent-dockerfiles/
[multistage]: https://docs.docker.com/develop/develop-images/multistage-build/
[compose]: https://docs.docker.com/compose/
[hermanns]: https://jann.is/ipad-pro-for-programming/
[hermanns-df]: https://github.com/jayniz/zsh-tmux-neovim-docker/blob/master/Dockerfile
