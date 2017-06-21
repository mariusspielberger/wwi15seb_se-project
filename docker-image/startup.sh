#!/bin/bash

echo "Elasticsearch"
nohup elasticsearch > elastic.stdout.log &
echo "   Waiting for it to Start ..."
sleep 1m
echo "Logstash"
nohup /usr/share/logstash/bin/logstash --path.settings ~/config/ > logstash.stdout.log &
echo "   Waiting for it to Start ..."
sleep 1m
echo "Kibana"
nohup /usr/share/kibana/bin/kibana -c ~/config/kibana.yml > kibana.stdout.log &
echo "   Waiting for it to Start ..."
sleep 20s
echo "Node-RED"
nohup ~/node_modules/.bin/node-red > node-red.stdout.log &
echo "   Waiting for it to Start ..."
sleep 10s
echo "Ready to go. Enjoy :)"
