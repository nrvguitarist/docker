docker build -t fb9516_redis:1.0.1 .

# create the filebeat service
docker service create \
--name fb \
--network elastic \
--mode replicated \
--replicas 2 \
--endpoint-mode dnsrr \
--update-parallelism 1 \
--update-delay 60s \
udock.sharpt:8443/fb9516_redis:1.0.1

