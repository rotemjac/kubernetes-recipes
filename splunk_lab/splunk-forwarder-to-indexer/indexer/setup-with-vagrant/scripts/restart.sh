#!/usr/bin/env bash

status=`sudo ${SPLUNK_BIN} status`
echo "Splunk status is: $status"
if [ "$status" == "splunkd is not running." ]; then
    sudo ${SPLUNK_BIN} start --accept-license
fi