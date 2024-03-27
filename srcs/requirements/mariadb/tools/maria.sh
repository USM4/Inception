#!/bin/bash

service mariadb start

# Wait for the database service to be ready
sleep 10

# Create the database if it doesn't exist
mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Check if the user already exists
user_exist=$(mysql -e "SELECT user FROM mysql.user WHERE user='$DB_USER';")

# If the user doesn't exist, create it
if [ -z "$user_exist" ]; then
    echo "Creating MySQL user '$DB_USER'..."
    mysql -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
fi

# Grant privileges to the user
echo "Granting privileges to MySQL user '$DB_USER'..."
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "FLUSH PRIVILEGES;"

# Shutdown the MySQL service
mysqladmin -u root -p$MYSQL_ROOT_PWD shutdown

# Start MySQL in safe mode
exec mysqld_safe

echo "Database configuration completed."
