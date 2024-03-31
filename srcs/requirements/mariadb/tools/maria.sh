#!/bin/bash

service mariadb start

sleep 10

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';"
mysql -u root -p"$DB_ROOT_PWD" -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mysql -u root -p"$DB_ROOT_PWD" -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -p"$DB_ROOT_PWD" -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -p"$DB_ROOT_PWD" -e "FLUSH PRIVILEGES;"

# echo "MySQL root password: $DB_ROOT_PWD"

mysqladmin -u root -p"$DB_ROOT_PWD" shutdown
echo "Database configuration completed."
exec mysqld_safe