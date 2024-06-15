#!/bin/bash

export $(cat env.secret |xargs)
export APP_PROFILE=default
docker-compose up -d
