#!/bin/sh

# Prepare temporary contenticious app
cd $(mktemp -d)
contenticious init

# Check default headline text
if [ $(./webapp.pl get / h1 text) = "Welcome!" ]; then
    exit 0
else
    exit 1
fi
