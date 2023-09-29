IMAGE_NAME?=git-container
IMAGE_TAG?=latest

RUN_FLAGS?=-d
INIT_REPO?=https://github.com/argoproj/argocd-example-apps
GIT_PORT?=8088

CONTAINER_SUFFIX=$(shell cat /proc/sys/kernel/random/uuid | sha256sum | head -c 5)

all: image

image:
	podman build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	podman run -p $(GIT_PORT):8088 --name git-container-$(CONTAINER_SUFFIX) $(RUN_FLAGS) $(IMAGE_NAME):$(IMAGE_TAG)

debug:
	podman run -p $(GIT_PORT):8088 --rm -it $(IMAGE_NAME):$(IMAGE_TAG) -- bash
