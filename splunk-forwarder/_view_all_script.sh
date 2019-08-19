#!/usr/bin/env bash

kubectl get all --namespace=splunk-forwarder-standalone-ns

echo "----------------------------------------"
echo "Config maps:"
kubectl get configmaps --namespace=splunk-forwarder-standalone-ns
echo "----------------------------------------"
echo "Secrets:"
kubectl get secrets    --namespace=splunk-forwarder-standalone-ns
