NAME = renaudhager/puppet-agent-smtp-docker-builder
VERSION = 1.0.0

all: build

build:
	docker build -t $(NAME)-ubuntu:$(VERSION) --rm ubuntu/14.04
	docker build -t $(NAME)-centos:$(VERSION) --rm centos/6.6

tag_latest:
	docker tag -f $(NAME)-ubuntu:$(VERSION) $(NAME)-ubuntu:latest
	docker tag -f $(NAME)-centos:$(VERSION) $(NAME)-centos:latest
