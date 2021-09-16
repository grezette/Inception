FROM debian:buster

ARG DOMAIN_NAME
ARG WP_DATABASE
ARG MYSQL_DATABASE
ARG WP_ADMIN
ARG WP_ADMIN_PASSWORD
ARG WP_USER
ARG WP_USER_PASSWORD
ARG WP_DB_HOST

RUN apt-get update && \
	apt-get install -y php-cgi php-common php-fpm php-pear php-mbstring php-zip php-net-socket php-gd php-xml-util php-gettext php-mysql php-bcmath mariadb-client curl && \
	mkdir -p /var/www/wordpress && \
	cd /tmp && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  && \
	chmod +x /tmp/wp-cli.phar && \
	cd / && \
	mv /tmp/wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config.php /tmp
COPY ./tools/init_wordpress.sh /tmp
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

RUN adduser --disabled-password -gecos 'wp' wp && \
	adduser --disabled-password -gecos 'nginx' nginx && \
	chown -R wp:wp var/www/ && \
	chown -R nginx var/www/ && \
	chmod -R 777 var/www/ && \
	su - wp -c 'wp core download --path=/var/www/wordpress'

RUN service php7.3-fpm start

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/init_wordpress.sh" ]
CMD [ "php-fpm7.3", "-F", "-R" ]
