FROM debian:buster

RUN apt update -y

RUN apt upgrade -y

RUN apt install vim -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb/50-server.cnf

CMD ["sleep", "infinity"]