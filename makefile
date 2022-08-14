VERSION=1.1.0
DOCKER_IMAGE=wbsnail/sshd

.DEFAULT_GOAL := build

build:
	docker build -t ${DOCKER_IMAGE}:${VERSION} -f ./container/Dockerfile .

push: build
	docker push ${DOCKER_IMAGE}:${VERSION}

push-with-latest: push # push with the latest tag
	docker tag ${DOCKER_IMAGE}:${VERSION} ${DOCKER_IMAGE}:latest
	docker push ${DOCKER_IMAGE}:latest
