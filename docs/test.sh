#!/bin/sh

# Check generated content with Mojolicious
GENERATED_HTML=`echo "# foo" | pandoc -t html | perl -Mojo -nle 'say x($_)->at("h1")->text'`
if [ $GENERATED_HTML == 'foo' ]; then
    exit 0
else
    exit 1
fi
