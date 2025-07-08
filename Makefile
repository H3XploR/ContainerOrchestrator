all:
	mkdir -p /home/yantoine/data/db
	mkdir -p /home/yantoine/data/wp
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down

re: down all

prune:
	docker system prune -a --volumes
	rm -rf /home/yantoine/data/db
	rm -rf /home/yantoine/data/wp

.PHONY: all down re prune
