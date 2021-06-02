FROM debian:buster

RUN apt-get update && \
 	apt-get install -y nginx && \
	apt-get install -y openssl

RUN chown www-data:www-data /usr/share/nginx/html/ -R

COPY ./conf/default /etc/nginx/sites-available/
COPY ./conf/ssl-cert-snakeoil.pem /etc/ssl/certs/
COPY ./conf/ssl-cert-snakeoil.key /etc/ssl/private/

expose 443

CMD service nginx start && sleep infinity
