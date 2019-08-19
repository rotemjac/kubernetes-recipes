#!/usr/bin/env bash

kubectl delete deployments -l app=nginx-nodejs-app
sleep 2
kubectl delete replicasets -l app=nginx-nodejs-app
sleep 2
kubectl delete pods        -l app=nginx-nodejs-app
sleep 2
kubectl delete services    -l app=nginx-nodejs-app
