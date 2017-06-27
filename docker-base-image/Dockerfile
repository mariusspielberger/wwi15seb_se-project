#start with elastic as base
FROM docker.elastic.co/elasticsearch/elasticsearch:5.4.1

USER root

RUN printf "123\n123" | passwd root

#copy configs
ADD kibana.repo /etc/yum.repos.d/

RUN rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
RUN echo y | yum install logstash kibana fontconfig freetype fontpackages-filesystem

RUN cd ~ && curl -sLO https://nodejs.org/dist/v6.11.0/node-v6.11.0-linux-x64.tar.xz && tar xf node-v6.11.0-linux-x64.tar.xz && mv node-v6.11.0-linux-x64 /usr/share/node && rm node-v6.11.0-linux-x64.tar.xz

RUN chown --recursive elasticsearch:elasticsearch /usr/share/kibana/ /var/lib/kibana/ /usr/share/logstash/ /usr/share/node

RUN ln -s /usr/share/node/bin/node /usr/bin/node
RUN ln -s /usr/share/node/bin/npm /usr/bin/npm
RUN chmod 0777 /usr/bin/node /usr/bin/npm

RUN npm install node-red

ADD settings.js /usr/share/elasticsearch/node_modules/node-red/
RUN chown elasticsearch: /usr/share/elasticsearch/node_modules/node-red/settings.js

RUN cd /usr/share/elasticsearch/node_modules/node-red
RUN npm install node-red-node-geohash

EXPOSE 1880

USER elasticsearch

CMD /bin/bash
