# create the haproxy service
docker service create \
--name ha \
--network elastic \
--mode replicated \
--replicas 2 \
--endpoint-mode vip \
--update-parallelism 1 \
--update-delay 60s \
--replicas-max-per-node 1
--publish published=80,target=80,protocol=tcp,mode=ingress \
--publish published=443,target=443,protocol=tcp,mode=ingress \
--publish published=6514,target=6514,protocol=tcp,mode=ingress \
--publish published=5601,target=5601,protocol=tcp,mode=ingress \
--publish published=9200,target=9200,protocol=tcp,mode=ingress \
haproxytech/haproxy-debian:2.0

# hopefully don't need this with Dockerfile adding this.
--mount type=bind,src=/etc/haproxy/,dst=/etc/haproxy/,ro=true \

#deprecated in favor of 2 replicas and max per node
--constraint node.hostname==udock \
