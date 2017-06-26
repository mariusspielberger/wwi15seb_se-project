#start with elastic as base
FROM mariusspielberger/se-project:latest

USER root

ADD config/elasticsearch.yml /usr/share/elasticsearch/config
ADD config/logstash.yml /usr/share/elasticsearch/config/
ADD config/kibana.yml /usr/share/elasticsearch/config/
ADD config/log4j.properties /usr/share/elasticsearch/config/
ADD config/jvm.options /usr/share/elasticsearch/config/
ADD config/logstash-twitter.conf /usr/share/elasticsearch/pipeline/
RUN mkdir /usr/share/elasticsearch/.node-red
ADD config/flows_se-project.json /usr/share/elasticsearch/.node-red
RUN chown elasticsearch: /usr/share/elasticsearch/.node-red/

#copy startup script
ADD startup.sh /usr/share/elasticsearch/

RUN chown --recursive elasticsearch:elasticsearch /usr/share/elasticsearch/config/ /usr/share/elasticsearch/pipeline/
RUN chmod 0777 startup.sh

EXPOSE 9500 9600 9200 5601 1880

USER elasticsearch

CMD ["/bin/bash", "/usr/share/elasticsearch/startup.sh"]
