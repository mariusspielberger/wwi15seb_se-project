#start with elastic as base
FROM docker.elastic.co/elasticsearch/elasticsearch:5.4.1

USER root

RUN echo 123 | passwd root

#copy configs
ADD kibana.repo /etc/yum.repos.d/

RUN rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
RUN echo y | yum install logstash kibana fontconfig freetype fontpackages-filesystem

USER elasticsearch