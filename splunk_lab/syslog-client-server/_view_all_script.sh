#!/usr/bin/env bash

kubectl get all -l tier=syslog

kubectl logs -l tier=splunk