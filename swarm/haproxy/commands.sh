# create the haproxy service
docker service create \
--name ha \
--constraint node.hostname==udock \
--network elastic \
--mode replicated \
--replicas 2 \
--endpoint-mode vip \
--update-parallelism 1 \
--update-delay 60s \
--publish published=80,target=80,protocol=tcp,mode=ingress \
--publish published=443,target=443,protocol=tcp,mode=ingress \
--publish published=6514,target=6514,protocol=tcp,mode=ingress \
--publish published=5601,target=5601,protocol=tcp,mode=ingress \
--publish published=9200,target=9200,protocol=tcp,mode=ingress \
haproxytech/haproxy-debian:2.0

# hopefully don't need this with Dockerfile adding this.
--mount type=bind,src=/etc/haproxy/,dst=/etc/haproxy/,ro=true \
