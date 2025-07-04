#LISTE DE CHOSE A FAIRE POUR LES PC DE 42
#CHANGER LE PATH en login dans le makefile, dockerfile et docker-compose file

all:
	sudo mkdir -p /home/yantoine/data/wordpress
	sudo mkdir -p /home/yantoine/data/mariadb
	sudo chmod 777 /etc/hosts
	echo "127.0.0.1 yantoine.42.fr" >> /etc/hosts
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

up:
	sudo docker-compose -f srcs/docker-compose.yml up --build -d

re: fclean all


fclean:
	sudo docker-compose -f srcs/docker-compose.yml down --rmi all --volumes
	sudo rm -rf /home/yantoine/data

.PHONY: all up fclean re

