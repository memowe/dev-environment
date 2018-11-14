FROM ubuntu:18.10

# Copy WWU specific fonts and CI images
COPY Corporate_Identity /usr/share/wwu/ci

# Copy and install WWU specific Brief
COPY Brief/liesmich.txt /usr/share/wwu/brief-liesmich.txt
COPY Brief/texmf/ /usr/share/texmf/
RUN texhash \
    && mktexlsr \
    && updmap-sys --enable Map meta.map
