FROM flink:1.13-java8
MAINTAINER Nick Fan "nickfan81@gmail.com"

SHELL ["/bin/bash", "-c"]

## install python3 and pip3
#RUN apt-get update -y && apt-get install -y python3 python3-pip python3-dev && rm -rf /var/lib/apt/lists/*
#RUN ln -s /usr/bin/python3 /usr/bin/python
## install Python Flink
#RUN python -m pip install --upgrade pip && python -m pip install apache-flink==1.13.3

RUN mkdir -p /opt/{flink_addon_libs,sql-client/{bin,lib,conf,opt}}
ENV SQL_CLIENT_HOME /opt/sql-client
RUN /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-connector-jdbc_2.12/1.13.3/flink-connector-jdbc_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-mysql-cdc/1.4.0/flink-sql-connector-mysql-cdc-1.4.0.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.24/postgresql-42.2.24.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-postgres-cdc/1.4.0/flink-sql-connector-postgres-cdc-1.4.0.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-connector-kafka_2.12/1.13.3/flink-connector-kafka_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.12/1.13.3/flink-sql-connector-kafka_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/2.5.1/kafka-clients-2.5.1.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-connector-elasticsearch7_2.12/1.13.3/flink-connector-elasticsearch7_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-elasticsearch7_2.12/1.13.3/flink-sql-connector-elasticsearch7_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-connector-rabbitmq_2.12/1.13.3/flink-connector-rabbitmq_2.12-1.13.3.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/com/rabbitmq/amqp-client/5.9.0/amqp-client-5.9.0.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-connector-redis_2.11/1.1.5/flink-connector-redis_2.11-1.1.5.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/com/alibaba/ververica/flink-format-changelog-json/1.4.0/flink-format-changelog-json-1.4.0.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-connector-filesystem_2.12/1.11.4/flink-connector-filesystem_2.12-1.11.4.jar && \
    /usr/bin/wget -P /opt/flink_addon_libs https://repo1.maven.org/maven2/org/apache/flink/flink-connector-files/1.13.3/flink-connector-files-1.13.3.jar

COPY sql-client/bin/* /opt/sql-client/bin/
COPY sql-client/conf/* /opt/sql-client/conf/

RUN chmod +x /opt/sql-client/bin/*.sh && ln -nfs /opt/flink_addon_libs/*.jar /opt/flink/lib/ && ln -nfs /opt/flink_addon_libs/*.jar /opt/sql-client/lib/
