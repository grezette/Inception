FROM debian:buster

COPY ./tools/init_wp.sh /tmp
COPY ./tools/if_mv.sh /tmp

RUN apt-get update && \
	apt-get install -y php7.3-fpm curl && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	sh /tmp/init_wp.sh

COPY ./conf/wp-config.php /tmp

EXPOSE 9000

#CMD service php7.3-fpm start && php7.3-fpm -F -R

CMD mkdir run/php && sh /tmp/if_mv.sh && php -S 127.0.0.1:9000 -t /var/www/html

#/usr/sbin/php-fpm7.3 --nodaemonize
#CMD service php7.3-fpm start && service php7.3-fpm stop && /usr/sbin/php-fpm7.3 --nodaemonize
