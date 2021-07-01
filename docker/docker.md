# Reference
MCR - https://github.com/microsoft/containerregistry
https://github.com/microsoft/vscode-dev-containers

https://docs.docker.com/compose/faq/
https://www.geeksforgeeks.org/difference-between-run-vs-cmd-vs-entrypoint-docker-commands/

https://devhints.io/docker-compose

https://hub.docker.com/

# Cheat sheet

**docker-cli**
```bash
# use docker-compose to bring up one service
docker-compose up -d jupyter-notebook
docker-compose -f <custom-docker-compose.yml> up -d jupyter-notebook        # for using custom-docker-compose.yml file
# start docker container
docker run [OPTIONS] IMAGE[:TAG|@DIGEST] [COMMAND] [ARG...]
docker run -p 8080:8080 python:3 python3 -m http.server 8080
docker run -it python:3 /bin/bash

# run flags
# working with images
# working with containers
# working with repositories

# attach to a container
docker exec -it <container name> /bin/bash

# stop a container
docker-compose stop jupyter-notebook

# inspect a container
docker inspect jupyter-notebook

# get logs from container
docker logs jupyter-notebook
```

**Dockerfile**

**docker-compose.yml**
```yml
version: "3"            # version of docker-compose.yaml file

services:               # services definition
  python:               # service name
    container_name: dev_python          # container name
    build:                              # build details
        context: .                      # directory of build file
        dockerfile: python-dockerfile   # build file
    image: ubuntu:latest                # image details
    ports:                              # port mapping
        - "8080:80"
    volumes:                            # volume mappings - bind mount
        - ~/base/:/opt/base/
    networks:                           # networks section
        - dev                           # network name
    stdin_open: true                    # docker run -i
    tty: true                           # docker run -t
    working_dir: /opt/base/             # change working directory
    entrypoint: ["/bin/bash", "-c"]     # entry point
    command:                            # command
        - /bin/bash
        - -c
        - |
            yes | apt-get install net-tools
            yes | apt-get install vim

networks:                               # networks definition
    dev:                                # network name
        driver: bridge                  # network detaiils
```

# Tips
## Getting Started

```bash
# clone
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .

# build
cd getting-started
docker build -t docker101tutorial .

# run
docker run -d -p 80:80 --name docker-tutorial docker101tutorial

# share
docker tag docker101tutorial {docker-user}/docker101tutorial
docker push ${docker-user}/docker101tutorial
```

## Start docker app
```bash
# mac
docker ps -q | xargs -L1 docker stop        # stop containers
test -z "$(docker ps -q 2>/dev/null)" && osascript -e 'quit app "Docker"'   # stop docker app
open --background -a Docker                 # start docker app

# windows

```