.PHONY: build

image = hmpps-oracle-base

build:
	docker login --username=$(oracleusername) --password=$(oraclepasswd) container-registry.oracle.com
	docker build $(no-cache) -t "$(image)"  .
