PROJECT_NAME=inception
DOCKER_COMPOSE=docker-compose
DC_FILE=srcs/docker-compose.yml
ENV_FILE=srcs/.env

all: up

up:
	@mkdir -p /home/yantoine/data/mariadb
	@mkdir -p /home/yantoine/data/wordpress
	@$(DOCKER_COMPOSE) -f $(DC_FILE) --env-file $(ENV_FILE) up -d --build

down:
	@$(DOCKER_COMPOSE) -f $(DC_FILE) --env-file $(ENV_FILE) down

clean:
	# Arrête et supprime containers + volumes liés au projet
	@$(DOCKER_COMPOSE) -f $(DC_FILE) --env-file $(ENV_FILE) down -v --remove-orphans

fclean: clean
	# Supprime images du projet + system prune + supprime données sur l'hôte
	@docker image rm -f $(PROJECT_NAME)_wordpress $(PROJECT_NAME)_mariadb $(PROJECT_NAME)_nginx || true
	@docker system prune -af
	@rm -rf /home/yantoine/data/mariadb
	@rm -rf /home/yantoine/data/wordpress

re: fclean up

.PHONY: all up down clean fclean re
