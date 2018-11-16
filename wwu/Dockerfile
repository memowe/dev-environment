FROM ubuntu:18.10

# Copy WWU specific fonts and CI images
COPY Corporate_Identity /usr/share/wwu/ci

# Copy and install WWU specific Brief
COPY Brief/liesmich.txt /usr/share/wwu/brief-liesmich.txt
COPY Brief/texmf/ /usr/share/texmf/
RUN texhash \
    && mktexlsr \
    && updmap-sys --enable Map meta.map

# Prepare user specific WWU Brief templates
COPY Templates/ /usr/share/templates/

# Prepare wwubrief convenience script
COPY Scripts/wwubrief.sh /usr/local/bin/wwubrief
