Docker Notary Images for Deployment
===================================

These are minimal images for deploying notary services.  ALl images are currently based on notary 0.2.0.

`make build` - builds images

`make release` - builds images and pushes to Docker Hub

`make start` - runs migrations and starts notary services

`make startonly` - starts notary services (skips migrations)
