FROM debian:bullseye

RUN apt-get update && apt-get -y install \
	curl \
	php7.4-fpm \
	php7.4-mysqli \
	mariadb-client

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php 
RUN chmod 755 /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/script.sh"]
