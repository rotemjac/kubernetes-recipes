#!/usr/bin/env bash

sudo apt-get update
sudo dpkg -i ${DEB_PATH}


# Start Splunk
sudo ${SPLUNK_BIN} start --accept-license --answer-yes --no-prompt --seed-passwd ${SPLUNK_PASSWORD}