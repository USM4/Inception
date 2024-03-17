FROM debian:buster

RUN apt-get update

RUN apt-get upgrade

RUN apt-get install wget -y

#PHP7.3.31
RUN apt-get install -y php php-fpm php-mysql mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xvf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN chown -R root:root wordpress/



 