#!/bin/bash

export PATH=${HIVE_HOME}/bin:${HADOOP_HOME}/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

beeline -u jdbc:hive2://localhost:10000 -n root
