#! /bin/bash

export HOST_PROJECT_HOME=~/bogosity
docker-compose down
docker-compose up -f build.yml --build
