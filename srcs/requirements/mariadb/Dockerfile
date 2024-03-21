FROM debian:bullseye

RUN apt update -y

RUN apt install vim -y

RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/maria.sh ./

RUN chmod +x maria.sh

CMD ["./maria.sh"]
# CMD ["sleep", "infinity"]
