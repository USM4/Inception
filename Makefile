SRC_DIR = srcs/docker-compose.yml

all:
	docker-compose -f $(SRC_DIR) up

clean-imgs:
	docker rmi -f $$(docker image ls)

clean-containers-volumes:
	docker rm -vf $$(docker ps -aq)

fclean: clean-containers-volumes clean-imgs  