#!/bin/bash
#service mysql start

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ];
then
	echo "Initializing the database.."
	mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

echo "Starting mariadb.."
mysqld_safe --datadir='/var/lib/mysql' &
sleep 5

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ];
then
	mysql -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE $MYSQL_DATABASE;"
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
	mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u ${MYSQL_ROOT_USER} --password=${MYSQL_ROOT_PASSWORD} shutdown

exec mysqld --user=mysql --console
