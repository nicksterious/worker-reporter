FROM alpine/curl

COPY src/entrypoint.sh /

RUN chmod 777 /entrypoint.sh

WORKDIR /

CMD entrypoint.sh