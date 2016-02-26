all: build

build:
	@docker build -t mbentley/notary-server:0.2.0 -t mbentley/notary-server:latest ./notary-server
	@docker build -t mbentley/notary-signer:0.2.0 -t mbentley/notary-signer:latest ./notary-signer
	@docker build -t mbentley/notary-migrate:0.2.0 -t mbentley/notary-migrate:latest ./notary-migrate
	@docker build -t mbentley/notary-mariadb:0.2.0 -t mbentley/notary-mariadb:latest ./notary-mariadb

migrate:
	@docker-compose -f docker-compose-migrate.yml up migrate-server migrate-signer
	@docker-compose -f docker-compose-migrate.yml stop
	@docker-compose -f docker-compose-migrate.yml rm -f

start: migrate
	@docker-compose up -d

startonly:
	@docker-compose up -d

stop:
	@docker-compose stop

push:
	@docker push mbentley/notary-server
	@docker push mbentley/notary-signer
	@docker push mbentley/notary-migrate
	@docker push mbentley/notary-mariadb

release: build push

.PHONY: all build migrate push start startonly release
