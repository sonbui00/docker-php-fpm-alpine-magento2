# Versions 3.8 and 3.7 are current stable supported versions.
FROM alpine:3.7

# trust this project public key to trust the packages.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

## you may join the multiple run lines here to make it a single layer

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# add the repository, make sure you replace the correct versions if you want.
RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.1" >> /etc/apk/repositories

# install php and some extensions
# notice the @php is required to avoid getting default php packages from alpine instead.
RUN apk add --update php@php
RUN apk add --update php-fpm@php
RUN apk add --update php-mbstring@php
RUN apk add --update php-bcmath@php
RUN apk add --update php-ctype@php
RUN apk add --update php-curl@php
RUN apk add --update php-dom@php
RUN apk add --update php-gd@php
RUN apk add --update php-intl@php
RUN apk add --update php-mcrypt@php
RUN apk add --update php-openssl@php
RUN apk add --update php-pdo_mysql@php
RUN apk add --update php-xml@php
RUN apk add --update php-zip@php
RUN apk add --update php-json@php
RUN apk add --update php-iconv@php
RUN apk add --update php-xdebug@php
RUN apk add --update php-xsl@php
RUN apk add --update php-phar@php
RUN apk add --update php-soap@php
RUN apk add --update php7-session@php

RUN sed -i -e 's/127.0.0.1:9000/9000/g' /etc/php7/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm7", "-F"]