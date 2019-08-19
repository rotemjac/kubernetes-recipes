#!/usr/bin/env bash
kubectl delete all -l tier=splunk --namespace=splunk-forwarder-standalone-ns

# Delete config maps
rm -rf ./forwarder/splunk-forwarder-config-map.yaml
kubectl delete configmap --all --namespace=splunk-forwarder-standalone-ns

# Delete secrets
kubectl delete secrets   --all --namespace=splunk-forwarder-standalone-ns
