FROM bitnami/php-fpm:latest

COPY ./src/ /app

COPY ./vhosts/php.ini /opt/bitnami/php/etc/php.ini
COPY ./vhosts/php-fpm-www.conf /opt/bitnami/php/etc/php-fpm.d/www.conf

EXPOSE 9000

WORKDIR /app

RUN [ "/opt/bitnami/php/bin/composer",  "install" ]

CMD [ "php-fpm", "-F", "--pid", "/opt/bitnami/php/tmp/php-fpm.pid", "-y", "/opt/bitnami/php/etc/php-fpm.conf" ]
