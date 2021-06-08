docker build -t red:1.0.0 .
docker image tag red:1.0.0 udock.sharpt:8443/red:1.0.0
docker push udock.sharpt:8443/red:1.0.0

docker service update red --image udock.sharpt:8443/red:1.0.0

# create the redis service
docker service create \
--name red \
--network elastic \
--mode replicated \
--replicas 2 \
--endpoint-mode dnsrr \
--update-parallelism 1 \
--update-delay 60s \
udock.sharpt:8443/red:1.0.0
