#start with elastic as base
FROM docker-base-image

USER root

ADD config/elasticsearch.yml /usr/share/elasticsearch/config
ADD config/logstash.yml /usr/share/elasticsearch/config/
ADD config/kibana.yml /usr/share/elasticsearch/config/
ADD config/logstash-twitter.conf /usr/share/elasticsearch/pipeline/

#copy startup script
ADD startup.sh /usr/share/elasticsearch/

RUN chown --recursive elasticsearch:elasticsearch /usr/share/elasticsearch/config/ /usr/share/elasticsearch/pipeline/
RUN chmod 0777 startup.sh

EXPOSE 9500 9600 9200

USER elasticsearch

CMD startup.sh