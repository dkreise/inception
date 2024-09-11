all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml down

clean:
	@rm -rf /home/dkreise/Documents/inception/another_try/database/*
	@rm -rf /home/dkreise/Documents/inception/another_try/wordpress_data/*
	@docker stop $$(docker ps -qa);
	@docker rm $$(docker ps -qa);
	@docker volume rm $$(docker volume ls -q);
	@docker network rm dikreis;
	@docker rmi -f $$(docker images -qa);
	@docker system prune -af;

re: clean all

.PHONY: all down clean re
