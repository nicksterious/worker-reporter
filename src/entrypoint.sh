#!/bin/sh

### check for required variables
if [ "$KEY" = "" ]; then
    echo "Missing KEY" 1>&2
    exit 1
fi

if [ "$ENDPOINT_URL" = "" ]; then
    echo "Missing ENDPOINT_URL" 1>&2
    exit 1
fi

if [ "$SERVICE_PORT" = "" ]; then
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

echo "FREQUENCY: $FREQUENCY"
echo "ENDPOINT_URL: $ENDPOINT_URL"

echo "SERVICE_HOST: $SERVICE_HOST"
echo "SERVICE_PORT: $SERVICE_PORT"
echo "SERVICE_TYPE: $SERVICE_TYPE"
echo "SERVICE_NAME: $SERVICE_NAME"

if [[ -z "$USERNAME" ]]; then
    echo "USERNAME not set"
else
    echo "USERNAME set, hidden"
fi
if [[ -z "$PASSWORD" ]]; then
    echo "PASSWORD not set"
else
    echo "PASSWORD set, hidden"
fi

echo "TAGS: $TAGS"

# give squid some time to start
sleep 30

echo "Starting up..."

DATA="{\"key\":\"$KEY\",\"worker\":{\"tags\":\"$TAGS\", \"host\": \"$SERVICE_HOST\", \"port\": \"$SERVICE_PORT\", \"username\": \"$USERNAME\", \"password\": \"$PASSWORD\", \"type\": \"$SERVICE_TYPE\", \"name\":\"$SERVICE_NAME\"}}"

send_request() {
    echo $DATA | curl -H "Content-Type: application/json" -X POST -d @- $ENDPOINT_URL
}

while : ; do
    send_request
    sleep $FREQUENCY
done


