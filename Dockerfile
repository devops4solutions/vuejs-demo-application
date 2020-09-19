ARG PHP_VERSION=latest
FROM bitnami/php-fpm:$PHP_VERSION as app-build

RUN [ "mkdir", "-p", "/build" ]

WORKDIR /build

COPY .env .

RUN [ "/opt/bitnami/php/bin/composer",  "install" ]

FROM bitnami/php-fpm:$PHP_VERSION

WORKDIR /app

COPY --from=app-build /build/public .

EXPOSE 9000

RUN [ "chown", "-R", "www-data:www-data", "/app" ]

CMD [ "php-fpm", "-F", "--pid", "/opt/bitnami/php/tmp/php-fpm.pid", "-y", "/opt/bitnami/php/etc/php-fpm.conf" ]

