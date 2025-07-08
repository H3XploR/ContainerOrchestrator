all:
	mkdir -p /home/yantoine/data/db
	mkdir -p /home/yantoine/data/wp
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down 

re: down all

prune: down
	docker system prune -a --volumes
	docker volume rm srcs_db srcs_wp
	rm -rf /home/yantoine/data/db
	rm -rf /home/yantoine/data/wp

.PHONY: all down re prune
