#!/usr/bin/env bash


# Delete all resources from namespace
kubectl -n logs-ns delete po,rc,deployments,svc,pv,pvc,configmap --all

# Delete namespace
kubectl delete ns logs-ns


# If you want also to remove image
#docker rmi basic-syslog-service