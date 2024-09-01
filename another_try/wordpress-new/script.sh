#!/bin/bash

if [ -f ./wp-config.php ]
then
	echo "Wordpress aalready exists"
else
	echo "helloooooooo"
	wp core download --allow-root
	wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
	wp core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --skip-email --allow-root
fi

/usr/sbin/php-fpm7.4 -F;
