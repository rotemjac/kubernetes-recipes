#!/usr/bin/env bash

kubectl get all -l tier=splunk --namespace=$NAMESPACE_NAME


#Execute this TWICE (in the first time you might not see all logs)
#kubectl logs -l tier=splunk--all-containers=true --namespace=$NAMESPACE_NAME