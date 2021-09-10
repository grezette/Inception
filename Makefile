Volumes=/home/$(USER)/data/dbdata
Volumes=/home/$(USER)/data/wordpress

all: hosts
	ifeq(!(shell find ../ -type d -name "data") || !(shell find ../data/ -type d -name "dbdata" ) || !(shell find ../data/ -type d -name "wordpress"))
		mkdir -p ../data/dbdata mkdir ../data/wordpress
	docker-compose -f ./srcs/docker-compose.yaml up -d --build


hosts:
	sed -i '1 i\127.0.0.1\grezette.42.fr' /etc/hosts
