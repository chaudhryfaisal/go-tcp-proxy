NAME := go-tcp-proxy
ifndef VERSION
  VERSION := git-$(shell git rev-parse --short HEAD)
endif
IMAGE_URL := chaudhryfaisal/$(NAME):$(VERSION)

build:
	docker build -t ${IMAGE_URL} .

run: 
	docker run --rm -p 9999:9999  ${IMAGE_URL} -r fic-debug.now.sh:443 -v

test: 
	curl -vk https://127.0.0.1:9999 -H 'Host: fic-debug.now.sh'

push: build
	docker push ${IMAGE_URL}
