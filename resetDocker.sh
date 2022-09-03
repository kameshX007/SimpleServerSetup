echo "Stopping all docker containers...">resetDocker.log;
container=$(docker container ls -q)>>resetDocker.log;
[ -z "$container" ] && echo "No running container found">>resetDocker.log || docker stop $(docker container ls -q);
echo "Deleting all docker data...">>resetDocker.log;
docker system prune -a -f>>resetDocker.log;
echo "Docker reset successfull...">>resetDocker.log;
