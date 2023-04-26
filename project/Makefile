name = inception

all:
	@mkdir -p /home/ibulak/data
	@mkdir -p /home/ibulak/data/mariadb
	@mkdir -p /home/ibulak/data/wordpress
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

re:
	@sudo rm -rf ~/data
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker-compose -f ./srcs/docker-compose.yml down
	@docker system prune -af

.PHONY	: all re clean clean