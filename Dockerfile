FROM quay.io/pires/docker-elasticsearch:1.7.1-2

MAINTAINER pjpires@gmail.com

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/plugin -i io.fabric8/elasticsearch-cloud-kubernetes/1.3.0 --verbose
RUN /elasticsearch/bin/plugin -i elasticsearch/elasticsearch-mapper-attachments/2.7.1 --verbose
#RUN /elasticsearch/bin/plugin -i elasticsearch/marvel/latest --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Copy run script
COPY run.sh /

RUN chmod +x /run.sh
