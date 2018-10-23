.PHONY: build-base build-perl build-user build test-perl test all run

build-base:
	docker build -t memowe-base base

# Use dockerfiles with their FROM line replaced by the previous image

build-perl: build-base
	cp perl/Dockerfile perl/Dockerfile.bak
	printf '%s\n%s\n' \
			"FROM memowe-base:latest" \
			"$$(tail --lines=+2 perl/Dockerfile.bak)" \
		> perl/Dockerfile
	docker build -t memowe-perl perl
	rm perl/Dockerfile
	mv perl/Dockerfile.bak perl/Dockerfile

build-user: build-perl
	cp user/Dockerfile user/Dockerfile.bak
	printf '%s\n%s\n' \
			"FROM memowe-perl:latest" \
			"$$(tail --lines=+2 user/Dockerfile)" \
		> user/Dockerfile
	docker build -t memowe user
	rm user/Dockerfile
	mv user/Dockerfile.bak user/Dockerfile

build: build-user

test-perl: build-perl
	docker run -v "$$(pwd)/perl/test.sh:/perl-test.sh" memowe-perl /bin/bash /perl-test.sh

test: test-perl

all: test

run: build
	docker run -ti memowe /bin/bash
