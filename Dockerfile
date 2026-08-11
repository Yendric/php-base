FROM serversideup/php:8.4-fpm-nginx

USER root

RUN install-php-extensions intl excimer exif bcmath gd redis memcached zip pdo_mysql bz2 pcntl mbstring sockets pgsql pdo_pgsql

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

USER www-data