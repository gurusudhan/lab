# Reference


# Cheat sheet
**docker-cli**
```bash

```

**docker-build**

**docker-compose**
```yml
version: "3"            # version of docker-compose.yaml file

services:               # services definition
  python:               # service name
    container_name: dev_python          # container name
    build:                              # build details
        context: .                      # directory of build file
        dockerfile: python-dockerfile   # build file
    image: ubuntu:latest                # image details
    stdin_open: true                    # docker run -i
    tty: true                           # docker run -t
    ports:                              # port mapping
        - "8080:80"
    volumes:                            # volume mappings - bind mount
        - ~/base/:/opt/base/
    networks:                           # networks section
        - dev                           # network name
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
