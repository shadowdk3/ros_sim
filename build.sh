#!/bin/bash

export USER_UID=$(id -u)
export USER_GID=$(id -g)
export USERNAME=$(whoami)

docker-compose up --build 