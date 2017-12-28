# Binary names
BINARY_NAME=node-4

DOCKER_CONTAINER=mw-node-4
DEPLOY_NAME=mw-node-4-deploy
DEPLOY_YAML=mw-node-4-deploy.yaml
DEPLOY_NAMESPACE=madwater-rd
IMAGE_TAG=v1

all: dockerize deploy-dev

dockerize:
	docker build -t $(DOCKER_CONTAINER):$(IMAGE_TAG) .

deploy-dev:
	- kubectl delete deploy $(DEPLOY_NAME) --namespace $(DEPLOY_NAMESPACE)
	kubectl create -f $(DEPLOY_YAML) --namespace $(DEPLOY_NAMESPACE)
