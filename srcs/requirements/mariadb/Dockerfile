FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WORDPRESS_ADMIN
ARG WP_ADMIN_PASSWORD
ARG WP_USER
ARG WP_USER_PASSWORD

RUN apt-get update && \
	apt-get install -y mariadb-server

RUN chmod 775 /var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql

COPY ./tools/init_db.sh /tmp
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
#COPY ./conf/my.cnf /etc/mysql/

RUN service mysql start && \
	sh /tmp/init_db.sh

EXPOSE 3306

CMD ["mysqld"];
