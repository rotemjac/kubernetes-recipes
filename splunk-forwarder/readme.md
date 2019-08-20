
Start with: <br/>
```./_start_script```

After service is up - Get container Id from:
``` kubectl describe pod --namespace=splunk-forwarder-standalone-ns ```


Will appear as: <br/>
```Container ID:   docker://<The-container-ID>```
<br/>

And check splunk status with: <br/>
```docker exec -u root <containerID>  /opt/splunk/bin/splunk status```
<br/>

-----------
Debug with: <br/>
```./_view_all_script```

Please notice that all resources are created under namespace of ```splunk-forwarder-standalone-ns```
so don't forget to append ``` --namespace=splunk-forwarder-standalone-ns``` as a postfix to all queries (get, describe, logs etc').

<br/>

------------

Clear resources with: <br/>
```./_destroy_script```
