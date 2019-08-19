#!/usr/bin/env bash
kubectl delete all -l tier=syslog

# Delete config maps + the generated yaml file
rm -rf ./client/syslog-client-config-map.yaml
rm -rf ./collector/syslog-collector-config-map.yaml
kubectl delete configmap syslog-collector-config
kubectl delete configmap syslog-client-config