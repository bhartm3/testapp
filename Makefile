version ?= latest
ARTIFACT_ID=testapp
REGISTRY=localhost:5000

all: build push cleanup

pull:
	docker pull ${REGISTRY}/${ARTIFACT_ID}

build:
	docker build -t ${REGISTRY}/${ARTIFACT_ID} -f Dockerfile .

push:
	docker tag ${REGISTRY}/${ARTIFACT_ID} ${REGISTRY}/${ARTIFACT_ID}:$(version)
	docker push ${REGISTRY}/${ARTIFACT_ID}:$(version)
  
cleanup:
	docker rmi ${REGISTRY}/${ARTIFACT_ID}
	docker tag ${REGISTRY}/${ARTIFACT_ID}:$(version)

.PHONY: build push pull 
