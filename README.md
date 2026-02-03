# What's this?

A super small container that sends regular status updates to a worker orchestration service.

Just pass some env variables, fire it up and forget about it.

# Configuration

## Required
* `ENDPOINT_URL` where to send the updates 
* `KEY` a key to authenticate the worker

## Optional
* `SERVICE_NAME` a friendly name to identify the worker by; if missing the orchestrator will call it "Unnamed worker"
* `SERVICE_HOST` a host name or IP address if posting for someone else or would like to use a DNS record. If unspecified the orchestrator will detect the worker's public IP.
* `SERVICE_PORT` a port the service is reachable at
* `SERVICE_TYPE` Proxy, Browser, Scraper, ETL or whatever. It will default to Basic
* `TAGS` some tags for grouping, eg: `super-secret,google-cloud,region-iowa,n4g-micro`
* `FREQUENCY` to send updates, default 60
* `USERNAME` and `PASSWORD` in case the service requires authentication.


## Starting up

Set your ENV vars and do a ```docker-compose up -d service-reporter```

## License
https://en.wikipedia.org/wiki/WTFPL
