# Use official php image.
FROM php:7.0-cli

# Installing required dependencies of laravel project.
RUN apt-get update && apt-get install -y  \
        libfcgi0ldbl \
        zlib1g-dev \
        libxml2-dev \
        libmcrypt-dev \
        git \
    && docker-php-ext-install \
        zip \
        opcache \
        mbstring \
        pdo \
        pdo_mysql \
        mcrypt \
        mysqli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer \
    && composer global require "hirak/prestissimo:0.3.4"

# Timezone London to sync timestamps
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
