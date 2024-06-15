# Parking Service Demo
The repository contains scripts and a Docker Compose file for demo deployment of a toy Parking service.

### Guides
TODO: docs, architecture etc.

### Docker Compose images
* postgres: [`postgres:16.3-alpine`](https://hub.docker.com/_/postgres)
* zookeeper: [`confluentinc/cp-zookeeper:7.6.1`](https://hub.docker.com/r/confluentinc/cp-zookeeper)
* kafka: [`confluentinc/cp-kafka:7.6.1`](https://hub.docker.com/r/confluentinc/cp-kafka)
* eureka-server [`eureka-server:0.0.1-SNAPSHOT`](https://github.com/AlexCyclone/eureka-server)
* spring-cloud-gateway [`cloud-gateway:0.0.1-SNAPSHOT'`](https://github.com/AlexCyclone/spring-cloud-gateway)
* parking-user-service [`user-service:0.0.1-SNAPSHOT`](https://github.com/AlexCyclone/parking-user-service)
* parking-booking-service [`booking-service:0.0.1-SNAPSHOT`](https://github.com/AlexCyclone/parking-booking-service)
