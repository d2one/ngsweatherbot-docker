DOCKER_IMAGE_NAME = weatherbot
CONTAINER_NAME = weatherbot-ngs

docker-build: Dockerfile
	docker build --force-rm=true --tag=$(DOCKER_IMAGE_NAME) .

docker-run:
	@echo "Here's an example command on how to run a webhook container:"
	@echo "docker run -d --name=$(CONTAINER_NAME) -e \"SOME CODE\" $(DOCKER_IMAGE_NAME) "