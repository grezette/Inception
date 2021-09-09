all: hosts
	docker-compose -f ./srcs/docker-compose.yaml up -d --build

hosts:
	sed -i '1 i\127.0.0.1\grezette.42.fr' /etc/hosts
