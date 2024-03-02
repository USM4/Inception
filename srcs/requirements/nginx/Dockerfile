FROM debian:buster

RUN apt update && apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=oredoine.42.fr/UID=oredoine"
RUN -p /var/run/nginx
COPY conf/nginx/nginx.conf /etc/nginx/nginx.conf