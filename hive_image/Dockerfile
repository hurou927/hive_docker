FROM ubuntu:22.04

WORKDIR /opt

ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_VERSION=3.3.5
ENV HIVE_HOME=/opt/hive
ENV HIVE_VERSION=3.1.3

RUN apt-get update -y \
  && apt-get install -y \
    libk5crypto3 \
    libkrb5-3 \
    libsqlite3-0 \
    wget tar curl \
    openjdk-8-jdk openjdk-8-jre \
    vim less sudo lsof \
   && apt-get clean \
   && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN mkdir -p ${HADOOP_HOME} ${HIVE_HOME}
RUN curl -L https://dlcdn.apache.org/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz  | tar zxf - && \
  mv apache-hive-${HIVE_VERSION}-bin/* ${HIVE_HOME}
RUN curl -L https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | tar zxf - && \
  mv hadoop-${HADOOP_VERSION}/* ${HADOOP_HOME}

RUN mv ${HIVE_HOME}/conf ${HIVE_HOME}/conf.orig
COPY conf ${HIVE_HOME}/conf
COPY scripts/entrypoint.sh ${HIVE_HOME}/entrypoint.sh
COPY scripts/bee.sh ${HIVE_HOME}/bee.sh


ARG USERNAME=user
ARG GROUPNAME=user
ARG PASSWORD=userpass
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

#  java -XshowSettings:properties -version
RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre' >> /home/${USERNAME}/.bashrc
RUN echo 'export PATH=${HIVE_HOME}/bin:${HADOOP_HOME}/bin:$PATH' >> /home/${USERNAME}/.bashrc

RUN echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre' >> /root/.bashrc
RUN echo 'export PATH=${HIVE_HOME}/bin:${HADOOP_HOME}/bin:$PATH' >> /root/.bashrc

WORKDIR $HIVE_HOME
EXPOSE 9083

ENTRYPOINT bash ${HIVE_HOME}/entrypoint.sh
