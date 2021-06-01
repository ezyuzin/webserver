# run
docker-compose up -d

# remove all images
docker rmi -f $(docker images -a -q)

# remove unused containers
docker container prune
docker image prune -a