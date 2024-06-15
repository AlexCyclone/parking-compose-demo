# Parking Service Demo
The repository contains scripts and a Docker Compose file for the demo deployment of a Parking service.

## Project Description
    
In this project, the [author](https://github.com/AlexCyclone) designed a scalable and extensible microservices system 
based on Spring Cloud infrastructure, using popular microservices patterns.

### Overview
<div align="center"><b>System Landscape</b></div>
<br>

![landscape](https://github.com/AlexCyclone/parking-compose-demo/blob/main/raw/landscape.png)

At the MVP stage, the system consists of 2 microservices:

- **user-service**: [GitHub link](https://github.com/AlexCyclone/parking-user-service)
- **booking-service**: [GitHub link](https://github.com/AlexCyclone/parking-booking-service)

#### Responsibilities of Microservices:

| Task                                | Service           | Data Storage                                           |
|-------------------------------------|-------------------|--------------------------------------------------------|
| Authentication                      | user-service      | PostgreSQL (1)                                         |
| Storing user information            | user-service      | PostgreSQL (1)                                         |
| Storing vehicle information         | user-service      | PostgreSQL (1) (text data), S3 (LOB, Images)           |
| Storing parking information         | booking-service   | Configuration properties                               |
| Storing parking spot occupancy info | booking-service   | PostgreSQL (2)                                         |

**Data Storage Pattern:**

The system adopts the **Database per Service pattern**, ensuring independence and autonomy of services.

**Access and Infrastructure:**

Services are accessed through an **API Gateway** implemented using Spring Cloud Gateway. 
**Service discovery** is managed via Eureka Server, ensuring high availability and **server-side load balancing**.


**Future Development Plans:**

The structure of individual services supports future functionality expansion. 
Subsequent development stages may involve further partitioning of these microservices based on revised non-functional requirements.

1. **Deployment Optimization**: Transition to Kubernetes or AWS for improved scalability and manageability.
   
2. **Distributed Logging**: Implement distributed logging using technologies such as Spring Cloud Sleuth and ELK Stack 
to centralize logs and enable better monitoring and troubleshooting capabilities.

3. **Externalized Configuration**: Integrate externalized configuration using Spring Cloud Config 
to manage application settings dynamically across environments.

These enhancements aim to further enhance the system's scalability, monitoring capabilities, 
and operational efficiency in future stages of development.

### Component diagram (Operation Modes)
    
The implemented system can operate in several modes:
1. *Standalone ([`standalone.sh`](https://github.com/AlexCyclone/parking-compose-demo/blob/main/standalone.sh))*
2. *REST ([`rest.sh`](https://github.com/AlexCyclone/parking-compose-demo/blob/main/rest.sh))*
3. *Kafka ([`kafka.sh`](https://github.com/AlexCyclone/parking-compose-demo/blob/main/kafka.sh))*
    
Each mode employs different architectural approaches to microservices interaction, reflecting the stages of system expansion. 
The ability to change architectural approaches through microservices configurations 
demonstrates the flexibility of Spring Boot applications.

<div align="center"><b>Standalone</b></div>
<br>

![standalone](https://github.com/AlexCyclone/parking-compose-demo/blob/main/raw/standalone.png)

In this mode, each microservice operates independently. 
Access to the system is through an API Gateway, 
reflecting the core principle of microservices design - maximum independence and flexibility.

<div align="center"><b>REST API communication</b></div>
<br>

![rest](https://github.com/AlexCyclone/parking-compose-demo/blob/main/raw/rest.png)

In this mode, microservices communicate via synchronous API requests. 

This approach is simple to implement and widely used but may lead to intermingling of logic between services and loss of independence.

<div align="center"><b>Kafka messaging</b></div>
<br>

![kafka](https://github.com/AlexCyclone/parking-compose-demo/blob/main/raw/kafka.png)

In this mode, synchronous communication between services is replaced by event publication and consumption via Kafka, 
marking a logical shift towards Event-Driven Architecture. 

This approach enables services to maintain independence 
while effectively scaling the system's business logic according to new functional requirements. 

One drawback of this approach is the overhead costs associated with infrastructure maintenance. 

Depending on the complexity of business processes, this approach may also introduce complexities in system logic, 
potentially requiring **distributed transactions** management using patterns such as **SAGA** in orchestration or choreography modes. 
This places higher demands on developers and operations teams.

### Docker Compose images
* **parking-user-service:** [`user-service:0.0.1-SNAPSHOT`](https://github.com/AlexCyclone/parking-user-service)
* **parking-booking-service:** [`booking-service:0.0.1-SNAPSHOT`](https://github.com/AlexCyclone/parking-booking-service)
* eureka-server: [`eureka-server:0.0.1-SNAPSHOT`](https://github.com/AlexCyclone/eureka-server)
* spring-cloud-gateway: [`cloud-gateway:0.0.1-SNAPSHOT'`](https://github.com/AlexCyclone/spring-cloud-gateway)
* _postgres:_ [`postgres:16.3-alpine`](https://hub.docker.com/_/postgres)
* _zookeeper:_ [`confluentinc/cp-zookeeper:7.6.1`](https://hub.docker.com/r/confluentinc/cp-zookeeper)
* _kafka:_ [`confluentinc/cp-kafka:7.6.1`](https://hub.docker.com/r/confluentinc/cp-kafka)
