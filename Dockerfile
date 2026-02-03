FROM alpine/curl

COPY src/ /

WORKDIR /

CMD docker-entrypoint.sh