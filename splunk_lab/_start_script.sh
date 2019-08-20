#!/usr/bin/env bash

source _export_colors.sh

NAMESPACE_NAME=logs-ns


#0. Create namespace - If not created
kubectl apply -f logs-namespace.yaml

echo -e "${Light_Purple}"
echo "------------------------------------------------------------------------------------------"
echo "Please notice that all resources are created inside the $NAMESPACE_NAME namespace."
sleep 2
echo -e "So DO NOT forget to add '--namespace=$NAMESPACE_NAME' to all your queries."
sleep 2
echo "Please consider also using './_view_all_script' and './_destroy_script'."
echo "-----------------------------------------------------------------------------------------"
sleep 2
echo -e "${Green}"
echo "-----------------------------------------------------------------------------------------"
echo "Let's continue...(: "
echo "-----------------------------------------------------------------------------------------"
echo -e "${NC}"

#1. Create logs volume
kubectl apply -f shared-volumes/logs_volume_claim.yaml --namespace=$NAMESPACE_NAME
sleep 2

#2. Create syslog client and collector resources
cd syslog-client-server && ./_start_script.sh && cd ..

#3. Create Splunk forwarder and indexer resources
cd splunk-forwarder-to-indexer && ./_start_script.sh




