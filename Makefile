# Auto-detect docker/podman
ENGINE := $(shell command -v podman 2>/dev/null || command -v docker)

IMAGE_NAME = blog-jekyll
CONTAINER_NAME = blog-dev

# Jekyll output directory (default matches jekyll build)
JEKYLL_OUTPUT_DIR ?= _site

# Ports for jekyll serve
PORT = 4000
LIVERELOAD_PORT = 35729

# Build container image
build-image:
	$(ENGINE) build -t $(IMAGE_NAME) -f Containerfile .

# Full static build (matches GitHub Actions)
build: build-image
	$(ENGINE) run --rm \
		--userns=keep-id \
		-v $(PWD):/site:Z \
		-w /site \
		$(IMAGE_NAME) \
		sh -c "bundle install && bundle exec jekyll build --destination $(JEKYLL_OUTPUT_DIR) --trace --verbose"

# Live development server (auto reload)
serve: build-image
	$(ENGINE) run --rm -it \
		--userns=keep-id \
		--name $(CONTAINER_NAME) \
		-p $(PORT):4000 \
		-p $(LIVERELOAD_PORT):35729 \
		-v $(PWD):/site:Z \
		-w /site \
		$(IMAGE_NAME) \
		sh -c "bundle install && bundle exec jekyll serve --livereload --host 0.0.0.0 --destination $(JEKYLL_OUTPUT_DIR)"

# Shell into container
shell: build-image
	$(ENGINE) run --rm -it \
		--userns=keep-id \
		-v $(PWD):/site:Z \
		-w /site \
		$(IMAGE_NAME) \
		bash

# Inject published + modified dates (same logic as your CI)
inject-dates:
	for f in $$(find _essays -name "*.md"); do \
	  published=$$(git log --diff-filter=A --follow --format=%cI -- "$$f" | tail -1); \
	  modified=$$(git log -1 --format=%cI -- "$$f"); \
	  [ -z "$$published" ] && published=$$modified; \
	  sed -i '/^date: /d' "$$f"; \
	  sed -i '/^last_modified_at: /d' "$$f"; \
	  awk -v pub="$$published" -v mod="$$modified" \
	    'NR==1{print; print "date: " pub; print "last_modified_at: " mod; next}1' \
	    "$$f" > "$$f.tmp" && mv "$$f.tmp" "$$f"; \
	done

# Clean jekyll caches + output
clean:
	rm -rf .jekyll-cache $(JEKYLL_OUTPUT_DIR)

# Reset
reset: clean
	rm -rf Gemfile.lock
