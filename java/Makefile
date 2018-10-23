REGISTRY := <<CHANGE_ME!>>
VERSION  := 0.0.1
APP      := probes-java
IMAGE    := ${REGISTRY}/${APP}:${VERSION}

default: help

build: ## Compiles the program
	@pushd service ;\
	mvn package ;\
	popd ;\
	mkdir -p jars ;\
	cp service/target/hello-0.0.1.jar jars

img: build  ## Build docker image
	@docker build -f Dockerfile --rm -t ${IMAGE} .

push: img ## Push docker image to registry
	@docker push ${IMAGE}

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[38;5;69m%-30s\033[38;5;168m %s\n", $$1, $$2}'
