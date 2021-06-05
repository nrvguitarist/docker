#!/bin/bash

docker build -t log_rec:1.1 .

# create the log_rec service
docker service create \
--name log_rec \
--constraint node.hostname==udock \
--network elastic \
--mode replicated \
--replicas 1 \
--endpoint-mode dnsrr \
--update-parallelism 1 \
--update-delay 60s \
log_rec:1.1
