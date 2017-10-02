#!/bin/bash

RUN_DIR=/var/vcap/sys/run/neo4j

export JAVA_HOME=/var/vcap/packages/openjdk_1.8.0/jre
export NEO4J_HOME=/var/vcap/packages/neo4j
export NEO4J_PIDFILE=${RUN_DIR}/pid
export NEO4J_LOGS=/var/vcap/sys/log/neo4j
export NEO4J_CONF=/var/vcap/jobs/neo4j/conf

mkdir -p $RUN_DIR
mkdir -p $NEO4J_LOGS
mkdir -p $NEO4J_CONF
chown -R vcap:vcap $NEO4J_LOGS $RUN_DIR /var/vcap/store/neo4j/data

echo $$ > ${RUN_DIR}/pid
exec /var/vcap/packages/neo4j/bin/neo4j $1 >> $NEO4J_LOGS/$1_stdout.log 2>> $NEO4J_LOGS/$1_stderr.log
