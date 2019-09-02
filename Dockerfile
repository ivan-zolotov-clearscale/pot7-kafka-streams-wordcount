FROM maven:3.6.0-jdk-8-alpine

COPY run.sh .
COPY target/kafka-streams-wordcount.jar .
COPY kafka.client.truststore.jks .

RUN apk add jq

RUN chmod 777 run.sh

ENTRYPOINT ./run.sh