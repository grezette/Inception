MYSQL_VOLUME	=	/home/$(USER)/data/dbdata
WP_VOLUME	=	/home/$(USER)/data/wordpress

all: hosts create_volumes
	cd /home/$(USER)/Documents/Inception/srcs && sudo docker-compose up -d --build 

down:
	 cd /home/$(USER)/Documents/Inception/srcs && sudo docker-compose down
fclean:
	 cd /home/$(USER)/Documents/Inception/srcs && sudo docker-compose down -v --rmi 'all'
	 sudo rm -rf $(MYSQL_VOLUME) $(WP_VOLUME)


create_volumes:
	[ -d $(MYSQL_VOLUME) ] || mkdir -p $(MYSQL_VOLUME)
	[ -d $(WP_VOLUME) ] || mkdir -p $(WP_VOLUME)

hosts:
	sudo sed -i '1 i\127.0.0.1\ grezette.42.fr' /etc/hosts
