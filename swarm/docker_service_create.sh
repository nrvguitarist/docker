# https://docs.docker.com/engine/reference/commandline/service_create/

# create a network
docker network create --attachable --driver overlay elastic

# how to add a label to a node
docker node update --label-add region=east yswe2dm4c5fdgtsrli1e8ya5l

# create the service
docker service create \
--name log_gen \
--network elastic \
--mode replicated \
--replicas 0 \
--endpoint-mode dnsrr \
--update-parallelism 1 \
--update-delay 60s \
--mount type=volume,src=log_gen,dst=/usr/share/logstash/config/ \
docker.elastic.co/logstash/logstash:7.13.1

--env MONITORING_ENABLED=FALSE \

# additional useful config
--constraint node.hostname!=node-2 \
--constraint node.labels.security==high \
--constraint node.id==2ivku8v2gvtg4 \
--placement-pref spread=node.labels.datacenter \
--replicas-max-per-node 1 \
--publish published=8080,target=80,protocol=tcp,mode=ingress \
--env MYVAR=foo \
--label elastic=data \
--restart-delay 5s \
--restart-max-attempts 5 \
--with-registry-auth



