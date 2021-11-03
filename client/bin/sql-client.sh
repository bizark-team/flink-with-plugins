#!/bin/bash

${FLINK_HOME}/bin/sql-client.sh embedded -d ${FLINK_HOME}/conf/sql-client-defaults.yaml -l /opt/flink_lib ${@}
