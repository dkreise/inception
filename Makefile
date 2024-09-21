all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@rm -rf /home/dkreise/data/mysql/*
	@rm -rf /home/dkreise/data/wordpress/*
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker rmi -f $$(docker images -qa) 2>/dev/null;
	@docker volume rm $$(docker volume ls -q);
	@docker network rm dikreis;
	#@docker system prune -af;

re: clean all

.PHONY: all down clean re
