#!/bin/bash

echo $AWS_CONTAINER_CREDENTIALS_RELATIVE_URI
CREDS_JSON=`curl 169.254.170.2$AWS_CONTAINER_CREDENTIALS_RELATIVE_URI`
export AWS_ACCESS_KEY_ID=`echo $CREDS_JSON | jq -r .AccessKeyId`
export AWS_SECRET_ACCESS_KEY=`echo $CREDS_JSON | jq -r .SecretAccessKey`
export AWS_SESSION_TOKEN=`echo $CREDS_JSON | jq -r .Token`
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY
echo $AWS_SESSION_TOKEN

java -cp kafka-streams-wordcount.jar net.clearscale.kafka.WordCountApplication