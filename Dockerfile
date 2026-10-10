# syntax=docker/dockerfile:1

FROM serversideup/php:8.4-fpm-nginx

USER root

RUN install-php-extensions intl excimer exif bcmath gd imagick redis memcached zip pdo_mysql bz2 pcntl mbstring sockets pgsql pdo_pgsql

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# serversideup's performance.conf caches other image formats but misses avif.
COPY <<'EOF' /etc/nginx/server-opts.d/avif.conf
location ~* \.avif$ {
    add_header Cache-Control "public, max-age=31536000, immutable";
    access_log off;
    log_not_found off;
    try_files $uri /index.php?$query_string;
}
EOF

USER www-data