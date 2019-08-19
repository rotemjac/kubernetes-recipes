#!/usr/bin/env bash

# pods, replication controllers, deployments and services
kubectl get all        --namespace=logs-ns

# configmaps , secrets and volume claims
echo "----------------------------------------"
echo "Config maps:"
kubectl get configmaps --namespace=logs-ns
echo "----------------------------------------"
echo "Secrets:"
#kubectl get secrets    --namespace=logs-ns
echo "----------------------------------------"
echo "Volume claims:"
kubectl get pvc        --namespace=logs-ns


#syslog-client-server/_view_all_script.sh
#splunk-forwarder-to-indexer/_view_all_script.sh
#kubectl get pvc -l tier=logs app=logs-app