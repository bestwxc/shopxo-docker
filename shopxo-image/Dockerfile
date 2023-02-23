ARG PHP_VER=8.1.16-fpm-bullseye

FROM php:$PHP_VER

RUN apt update  \
    && apt upgrade -y  \
    && apt install -y git libzip-dev libpng-dev \
    && docker-php-ext-install mysqli pdo_mysql zip gd \
    && rm -rf /var/lib/apt/*

ARG SHOPXO_VER=2.3.2
ARG SHOPXO_DIR=/var/www/shopxo

VOLUME $SHOPXO_DIR

RUN git clone --depth=1 --single-branch https://github.com/gongfuxiang/shopxo.git -b v$SHOPXO_VER $SHOPXO_DIR \
    && chown -R www-data:www-data $SHOPXO_DIR


