.PHONY: build

image = hmpps-oracle-openjdk7

build:
	docker build $(no-cache) -t "$(image)" .
	bash -c "dgoss run -it --rm -u root $(image) bash"
ifneq ("$(newtag)x", "x")
	docker tag "$(image)" "$(image):$(newtag)"
else
	@echo "Skipping tagging as the tag variable is not set"
endif
