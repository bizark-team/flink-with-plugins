#!/bin/bash

${FLINK_HOME}/bin/sql-client.sh embedded -d ${SQL_CLIENT_HOME}/conf/sql-client-conf.yaml -l /opt/flink_lib
