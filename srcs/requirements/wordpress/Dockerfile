FROM debian:buster

RUN apt-get update &&\
	apt-get install -y php7.3-fpm &&\
	apt-get install -y wordpress

COPY ./conf/wp-config.php /var/www/html/wordpress/

CMD mkdir run/php && /usr/sbin/php-fpm7.3 --nodaemonize
#CMD service php7.3-fpm start && service php7.3-fpm stop && /usr/sbin/php-fpm7.3 --nodaemonize
