#!/bin/bash

service mysql start
MYSQL_USER="oredoine"
MYSQL_PASSWORD="xyz"

DB_NAME="Maria"
DB_USER="MariaDB"
DB_PASSWORD="mariamaria"
MYSQL_ROOT_PWD="123"


mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
# Create a new user and grant privileges
mysql -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFY BY '$MYSQL_ROOT_PWD'"
mysql -e "FLUSH PRIVILEGES;"

echo "Database configuration completed."