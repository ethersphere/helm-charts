PWD=$(shell pwd)

HELM_VERSION="2.11.0"

HELM_DOCKER_IMAGE=alpine/helm:$(HELM_VERSION)
SHELLCHECK_DOCKER_IMAGE=koalaman/shellcheck:v0.7.0

SHELLCHECK=docker run -it --rm -w /scripts -v $(PWD):/scripts $(SHELLCHECK_DOCKER_IMAGE)
HELM=docker run -it --rm -v $(PWD):/apps $(HELM_DOCKER_IMAGE)

.PHONY: lint docker-deps package publish

lint: docker-deps
	$(HELM) lint $(shell dirname */Chart.yaml)
	$(SHELLCHECK) $(shell find . -type f -name "*.sh")

docker-deps:
	docker pull $(SHELLCHECK_DOCKER_IMAGE)
	docker pull $(HELM_DOCKER_IMAGE)

package:
	.travis/package.sh

publish: package
	.travis/publish.sh
