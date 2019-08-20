#!/usr/bin/env bash

NAMESPACE_NAME=logs-ns

#1. Create config map yaml
FORWARDER_NAME=splunk-forwarder-config
FORWARDER_PATH=./forwarder/config/default.yml
kubectl create configmap $FORWARDER_NAME --from-file=$FORWARDER_PATH --namespace=$NAMESPACE_NAME # --output yaml | tee ./forwarder/$FORWARDER_NAME-map.yaml

#2. Create secret
echo -e "${Light_Blue}"
echo "------------------------------------------------------------------------------------------"
echo "Please insert a password for both Splunk forwarder and indexer (at least 8 characters):"
echo "-----------------------------------------------------------------------------------------"
ok=0
while [ $ok = 0 ]
do
read PASSWORD
  if [ ${#PASSWORD} -lt 8 ]
  then
    echo "Password need to be at least 8 characters..."
  else
    ok=1
  fi
done


SECRET_NAME=splunk-secret
kubectl create secret generic $SECRET_NAME --from-literal=password=$PASSWORD  --namespace=$NAMESPACE_NAME


#3. Decide if and how to setup the indexer
echo "----------------------------------------"
echo "Where do you want the Splunk indexer?"
echo "----------------------------------------"
echo "1) Inside the Kube cluster"
echo "2) In a separate VM (requires Vagrant)"

read INDEXER_SETUP
if [ $INDEXER_SETUP -eq 1 ]
    then
      echo -e "${Light_Red}"
      echo "----------------------------------------"
      echo "You have chosen to run Splunk indexer inside the cluster"
      echo "please consider to upgrade cluster resources - see the readme.md."
      echo "----------------------------------------"

      INDEXER_NAME=splunk-indexer-config
      INDEXER_PATH=./indexer/setup-on-kube
      INDEXER__CONFIG_PATH=./indexer/config/default.yml

      kubectl create configmap $INDEXER_NAME   --from-file=$INDEXER__CONFIG_PATH   --namespace=logs-ns # --output yaml | tee $INDEXER_PATH/$INDEXER_NAME-map.yaml
      kubectl apply -f $INDEXER_PATH   --namespace=logs-ns

      echo -e "${Green}"
      echo "Please open your browser at http://<Node-IP>:31234 to view the logs on the Splunk Indexer"

    else
      echo "-----------------------------------------------"
      echo "Vagrant machine - IP configuration"
      echo "-----------------------------------------------"

      INDEXER_IP="192.168.99.108"

      echo "As first step - uncomment the 'hostAliases' field in the forwarder/forwarder.yaml file"
      sleep 3
      echo "Are you using minikube?"
      echo "1) Yes."
      echo "2) No."
      read USING_MINIKUBE
      if [ $USING_MINIKUBE -eq 1 ]
      then
            echo "The IP is already set UP (192.168.99.108) for based on the minikube gateway (192.168.99.1/24)"
      else
            echo "Please change the ip address under the 'hostAliases' field in the forwarder/forwarder.yaml file"
            echo "The IP need to be inside the broadcast domain of your K8s cluster on your host."
            echo "Please paste the IP here:"
            read INDEXER_IP
      fi

      #Change relevant setting in forwarder
      #sed "s/{{192.10.10.10}}/$INDEXER_IP/g" ./forwarder/forwarder.yaml
      #sed "s/{{splunk-indexer-remove-postfix}}/splunk-indexer/g" ./forwarder/forwarder.yaml

      cd indexer/setup-with-vagrant && vagrant --indexer-ip=$INDEXER_IP --password=$PASSWORD up && cd -
      echo -e "${Green}"
      echo "Please open your browser at http://$INDEXER_IP:8000 to view the logs on the Splunk Indexer"
fi

#4. Bring up pods, deployments, services, configmaps ...
kubectl apply -f forwarder --namespace=$NAMESPACE_NAME

echo -e "${NC}"