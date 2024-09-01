all:
	@docker-compose up -d --build

down:
	@docker-compose down

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
