Volumes=/home/$(USER)/data/dbdata
Volumes=/home/$(USER)/data/wordpress

all: hosts
	sudo docker-compose -f ./srcs/docker-compose.yaml --env-file srcs/.env up -d --build 

#ifeq(!(shell find ../ -type d -name "data") || !(shell find ../data/ -type d -name "dbdata" ) || !(shell find ../data/ -type d -name "wordpress"))
#	mkdir -p ../data/dbdata mkdir ../data/wordpress

down:
	sudo docker-compose -f ./srcs/docker-compose.yaml --env-file srcs/.env down -v

clean: down
	@ sudo docker image rm $(sudo docker image ls -q)

fclean: clean
	sudo docker volume rm $(sudo docker volume ls -q)

hosts:
	sudo sed -i '1 i\127.0.0.1\ grezette.42.fr' /etc/hosts
