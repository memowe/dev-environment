.PHONY: build-base build-perl build-user build
.PHONY: test-perl test
.PHONY: run-base run-perl run-user run
.PHONY: all
.DEFAULT_GOAL := all

# Determine what to mount as the ~/outside volume
run_command = "docker run -ti"
ifdef MOUNT
	run_command += " -v $$MOUNT:$$HOME/outside"
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

build-user: previous_part = "perl"
build-user: part = "user"
build-user: build-perl
	$(docker_build_with_from_being_previous)

build: build-user
	docker tag memowe-user memowe

test-perl: build-perl
	docker run -v "$$(pwd)/perl/test.sh:/perl-test.sh" memowe-perl /bin/bash /perl-test.sh

test: test-perl

run-base: build-base
	eval "$(run_command) memowe-base"

run-perl: build-perl
	eval "$(run_command) memowe-perl"

run-user: build-user
	eval "$(run_command) memowe-user"

run: build
	eval "$(run_command) memowe"

all: MOUNT = $(HOME)
all: run
