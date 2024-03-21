FROM debian:bullseye

RUN apt-get update

RUN apt-get -y install wget

#set fpm listening config

#PHP7.3.31
RUN apt-get install -y php php-fpm php-mysql mariadb-client

COPY conf/auto_config.sh .

CMD ["./auto_config.sh"]
