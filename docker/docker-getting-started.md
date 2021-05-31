# clone
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .
# build
cd getting-started
docker build -t docker101tutorial .
# run
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
# share
docker tag docker101tutorial {username}/docker101tutorial
docker push {username}/docker101tutorial
