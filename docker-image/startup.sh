#!/bin/bash

echo "Elasticsearch"
nohup elasticsearch > elastic.stdout.log &
echo "   Waiting for it to Start ..."
sleep 40s
echo "Logstash"
nohup /usr/share/logstash/bin/logstash --path.settings ~/config/ > logstash.stdout.log &
echo "   Waiting for it to Start ..."
sleep 40s
echo "Kibana"
nohup /usr/share/kibana/bin/kibana -c ~/config/kibana.yml > kibana.stdout.log &
echo "   Waiting for it to Start ..."
sleep 20s
echo "Node-RED"
nohup ~/node_modules/.bin/node-red --settings ~/node_modules/node-red/settings.js  flows_se-project.json > node-red.stdout.log &
echo "   Waiting for it to Start ..."
sleep 10s
echo "Ready to go. Enjoy :)"

/bin/bash
#read -rsp $'Press escape (ESC) to stop this docker container\n' -d $'\e'
