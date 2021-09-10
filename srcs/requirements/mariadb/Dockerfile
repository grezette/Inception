FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server mariadb-client mariadb-common

RUN chmod 775 /var/lib/mysql
COPY ./tools/init_db.sh /tmp
COPY ./tools/mqriqdb_user.sql /tmp
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

CMD service mysql start && sh /tmp/init_db.sh && mysqld -u root 
