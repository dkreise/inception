FROM debian:12.6

RUN apt-get update && apt-get -y install \
	curl \
	php8.2-fpm \
	php8.2-mysqli

# Install WordPress CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Download and install WordPress
RUN wp core download --allow-root

# Set permissions for WordPress files

COPY www.conf /etc/php/8.2/fpm/pool.d/

COPY script.sh .

RUN chmod +x script.sh

# Expose port 9000 for PHP-FPM
EXPOSE 9000

# Start PHP-FPM (using the correct executable)
CMD ["./script.sh"]

# Alternative CMD if the above does not work:
# CMD ["php-fpm", "-F"]
