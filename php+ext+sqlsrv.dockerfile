FROM php:7.1-fpm
MAINTAINER Jérémie Tabet <dev@jeremie.tabet.rocks>

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++ libssl-dev apt-transport-https gnupg

# Add Microsoft repo for Microsoft ODBC Driver 13 for Linux
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/debian/8/prod.list > /etc/apt/sources.list.d/mssql-release.list \
    && apt-get update

# Install Dependencies
RUN ACCEPT_EULA=Y apt-get install -y \
    unixodbc \
    unixodbc-dev \
    libgss3 \
    odbcinst \
    msodbcsql \
    locales \
    && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

RUN pecl install apcu-5.1.5 pdo_sqlsrv-4.3.0 sqlsrv-4.3.0 && \
    docker-php-ext-enable \
        apcu \
        sqlsrv \
        pdo_sqlsrv && \
    docker-php-ext-install \
        intl \
        mbstring \
        pdo_mysql \
        zip \
        bcmath \
        opcache

