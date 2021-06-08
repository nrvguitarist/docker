docker build -t fb9516_redis:1.0.0 .

# create the filebeat service
docker service create \
--name fb \
--network elastic \
--mode replicated \
--replicas 2 \
--endpoint-mode dnsrr \
--update-parallelism 1 \
--update-delay 60s \
fb9516_redis:1.0.0

