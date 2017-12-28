# Basic go commands
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get

# Binary names
BINARY_NAME=node-4

DOCKER_CONTAINER=mw-node-4
DEPLOY_NAME=mw-node-4-deploy
DEPLOY_YAML=mw-node-4-deploy.yaml
DEPLOY_NAMESPACE=madwater-rd

all: dockerize deploy-dev

build:
	#$(GOBUILD) -o $(BINARY_NAME) -v hello.go	

dockerize:
	docker build -t $(DOCKER_CONTAINER) .

deploy-dev:
	- kubectl delete deploy $(DEPLOY_NAME) --namespace $(DEPLOY_NAMESPACE)
	kubectl create -f $(DEPLOY_YAML) --namespace $(DEPLOY_NAMESPACE)

clean:
	$(GOCLEAN)
	rm -f $(BINARY_NAME)