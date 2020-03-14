build:
	docker build -t my_ubuntu ubuntu
down:
	docker-compose down

up: down build
	docker-compose up -d
clean_image:
	docker image list | awk '{print $3}' | xargs docker rmi -f
clean_container:
	docker ps -a | awk '{print $1}' | xargs docker rm
