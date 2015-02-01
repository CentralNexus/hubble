FROM java:7-jre

RUN mkdir /app
WORKDIR /app

# Download version 1.4.2 of logstash
RUN cd /tmp && \
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
    tar -xzvf ./logstash-1.4.2.tar.gz && \
    mv ./logstash-1.4.2/* /app && \
    rm ./logstash-1.4.2.tar.gz

RUN /app/bin/plugin install contrib

ADD kibana.conf /app/vendor/kibana/config.js

VOLUME /app/log
VOLUME /app/conf.d