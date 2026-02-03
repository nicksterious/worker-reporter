#!/bin/bash

### check for required variables
if [[ -z "$KEY" ]]; then
    echo "Missing KEY" 1>&2
    exit 1
fi

if [[ -z "$ENDPOINT_URL" ]]; then
    echo "Missing ENDPOINT_URL" 1>&2
    exit 1
fi

if [[ -z "$SERVICE_PORT" ]]; then
    echo "Missing SERVICE_PORT" 1>&2
    exit 1
fi


### optional variables
if [[ -z "$FREQUENCY" ]]; then
    # default to 45
    FREQUENCY=45
fi
if [[ -z "$SERVICE_TYPE" ]]; then
    # default to 45
    SERVICE_TYPE="Basic"
fi

# Proceed: send request every $FREQUENCY seconds
watch -n $FREQUENCY -x curl --header "Content-Type: application/json" \
    --request POST \
    --data '{"key":"$KEY","worker":{"tags":"$TAGS", "host": "$HOST", "port": "$SERVICE_PORT", "username": "$USERNAME", "password": "$PASSWORD", "type": "$SERVICE_TYPE", "name":"$SERVICE_NAME"}}' \
    $ENDPOINT_URL

