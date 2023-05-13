#!/bin/bash

export PATH=${HIVE_HOME}/bin:${HADOOP_HOME}/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

export HIVE_OPTS="${HIVE_OPTS} --hiveconf metastore.root.logger=${HIVE_LOGLEVEL},console "

# hdfs dfs -mkdir /tmp
# hdfs dfs -chmod g+w /tmp
# hdfs dfs -mkdir -p /user/hive/warehouse
# hdfs dfs -chmod g+w /user/hive/warehouse
schematool -dbType derby -initSchema

hiveserver2
