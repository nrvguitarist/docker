#!/bin/bash

docker build -t log_rec:1.2.2 .

# create the log_rec service
docker service create \
--name log_rec \
--network elastic \
--mode replicated \
--replicas 2 \
--endpoint-mode dnsrr \
--update-parallelism 1 \
--update-delay 60s \
log_rec:1.2.2
