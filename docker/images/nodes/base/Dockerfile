FROM alpine:3.14
ARG spark_version
ARG hadoop_version
RUN apk add python3 openjdk8-jre py3-pip
RUN addgroup -S spark
RUN adduser -S spark -G spark
RUN wget https://archive.apache.org/dist/spark/${spark_version}/${spark_version}-bin-${hadoop_version}.tgz
RUN mkdir /home/spark/bin && \ 
    mv ${spark_version}-bin-${hadoop_version}.tgz /home/spark/bin/${spark_version}-bin-${hadoop_version}.tgz && \ 
    cd /home/spark/bin && tar -xvf /home/spark/bin/${spark_version}-bin-${hadoop_version}.tgz && rm /home/spark/bin/${spark_version}-bin-${hadoop_version}.tgz
ENV HOME /home/spark/
ENV SPARK_HOME ${HOME}bin/${spark_version}-bin-${hadoop_version}
ENV SPARK_MASTER_NODE_HOST spark-master-node
ENV SPARK_MASTER_NODE_PORT 7077
RUN apk add bash 
RUN ln -s ${SPARK_HOME}/bin/pyspark /bin/pyspark && ln -s ${SPARK_HOME}/bin/spark-submit /bin/spark-submit && ln -s /usr/bin/python3 /bin/python
RUN mkdir -p $HOME/logs && chown -R spark:spark ${HOME}
WORKDIR ${SPARK_HOME}
USER spark
