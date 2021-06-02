FROM debian:buster

RUN apt-get update &&\
	apt-get install -y php7.3-fpm &&\
	apt-get install -y wordpress

COPY ./conf/wp-config.php /var/www/html/wordpress/

CMD service php7.3-fpm start && sleep infinity
