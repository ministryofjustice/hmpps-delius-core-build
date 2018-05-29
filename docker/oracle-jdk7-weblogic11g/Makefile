.PHONY: build

image = hmpps-oracle-jdk7

build:
	docker build $(no-cache) -t "$(image)" .
ifneq ("$(newtag)x", "x")
	docker tag "$(image)" "$(image):$(newtag)"
else
	@echo "Skipping tagging as the tag variable is not set"
endif
