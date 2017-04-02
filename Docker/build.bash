#! /bin/bash

export HOST_PROJECT_HOME="$HOME/hackob_projects"
docker-compose -f build.yml up --build
