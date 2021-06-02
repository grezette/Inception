FROM debian:buster

RUN apt-get update && \
	apt-get install -y php-mysql && \
	apt-get install -y default-mysql-server

CMD service mysql start && sleep infinity
