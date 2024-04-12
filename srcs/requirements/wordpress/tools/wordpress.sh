#!/bin/bash

sleep 20

curl -o wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

sed -i 's|^listen =.*|listen = wordpress:9000|' /etc/php/7.4/fpm/pool.d/www.conf

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /run/php

mkdir -p var/www/html
cd var/www/html
wp core download --allow-root
mv wp-config-sample.php wp-config.php

wp config set SERVER_PORT 3306 --allow-root
wp config set DB_NAME $DB_NAME --allow-root --path=/var/www/html
wp config set DB_USER $DB_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $DB_PASSWORD --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

wp core install --allow-root --url=${DOMAIN_NAME} --title="inception" --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL} --skip-email --path='/var/www/html'
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html

/usr/sbin/php-fpm7.4 -F

# sleep infinity