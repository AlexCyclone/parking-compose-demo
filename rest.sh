#!/bin/bash

export $(cat env.secret |xargs)
export APP_PROFILE=rest-mode
docker-compose up -d
