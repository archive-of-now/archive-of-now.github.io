# Detect container runtime (prefers podman)
RUNTIME := $(shell command -v podman 2>/dev/null || command -v docker)

IMAGE_NAME := aon-docs
CONTAINER_NAME := aon-docs

.PHONY: build run start clean

## Build container image
build:
	$(RUNTIME) build -t $(IMAGE_NAME) .

## One-shot run: replicates GitHub Action behavior (just builds _site/)
run:
	$(RUNTIME) run --rm -v $$(pwd):/site:Z $(IMAGE_NAME)

## Start local dev server (Jekyll serve)
start:
	$(RUNTIME) run --rm -it \
		--name $(CONTAINER_NAME) \
		-p 4000:4000 \
		-v $$(pwd):/site:Z \
		$(IMAGE_NAME) \
		bundle exec jekyll serve --host 0.0.0.0 --livereload

## Remove container + image
clean:
	-$(RUNTIME) rm -f $(CONTAINER_NAME)
	-$(RUNTIME) rmi -f $(IMAGE_NAME)
