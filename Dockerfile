FROM flink:1.13-java8
MAINTAINER Nick Fan "nickfan81@gmail.com"

SHELL ["/bin/bash", "-c"]

## install python3 and pip3
#RUN apt-get update -y && apt-get install -y python3 python3-pip python3-dev && rm -rf /var/lib/apt/lists/*
#RUN ln -s /usr/bin/python3 /usr/bin/python
## install Python Flink
#RUN python -m pip install --upgrade pip && python -m pip install apache-flink==1.13.3

RUN mkdir -p /opt/{flink_lib,client/{bin,conf}}
ENV CLIENT_HOME /opt/sql-client
RUN /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-files/1.13.3/flink-connector-files-1.13.3.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/com/alibaba/ververica/flink-format-changelog-json/1.4.0/flink-format-changelog-json-1.4.0.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/com/ververica/flink-format-changelog-json/2.0.2/flink-format-changelog-json-2.0.2.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-hive-3.1.2_2.12/1.13.3/flink-sql-connector-hive-3.1.2_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-jdbc_2.12/1.13.3/flink-connector-jdbc_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-mysql-cdc/1.4.0/flink-sql-connector-mysql-cdc-1.4.0.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/com/ververica/flink-sql-connector-mysql-cdc/2.0.2/flink-sql-connector-mysql-cdc-2.0.2.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-postgres-cdc/1.4.0/flink-sql-connector-postgres-cdc-1.4.0.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/com/ververica/flink-sql-connector-postgres-cdc/2.0.2/flink-sql-connector-postgres-cdc-2.0.2.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-kafka_2.12/1.13.3/flink-connector-kafka_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.12/1.13.3/flink-sql-connector-kafka_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/2.5.1/kafka-clients-2.5.1.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-elasticsearch7_2.12/1.13.3/flink-sql-connector-elasticsearch7_2.12-1.13.3.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-elasticsearch7_2.12/1.13.3/flink-connector-elasticsearch7_2.12-1.13.3.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/elasticsearch/client/elasticsearch-rest-high-level-client/7.5.1/elasticsearch-rest-high-level-client-7.5.1.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/elasticsearch/client/elasticsearch-rest-client/7.5.1/elasticsearch-rest-client-7.5.1.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/elasticsearch/elasticsearch-x-content/7.5.1/elasticsearch-x-content-7.5.1.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/commons-codec/commons-codec/1.11/commons-codec-1.11.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/httpcomponents/httpclient/4.5.10/httpclient-4.5.10.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/httpcomponents/httpcore/4.4.12/httpcore-4.4.12.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/httpcomponents/httpasyncclient/4.1.4/httpasyncclient-4.1.4.jar && \
#    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/httpcomponents/httpcore-nio/4.4.12/httpcore-nio-4.4.12.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-rabbitmq_2.12/1.13.3/flink-connector-rabbitmq_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/com/rabbitmq/amqp-client/5.9.0/amqp-client-5.9.0.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-redis_2.11/1.1.5/flink-connector-redis_2.11-1.1.5.jar && \
    /usr/bin/wget -P /opt/flink/lib https://repo1.maven.org/maven2/org/apache/flink/flink-connector-filesystem_2.12/1.11.4/flink-connector-filesystem_2.12-1.11.4.jar

COPY client/bin/* /opt/client/bin/
COPY client/conf/* /opt/flink/conf/

RUN chmod +x /opt/client/bin/*.sh

