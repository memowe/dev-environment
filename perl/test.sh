#!/bin/sh

# Check super simple mojolicious web app
if [ $(perl -Mojo -E 'a("/" => {text => 42})->start' get /) = "42" ]; then
    exit 0
else
    exit 1
fi
