#!/bin/bash -e

##Move datadog files
mv /home/ubuntu/scripts/conf.yaml /etc/datadog-agent/conf.d/consul.d/
mv /home/ubuntu/scripts/datadog.yaml /etc/datadog-agent/

##Move Consul Config that hooks up to datadog
mv /home/ubuntu/scripts/telemetry.json /opt/consul/config/
chown consul:consul /opt/consul/config/telemetry.json

## Let everyone own their stuff now
chown dd-agent:dd-agent /etc/datadog-agent/conf.d/consul.d/conf.yaml
chown dd-agent:dd-agent /etc/datadog-agent/datadog.yaml
chown consul:consul /opt/consul/config/telemetry.json

## Put the key in the datadog.yaml
sed -i "s/api_key:.*/api_key: ${DD_API_KEY}/" /etc/datadog-agent/datadog.yaml