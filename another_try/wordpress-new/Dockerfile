FROM debian:bullseye

RUN apt-get update && apt-get -y install \
	curl \
	php7.4-fpm \
	php7.4-mysqli \
	mariadb-client

# Install WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Download and install WordPress
#RUN wp core download --allow-root

# Create the /run/php directory and set appropriate permissions
RUN mkdir -p /run/php && chmod 755 /run/php

COPY www.conf /etc/php/7.4/fpm/pool.d/
COPY script.sh /usr/local/bin/script.sh

RUN chmod +x /usr/local/bin/script.sh

# Expose port 9000 for PHP-FPM
EXPOSE 9000

WORKDIR /var/www/html

ENTRYPOINT ["/usr/local/bin/script.sh"]

# Alternative CMD if the above does not work:
#CMD ["php-fpm7.4", "-F"]
