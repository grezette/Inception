FROM debian:buster

ARG WORDPRESS_DB_NAME
ARG WORDPRESS_ADMIN
ARG WORDPRESS_ADMIN_PASSWORD
ARG WORDPRESS_DB_USER
ARG WORDPRESS_DB_PASSWORD
ARG WORDPRESS_DB_HOST

RUN apt-get update && \
	apt-get install -y php7.3-fpm php-mysql curl && \
	mkdir -p /var/www/wordpress && \
	cd /tmp && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  && \
	chmod +x /tmp/wp-cli.phar && \
	cd / && \
	mv /tmp/wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config.php /var/www/wordpress
COPY ./conf/init_wordpress.sh /tmp
#COPY ./conf/www.conf /etc/php/7.3/fpm/pool

RUN adduser --disabled-password -gecos 'wp' wp && \
	adduser --disabled-password -gecos 'nginx' nginx && \
	chown -R wp:wp var/www/ && \
	chown -R nginx var/www/ && \
	chmod -R 777 var/www/ && \
	su - wp -c 'wp core download --path=/var/www/wordpress'


EXPOSE 9000

#CMD service php7.3-fpm start && php7.3-fpm -F -R

CMD sh /tmp/init_wordpress.sh && php -S 127.0.0.1:9000 -t /var/www/wordpress

#/usr/sbin/php-fpm7.3 --nodaemonize
#CMD service php7.3-fpm start && service php7.3-fpm stop && /usr/sbin/php-fpm7.3 --nodaemonize
