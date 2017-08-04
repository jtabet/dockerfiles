FROM php:7.1-fpm
MAINTAINER Jérémie Tabet <dev@jeremie.tabet.rocks>

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++ libssl-dev

RUN docker-php-ext-install \
        intl \
        mbstring \
        pdo_mysql \
        zip \
        bcmath

# Install mongo
RUN pecl install mongodb \
&& echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/ext-mongodb.ini

