.PHONY: build-base build-perl build-docs build-user build
.PHONY: all test-perl test-docs test run
.DEFAULT_GOAL := all

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

build-docs: previous_part = "perl"
build-docs: part = "docs"
build-docs: build-perl
	$(docker_build_with_from_being_previous)

build-user: previous_part = "docs"
build-user: part = "user"
build-user: build-docs
	$(docker_build_with_from_being_previous)

build: build-user
	docker tag memowe-user memowe

all: build

test-perl: build-perl
	docker run -v "$$(pwd)/perl/test.sh:/home/memowe/perl-test.sh" memowe-perl /bin/bash /home/memowe/perl-test.sh

test-docs: build-docs build-perl
	docker run -v "$$(pwd)/docs/test.sh:/home/memowe/docs-test.sh" memowe-docs /bin/bash /home/memowe/docs-test.sh

test: test-perl test-docs

run: build
	eval "$(run_command) memowe"

detached: build
	eval "$(run_command) -d memowe"
