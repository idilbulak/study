name = inception

all:
	@mkdir ~/data
	@mkdir ~/data/mariadb
	@mkdir ~/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

re:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all re clean fclean