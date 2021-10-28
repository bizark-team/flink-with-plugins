FROM flink:1.13-java8
MAINTAINER Nick Fan "nickfan81@gmail.com"

RUN /usr/bin/curl -L -k -o /tmp/flink-sql-connector-mysql-cdc-1.4.0.jar https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-mysql-cdc/1.4.0/flink-sql-connector-mysql-cdc-1.4.0.jar && \
    /usr/bin/curl -L -k -o /tmp/flink-sql-connector-postgres-cdc-1.4.0.jar https://repo1.maven.org/maven2/com/alibaba/ververica/flink-sql-connector-postgres-cdc/1.4.0/flink-sql-connector-postgres-cdc-1.4.0.jar && \
    /usr/bin/curl -L -k -o /tmp/flink-format-changelog-json-1.4.0.jar https://repo1.maven.org/maven2/com/alibaba/ververica/flink-format-changelog-json/1.4.0/flink-format-changelog-json-1.4.0.jar && \
    /usr/bin/curl -L -k -o /tmp/flink-sql-connector-elasticsearch7_2.12-1.13.3.jar https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-elasticsearch7_2.12/1.13.3/flink-sql-connector-elasticsearch7_2.12-1.13.3.jar && \
    mv /tmp/flink-sql-connector-mysql-cdc-1.4.0.jar /opt/flink/lib/ && \
    mv /tmp/flink-sql-connector-postgres-cdc-1.4.0.jar /opt/flink/lib/ && \
    mv /tmp/flink-format-changelog-json-1.4.0.jar /opt/flink/lib/ && \
    mv /tmp/flink-sql-connector-elasticsearch7_2.12-1.13.3.jar /opt/flink/lib/ \

