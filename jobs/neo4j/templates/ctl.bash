#!/bin/bash

RUN_DIR=/var/vcap/sys/run/neo4j

export JAVA_HOME=/var/vcap/packages/java
export NEO4J_HOME=/var/vcap/packages/neo4j
export NEO4J_PIDFILE=${RUN_DIR}/pid
export NEO4J_LOGS=/var/vcap/sys/log/neo4j
export NEO4J_CONF=/var/vcap/jobs/neo4j/conf
export NEO4J_DATA=/var/vcap/store/neo4j

mkdir -p $NEO4J_LOGS
mkdir -p $NEO4J_CONF

/var/vcap/packages/neo4j/bin/neo4j $1
