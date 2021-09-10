FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD
ARG WORDPRESS_ADMIN
ARG WORDPRESS_ADMIN_PASSWORD
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD

RUN apt-get update && \
	apt-get install -y php-mysql default-mysql-server

RUN chmod 775 /var/lib/mysql

COPY ./tools/init_db.sh /tmp
#COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/my.cnf /etc/my.cnf.d/mariadb-server.cnf

RUN service mysql restart && \
	sh /tmp/init_db.sh

EXPOSE 3306

CMD ["mysqld"];
