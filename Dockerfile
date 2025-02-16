FROM serversideup/php:8.4-fpm-nginx

USER root

RUN install-php-extensions intl excimer exif bcmath gd redis memcached zip pdo_mysql bz2 pcntl mbstring sockets pgsql pdo_pgsql

USER www-data