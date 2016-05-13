Docker Notary Images for Deployment
===================================

These are minimal images for deploying notary services.  All images are currently based on notary 0.2.0.  You will need to ensure ou have `make` and `docker-compose` installed.

`make build` - builds images

`make release` - builds images and pushes to Docker Hub

`make start` - runs migrations and starts notary services

`make startonly` - starts notary services (skips migrations)

To enable notary services in DTR, set the URL to `https://notaryserver:4443`
