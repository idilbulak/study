name = inception

all:
	@mkdir ~/data
	@mkdir ~/data/mariadb
	@mkdir ~/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

re:
	@sudo rm -rf ~/data
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

clean:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down
	@docker system prune -af

.PHONY	: all re clean clean