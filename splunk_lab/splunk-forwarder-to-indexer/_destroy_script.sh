#!/usr/bin/env bash
kubectl delete all -l tier=splunk

# Delete config maps
rm -rf ./forwarder/splunk-forwarder-config-map.yaml
rm -rf ./indexer/splunk-indexer-config-map.yaml
kubectl delete configmap splunk-forwarder-config
kubectl delete configmap splunk-indexer-config


sleep 5
cd ./indexer/setup-with-vagrant && vagrant destroy --force
