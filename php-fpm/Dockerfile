## Base Image

FROM php:7.2-fpm

## Configure as a production environment

RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini

## Add iconv and gd PHP extensions

RUN apt-get update && \
    apt-get install -y \
		  libfreetype6-dev \
		  libjpeg62-turbo-dev \
		  libpng-dev && \
	docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) iconv && \
	docker-php-ext-install -j$(nproc) gd

## Add database driver PHP extensions

RUN docker-php-ext-install pdo_mysql

## ADD zip PHP extensions

RUN apt-get install -y zlib1g-dev \
    && docker-php-ext-install zip
