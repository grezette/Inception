FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG WP_ADMIN
ARG WP_ADMIN_PASSWORD
ARG WP_USER
ARG WP_USER_PASSWORD

RUN apt-get update && \
	apt-get install -y mariadb-server

RUN chmod 775 /var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql

COPY ./conf/wp-db.sql /tmp
COPY ./tools/init_db.sh /tmp
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chown -R mysql:mysql /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT [ "bash", "/tmp/init_db.sh" ]
CMD ["mysqld", "--log-error"];

