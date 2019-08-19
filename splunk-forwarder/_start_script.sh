#!/usr/bin/env bash

NAMESPACE_NAME=splunk-forwarder-standalone-ns

echo "------------------------------------------------------------------------------------------"
echo "Please notice that all resources are created inside the $NAMESPACE_NAME namespace."
sleep 2
echo "So DO NOT forget to add '--namespace=$NAMESPACE_NAME' to all your queries."
sleep 2
echo "Please consider also using './_view_all_script' and './_destroy_script'."
echo "-----------------------------------------------------------------------------------------"
sleep 2
echo "Let's continue...(: "
echo "-----------------------------------------------------------------------------------------"

echo "Please insert a password for Splunk forwarder (at least 8 characters)..."

read PASSWORD

#0. Create namespace - If not created
kubectl apply -f $NAMESPACE_NAME.yaml

#1. Only if you need to change something - Create config map yaml
CONFIG_NAME=splunk-forwarder-config
CONFIG_PATH=./config/default.yml
kubectl create configmap $CONFIG_NAME --from-file=$CONFIG_PATH --namespace=$NAMESPACE_NAME #--output yaml | tee $CONFIG_NAME-map.yaml

#2. Create secret
SECRET_NAME=splunk-forwarder-secret
kubectl create secret generic $SECRET_NAME --from-literal=password=$PASSWORD  --namespace=$NAMESPACE_NAME

#3. Bring up pods, deployments, services, configmaps ...
kubectl apply -f forwarder.yaml --namespace=$NAMESPACE_NAME