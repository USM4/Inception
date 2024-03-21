#!/bin/bash

sleep 10

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir /run/php

cd /var/www/html
wp core download --allow-root

mv wp-config-sample.php wp-config.php

DB_NAME = 
MARIA_DB_USER = 
MARIA_DB_USER_PASSWORD =
DOMAIN_NAME =  
WP_ADMIN_USER = 
WP_ADMIN_PASSWORD = 
WP_ADMIN_EMAIL = 
WP_USER = 
WP_USER_EMAIL = 
WP_USER_PASSWORD = 
wp config set SERVER_PORT 3306 --allow-root
wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html
wp config set DB_USER $MARIA_DB_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $MARIA_DB_USER_PASSWORD --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/html

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html

/usr/sbin/php-fpm7.4 -F