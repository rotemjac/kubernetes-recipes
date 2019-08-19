index="syslog-index"





-------------------------
If you're choosing to deploy the indexer inside your kubernetes cluster (and not with vagrant)
Please consider to allocate enough resources on your cluster.
For example in a minikube cluster - go to ~/.minikube/config/config.json and edit to:
{
    "cpus": 2,
    "dashboard": true,
    "memory": 4096
}

Or via CLI:
minikube config set memory 4096
minikube config set cpus 2

And as a one liner:
minikube --memory 4096 --cpus 2 start
---------------------------