#!/bin/bash

CLIENT_HOME=/opt/client

if [ -f "${CLIENT_HOME}/data/init.sql" ];then
  ${FLINK_HOME}/bin/sql-client.sh embedded -d ${FLINK_HOME}/conf/sql-client-defaults.yaml  -i ${CLIENT_HOME}/data/init.sql -l ${FLINK_HOME}/opt/addons ${@}
else
  ${FLINK_HOME}/bin/sql-client.sh embedded -d ${FLINK_HOME}/conf/sql-client-defaults.yaml -l ${FLINK_HOME}/opt/addons ${@}
fi
