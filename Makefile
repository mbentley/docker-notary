all: help

help:			## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build:			## Build Notary images
	@docker build -t mbentley/notary-server:0.3.0 -t mbentley/notary-server:latest ./notary-server
	@docker build -t mbentley/notary-signer:0.3.0 -t mbentley/notary-signer:latest ./notary-signer
	@docker build -t mbentley/notary-migrate:0.3.0 -t mbentley/notary-migrate:latest ./notary-migrate
	@docker build -t mbentley/notary-mariadb:0.3.0 -t mbentley/notary-mariadb:latest ./notary-mariadb

migrate:		## Run database migrations
	@docker-compose -f docker-compose-migrate.yml up migrate-server migrate-signer
	@docker-compose -f docker-compose-migrate.yml stop
	@docker-compose -f docker-compose-migrate.yml rm -f

start: migrate		## Run migrations and start Notary services
	@docker-compose up -d

startonly:		## Start Notary services
	@docker-compose up -d

stop:			## Stop Notary services
	@docker-compose stop

pull:			## Pull images for Notary
	@docker-compose -f docker-compose-migrate.yml pull
	@docker-compose pull

push:			## Push images for Notary to Docker Hub
	@docker push mbentley/notary-server
	@docker push mbentley/notary-signer
	@docker push mbentley/notary-migrate
	@docker push mbentley/notary-mariadb

release: build push	## Build and push images to Docker Hub

.PHONY: all build help migrate push start startonly release
