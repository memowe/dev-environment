.PHONY: init
.PHONY: build-base build-perl build-python build-js build-haskell build-docs build-wwu build-user build
.PHONY: all test-perl test-docs test-wwu test run
.DEFAULT_GOAL := all

init:
	git submodule update --init --recursive
	wget -O docs/pandoc.deb https://github.com/jgm/pandoc/releases/download/2.5/pandoc-2.5-1-amd64.deb

# Default run command including
# - web development port forwarding
# - SSH keys
run_command = "docker run -ti -p 3000:3000 -v $$HOME/.ssh:/home/memowe/.ssh"

# Determine what to mount as the ~/outside volume
ifdef MOUNT
	run_command += " -v $$MOUNT:/home/memowe/outside"
endif

# Use dockerfiles with their FROM line replaced by the previous image
define docker_build_with_from_being_previous
	cp $(part)/Dockerfile $(part)/Dockerfile.bak
	printf '%s\n%s\n' \
			"FROM memowe-$(previous_part):latest" \
			"$$(tail --lines=+2 $(part)/Dockerfile.bak)" \
		> $(part)/Dockerfile
	docker build -t memowe-$(part) $(part)
	rm $(part)/Dockerfile
	mv $(part)/Dockerfile.bak $(part)/Dockerfile
endef

build-base:
	docker build -t memowe-base base

build-perl: previous_part = "base"
build-perl: part = "perl"
build-perl: build-base
	$(docker_build_with_from_being_previous)

build-python: previous_part = "perl"
build-python: part = "python"
build-python: build-perl
	$(docker_build_with_from_being_previous)

build-js: previous_part = "python"
build-js: part = "js"
build-js: build-python
	$(docker_build_with_from_being_previous)

build-haskell: previous_part = "js"
build-haskell: part = "haskell"
build-haskell: build-js
	$(docker_build_with_from_being_previous)

build-docs: previous_part = "haskell"
build-docs: part = "docs"
build-docs: build-haskell
	$(docker_build_with_from_being_previous)

build-wwu: previous_part = "docs"
build-wwu: part = "wwu"
build-wwu: build-docs
	$(docker_build_with_from_being_previous)

build-user: previous_part = "wwu"
build-user: part = "user"
build-user: build-wwu
	$(docker_build_with_from_being_previous)

build: build-user
	docker tag memowe-user memowe

all: build

test-perl: build-perl
	docker run -v "$$(pwd)/perl/test.sh:/tmp/perl-test.sh" memowe-perl /bin/bash /tmp/perl-test.sh

test-docs: build-docs build-perl
	docker run -v "$$(pwd)/docs/test.sh:/tmp/docs-test.sh" memowe-docs /bin/bash /tmp/docs-test.sh

test-wwu: build-wwu
	docker run -v "$$(pwd)/wwu/test.sh:/tmp/wwu-test.sh" memowe-wwu /bin/bash /tmp/wwu-test.sh

test: test-perl test-docs test-wwu

run: build
	eval "$(run_command) memowe"

detached: build
	eval "$(run_command) -d memowe"
