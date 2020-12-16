FROM ubuntu:18.04
LABEL maintainer="hushuang <hushuang@mininglamp.com.com>"

ENV LANG=zh_CN.UTF-8
ENV LC_MESSAGES=C
ENV TZ=Asia/Shanghai
ENV DEBIAN_FRONTEND=noninteractive

ENV JDK_VERSION=271
ENV GOSU_VERSION=1.12
ENV MAVEN_VERSION=3.6.3
ENV CDH_VERSION=6.2.0

ENV JAVA_HOME /opt/jdk1.8.0_${JDK_VERSION}
ENV MAVEN_HOME /opt/apache-maven-${MAVEN_VERSION}
ENV PATH $PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin:$CATALINA_HOME/bin

# env
ENV HADOOP_CONF_DIR=/etc/hadoop/conf
ENV HADOOP_HOME=/usr/lib/hadoop
ENV FLINK_FILE_DIR=/opt/flink
ENV FLINK_HOME=/opt/flink-1.10.0

WORKDIR /opt

# ADD conf/repo/ubuntu1804/sources.list /etc/apt/sources.list

RUN \
    apt-get update && apt-get install -y --no-install-recommends apt-utils gnupg ca-certificates ntpdate ntpstat vim wget curl unzip sudo tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    ## install maven
    wget -O apache-maven-3.6.3-bin.tar.gz -q https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-3.6.3-bin.tar.gz && \
    tar zxf apache-maven-3.6.3-bin.tar.gz && \
    rm -rf apache-maven-3.6.3-bin.tar.gz && \
    ## install gosu
    wget -O /usr/local/bin/gosu -q https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-amd64 && \
    ## install jdk
    wget -O /opt/jdk-8u271-linux-x64.tar.gz -c --header "Cookie: oraclelicense=accept-securebackup-cookie" -q https://javadl.oracle.com/webapps/download/GetFile/1.8.0_271-b09/61ae65e088624f5aaa0b1d2d801acb16/linux-i586/jdk-8u271-linux-x64.tar.gz && \
    tar zxf jdk-8u271-linux-x64.tar.gz && \
    rm -rf jdk-8u271-linux-x64.tar.gz && \
    ## install cdh 6.2.0 mirrors
    wget -O /etc/apt/sources.list.d/cloudera-manager.list -q https://archive.cloudera.com/cm6/${CDH_VERSION}/ubuntu1804/apt/cloudera-manager.list && \
    curl -sSl https://archive.cloudera.com/cm6/${CDH_VERSION}/ubuntu1804/apt/archive.key | apt-key add - && \
    ## update mirrors
    apt-get update && \
    apt-get -y install \
    cloudera-manager-daemons


# COPY conf/flink/flink-1.10.0-bin-scala_2.12.tgz ${FLINK_FILE_DIR}/

# # 20200820 增加支持TDBS修改版本flink 1.10.1
# COPY conf/flink/flink-1.10.1-bin-scala_2.12-nequal.tgz ${FLINK_FILE_DIR}/flink-1.10.1-bin-scala_2.12.tgz

# # 20201021 增加flink 1.8.1
# COPY conf/flink/flink-1.8.1-bin-scala_2.12.tgz ${FLINK_FILE_DIR}/

# ADD conf/flink/*.jar ${FLINK_FILE_DIR}/
# ADD conf/entrypoint.sh /entrypoint.sh

# RUN \
#   ls $FLINK_FILE_DIR
  
# ENTRYPOINT [ "/entrypoint.sh" ]
