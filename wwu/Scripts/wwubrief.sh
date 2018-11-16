#!/bin/bash

# Check first parameter
case "$1" in
    init) # Initialize Brief
        cp /usr/share/templates/wwubrief.md $(pwd)/wwubrief.md
        echo "wwubrief.md created. Use 'wwubrief compile' to generate a PDF"
        ;;
    compile) # Compile PDF
        pandoc --template=/usr/share/templates/wwubrief.pandoc.tex wwubrief.md -o wwubrief.pdf
        echo "wwubrief.pdf compiled."
        ;;
    *)
        echo "Usage: wwubrief {init|compile}"
        exit 1
esac
