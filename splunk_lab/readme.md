


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




            echo "NOTICE - You have to download the Splunk enterprise package from https://www.splunk.com/en_us/download/sem.html."
            echo "Place it instead of this file: splunk-forwarder-to-indexer/indexer/setup-with-vagrant/lib/ADD_splunk-7.3.1-bd63e13aa157-linux-2.6-amd64.deb_IN_HERE"
            
            
            For example if you want to save time and import the boxes locally on each "vagrant up" browse to:
            https://app.vagrantup.com/ubuntu/boxes/
            And select the version and the provider - in our case: bionic64. No check the Url, After chossing the provider and version you should add the postfix like the link below in order to download the box: 
            https://app.vagrantup.com/ubuntu/boxes/bionic64/versions/20190814.0.0/providers/virtualbox.box
            
            Then save it in you filesystem and add it as a box_url.