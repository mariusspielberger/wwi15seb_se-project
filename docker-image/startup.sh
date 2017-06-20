#!/bin/bash

nohup elasticsearch > elastic.stdout.log &
sleep 1m
nohup /usr/share/logstash/bin/logstash --path.settings ~/config/ > logstash.stdout.log &
sleep 1m
nohup /usr/share/kibana/bin/kibana -c ~/config/kibana.yml > kibana.stdout.log &