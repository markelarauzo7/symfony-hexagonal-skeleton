FROM php:8.0-fpm
WORKDIR /app

# Installed by default in the image
# [PHP Modules]
# Core
# ctype
# curl
# date
# dom
# fileinfo
# filter
# ftp
# hash
# iconv
# json
# libxml
# mbstring
# mysqlnd
# openssl
# pcre
# PDO
# pdo_sqlite
# Phar
# posix
# readline
# Reflection
# session
# SimpleXML
# sodium
# SPL
# sqlite3
# standard
# tokenizer
# xml
# xmlreader
# xmlwriter
# zlib


RUN apt update \
    && apt install -y wget git zip nano libicu-dev \
    # For intl
    libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) \
        opcache \
        pdo_mysql \
        intl \
    && docker-php-ext-enable \
        opcache

RUN wget https://get.symfony.com/cli/installer -O - | bash && \
  mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY etc/php/ /usr/local/etc/php/
