FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server mariadb-client

CMD service mysql start && mysql
