FROM debian:bullseye

RUN apt-get update

RUN apt install curl -y

RUN apt-get -y install wget

RUN apt-get install -y php php-fpm php-mysql mariadb-client

#PHP7.3.31

COPY tools/wordpress.sh .

RUN chmod +x wordpress.sh

CMD ["./wordpress.sh"]
