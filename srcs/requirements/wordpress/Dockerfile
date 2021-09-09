FROM debian:buster

RUN apt-get update && \
	apt-get install -y php7.3-fpm php-mysql wget && \
	mkdir /var/www/ && \
	wget https://wordpress.org/latest.tar.gz && \
	tar xzvf latest.tar.gz && \
	cp -a wordpress/. /var/www/wordpress

COPY ./conf/wp-config.php /var/www/wordpress
COPY ./conf/www.conf /etc/php/7.3/fpm/pool

EXPOSE 9000

#CMD service php7.3-fpm start && php7.3-fpm -F -R

CMD mkdir run/php && php -S 127.0.0.1:9000 -t /var/www/wordpress

#/usr/sbin/php-fpm7.3 --nodaemonize
#CMD service php7.3-fpm start && service php7.3-fpm stop && /usr/sbin/php-fpm7.3 --nodaemonize
