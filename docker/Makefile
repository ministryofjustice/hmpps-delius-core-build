CORE_CONTAINERS:= oracle-jdk7 oracle-openjdk7

.PHONY: build $(CORE_CONTAINERS) $(BASE_CONTAINERS)

tagrepo = yes
ifneq ($(stage),)
	stagearg = --stage $(stage)
endif

ifdef buildArgs
	no-cache := --no-cache
endif

currenttag = $(shell semvertag latest $(stagearg))
ifneq ($(findstring ERROR, $(currenttag)),)
	currenttag = 0.0.0
	ifneq ($(stage),)
		currenttag = 0.0.0-$(stage)
	endif
endif

newtag = $(shell semvertag bump patch $(stagearg))
ifneq ($(findstring ERROR, $(newtag)),)
	newtag = 0.0.1
	ifneq ($(stage),)
		newtag = 0.0.1-$(stage)
	endif
endif

build: $(CORE_CONTAINERS)

$(CORE_CONTAINERS):
	$(MAKE) -C $@ newtag=$(newtag) no-cache=$(no-cache)
