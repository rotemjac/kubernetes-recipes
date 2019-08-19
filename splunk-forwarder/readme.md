
Start with: 
./_start_script

After service is up - Get container Id from:
kubectl describe pod --namespace=splunk-forwarder-standalone-ns

Will appear as: 
Container ID:   docker://<The-container-ID>

And check splunk status with:
docker exec -u root <containerID>  /opt/splunk/bin/splunk status


-----------
Debug with: 
./_view_all_script

Please notice that all resources are created under namespace of 'splunk-forwarder-standalone-ns'
so don't forget to append --namespace=splunk-forwarder-standalone-ns as a postfix to all queries (get, describe, logs etc')


------------
Clear resources with: 
./_start_script