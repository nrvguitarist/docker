FROM docker.elastic.co/beats/filebeat:7.13.1
COPY filebeat.yml /usr/share/filebeat/filebeat.yml
COPY modules.d/ /usr/share/filebeat/modules.d/
USER root
RUN chown root:filebeat /usr/share/filebeat/filebeat.yml
RUN chown -R root:filebeat /usr/share/filebeat/modules.d/
RUN sed -i 's/protocol.udp/protocol.tcp/g' /usr/share/filebeat/module/panw/panos/config/input.yml
RUN yum -y install tcpdump
USER filebeat
