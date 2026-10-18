#!/bin/bash

# -it : interactive terminal
# --rm : remove container after exit
podman run -it --rm \
    -e "POSTGRES_USER=app" \
    -e "POSTGRES_PASSWORD=sstrOngp4sssW0rd" \
    -e "POSTGRES_DB=mydb" \
    -e "PGDATA=/var/lib/postgres/18/docker" \
    -p 5432:5432 \
    --name postgres18_container \
    -v ./postgres18/data:/var/lib/postgresql:Z,U \
    docker.io/library/postgres:18.6-trixie
