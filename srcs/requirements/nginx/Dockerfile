FROM debian:buster

RUN apt-get update && \
 	apt-get install -y nginx && \
	apt-get install -y openssl && \
	mkdir /var/www/wordpress && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl-cert-snakeoil.key -out /etc/ssl/certs/ssl-cert-snakeoil.pem -subj "/C=FR/ST=Ile de France/L=Paris/O=42/OU=Inception/CN=grezette.42.fr"


COPY ./conf/default /etc/nginx/sites-available/

RUN chown www-data:www-data /var/www/wordpress -R
RUN chmod -R 755 /var/www
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
