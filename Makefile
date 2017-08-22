DOCKER_IMAGE_NAME = weatherbot
CONTAINER_NAME = weatherbot-ngs

docker-build: Dockerfile
	docker build --force-rm=true --tag=$(DOCKER_IMAGE_NAME) .