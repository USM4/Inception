#!/bin/bash

service mysql start

#for connection to the socket it takes time (heavy load, establishing connection)
sleep 2

MYSQL_USER="oredoine"
MYSQL_PASSWORD="xyz"
DB_NAME="Maria"
DB_USER="MariaDB"
DB_PASSWORD="mariamaria"
MYSQL_ROOT_PWD="abc"

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

service mysql stop
echo "Database configuration completed."