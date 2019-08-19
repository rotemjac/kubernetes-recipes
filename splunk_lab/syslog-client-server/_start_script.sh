#!/usr/bin/env bash

docker build -t basic-syslog-service ./images/

CLIENT_NAME=syslog-client-config
CLIENT_PATH=./client/syslog-ng.conf
COLLECTOR_NAME=syslog-collector-config
COLLECTOR_PATH=./collector/syslog-ng.conf


#1. Create config maps again
kubectl create configmap $CLIENT_NAME    --from-file=$CLIENT_PATH    --namespace=logs-ns --output yaml | tee ./client/$CLIENT_NAME-map.yaml
kubectl create configmap $COLLECTOR_NAME --from-file=$COLLECTOR_PATH --namespace=logs-ns --output yaml | tee ./collector/$COLLECTOR_NAME-map.yaml


#2. Bring up pods, deployments, services...
kubectl apply -f ./client/    --namespace=logs-ns
kubectl apply -f ./collector/ --namespace=logs-ns
