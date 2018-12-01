PWD=$(shell pwd)

HELM_VERSION="2.11.0"

HELM_DOCKER_IMAGE=alpine/helm:$(HELM_VERSION)
SHELLCHECK_DOCKER_IMAGE=koalaman/shellcheck

SHELLCHECK=docker run -it --rm -w /scripts -v $(PWD):/scripts $(SHELLCHECK_DOCKER_IMAGE)
HELM=docker run -it --rm -v $(PWD):/apps $(HELM_DOCKER_IMAGE)

.PHONY: lint docker-deps

lint: docker-deps
	$(HELM) lint $(shell dirname */Chart.yaml)
	$(SHELLCHECK) *.sh

docker-deps:
	docker pull $(SHELLCHECK_DOCKER_IMAGE)
	docker pull $(HELM_DOCKER_IMAGE)
