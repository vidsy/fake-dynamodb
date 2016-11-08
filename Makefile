BRANCH ?= "master"
DOCKER_IMAGE ?= "vidsyhq/fake-dynamodb"
REPO_NAME ?= "fake-dynamodb"
VERSION ?= $(shell cat ./VERSION)

build:
	docker build -t ${DOCKER_IMAGE} .

check-version:
	@echo "=> Checking if VERSION exists as Git tag..."
	(! git rev-list ${VERSION})

push-tag:
	@echo "=> New tag version: ${VERSION}"
	git checkout ${BRANCH}
	git pull origin ${BRANCH}
	git tag ${VERSION}
	git push origin ${BRANCH} --tags
