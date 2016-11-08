BRANCH ?= "master"
DOCKER_USER ?= "vidsyhq"
REPO_NAME ?= "fake-dynamodb"
VERSION ?= $(shell cat ./VERSION)

build:
	docker build -t ${DOCKER_USER}/${REPO_NAME} .

check-version:
	@echo "=> Checking if VERSION exists as Git tag..."
	(! git rev-list ${VERSION})

push-tag:
	@echo "=> New tag version: ${VERSION}"
	git checkout ${BRANCH}
	git pull origin ${BRANCH}
	git tag ${VERSION}
	git push origin ${BRANCH} --tags
