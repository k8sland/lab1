IMG_NAME := CHANGE_ME/learnk8s-java
IMG_TAG  := CHANGE_ME

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## Compiles the program
	@pushd service ;\
	mvn package ;\
	popd ;\
	mkdir -p jars ;\
	cp service/target/hello-0.0.1.jar jars

img:   ## Build docker image
	@docker build -f Dockerfile --rm -t $(IMG_NAME):$(IMG_TAG) .

push:  ## Push docker image to registry
	@docker push $(IMG_NAME):$(IMG_TAG)
