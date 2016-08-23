Docker Notary Images for Deployment
===================================

These are minimal images for deploying notary services.  All images are currently based on notary 0.3.0.  You will need to ensure you have `make` and `docker-compose` installed.

Compose - https://docs.docker.com/compose/install/#install-as-a-container

`make build` - builds images

`make release` - builds images and pushes to Docker Hub

`make start` - runs migrations and starts notary services

`make startonly` - starts notary services (skips migrations)

To enable notary services in DTR, set the URL to `https://notaryserver:4443`

If you're using DTR 1.4.x, make sure to change the external network name in `docker-compose.yml` from `dtr-ol` to `dtr`.
