FROM debian:jessie

COPY migrate /usr/local/bin/migrate
COPY migrations/ /migrations/

CMD ["/migrations/migrate.sh"]
