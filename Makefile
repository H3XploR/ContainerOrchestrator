NAME=inception
SRC_DIR=srcs

up:
	docker compose -f $(SRC_DIR)/docker-compose.yml --env-file $(SRC_DIR)/.env up -d --build

down:
	docker compose -f $(SRC_DIR)/docker-compose.yml down

re: down up

fclean: down
	docker system prune -af

.PHONY: up down re fclean
