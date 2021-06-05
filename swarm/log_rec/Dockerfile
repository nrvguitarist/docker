FROM docker.elastic.co/logstash/logstash:7.13.1
RUN rm -f /usr/share/logstash/pipeline/logstash-sample.conf
ADD config/ /usr/share/logstash/config/
