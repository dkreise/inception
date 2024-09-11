#!/bin/bash

# Ensure the socket directory exists
mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

# Initialize the database if not already done
if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    echo "Initializing the database..."
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

# Start the MariaDB server in the background
echo "Starting MariaDB..."
mysqld_safe --datadir='/var/lib/mysql' &

# Wait for MariaDB to start
sleep 5

# Check if the database already exists, and create if necessary
if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then
    echo "Setting up the database and users..."
    mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    mysql -u root -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -u root -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;"
    mysql -u root -e "FLUSH PRIVILEGES;"
fi

# Shutdown the background MariaDB server to restart in the foreground
mysqladmin -u root shutdown

# Start MariaDB in the foreground to keep the container running
exec mysqld --user=mysql --console

