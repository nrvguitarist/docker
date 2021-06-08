docker build -t red:1.0.0 .
docker image tag red:1.0.0 udock.sharpt:8443/red:1.0.0
docker push udock.sharpt:8443/red:1.0.0

docker service update red --image udock.sharpt:8443/red:1.0.0

