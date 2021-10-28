FROM flink:1.13-java8
MAINTAINER Nick Fan "nickfan81@gmail.com"

RUN /usr/bin/curl -L -k -o /opt/flink/lib/flink-connector-jdbc_2.12-1.13.3.jar https://repo1.maven.org/maven2/org/apache/flink/flink-connector-jdbc_2.12/1.13.3/flink-connector-jdbc_2.12-1.13.3.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/mysql-connector-java-8.0.27.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.27/mysql-connector-java-8.0.27.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-sql-connector-mysql-cdc-1.4.0.jar https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-mysql-cdc/1.4.0/flink-sql-connector-mysql-cdc-1.4.0.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-sql-connector-postgres-cdc-1.4.0.jar https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-postgres-cdc/1.4.0/flink-sql-connector-postgres-cdc-1.4.0.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-connector-kafka_2.12-1.13.3.jar https://repo1.maven.org/maven2/org/apache/flink/flink-connector-kafka_2.12/1.13.3/flink-connector-kafka_2.12-1.13.3.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-sql-connector-kafka_2.12-1.13.3.jar https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-kafka_2.12/1.13.3/flink-sql-connector-kafka_2.12-1.13.3.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/kafka-clients-2.5.1.jar https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/2.5.1/kafka-clients-2.5.1.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-connector-elasticsearch7_2.12-1.13.3.jar https://repo1.maven.org/maven2/org/apache/flink/flink-connector-elasticsearch7_2.12/1.13.3/flink-connector-elasticsearch7_2.12-1.13.3.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-sql-connector-elasticsearch7_2.12-1.13.3.jar https://repo1.maven.org/maven2/org/apache/flink/flink-sql-connector-elasticsearch7_2.12/1.13.3/flink-sql-connector-elasticsearch7_2.12-1.13.3.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-connector-rabbitmq_2.12-1.13.3.jar https://repo1.maven.org/maven2/org/apache/flink/flink-connector-rabbitmq_2.12/1.13.3/flink-connector-rabbitmq_2.12-1.13.3.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/amqp-client-5.9.0.jar https://repo1.maven.org/maven2/com/rabbitmq/amqp-client/5.9.0/amqp-client-5.9.0.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-format-changelog-json-1.4.0.jar https://repo1.maven.org/maven2/com/alibaba/ververica/flink-format-changelog-json/1.4.0/flink-format-changelog-json-1.4.0.jar && \
    /usr/bin/curl -L -k -o /opt/flink/lib/flink-connector-files-1.13.3.jar https://repo1.maven.org/maven2/org/apache/flink/flink-connector-files/1.13.3/flink-connector-files-1.13.3.jar \
