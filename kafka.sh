#!/bin/bash

export $(cat env.secret |xargs)
export APP_PROFILE=kafka-mode
docker-compose --profile kafka up -d
