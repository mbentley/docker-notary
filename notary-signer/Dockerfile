FROM alpine:latest

EXPOSE 4444
EXPOSE 7899

COPY ./signer-config.json /notary/signer/
COPY ./notary-signer /notary/signer/
COPY notary-signer.key notary-signer.crt notary-server.crt /certs/

WORKDIR /notary/signer

ENTRYPOINT [ "/notary/signer/notary-signer" ]
CMD [ "--help" ]
