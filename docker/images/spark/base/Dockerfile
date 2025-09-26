FROM openjdk:17-slim
ARG spark_version
ARG hadoop_version
ARG USERNAME=spark
ARG USER_UID=1001
ARG USER_GID=1001

RUN apt update -y && apt install wget -y

RUN groupadd --gid $USER_GID $USERNAME && useradd --uid $USER_UID --gid $USER_GID --shell /bin/bash --create-home $USERNAME 
RUN wget https://archive.apache.org/dist/spark/${spark_version}/${spark_version}-bin-${hadoop_version}.tgz
RUN mkdir /home/spark/bin && \ 
    mv ${spark_version}-bin-${hadoop_version}.tgz /home/spark/bin/${spark_version}-bin-${hadoop_version}.tgz && \ 
    cd /home/spark/bin && tar -xvf /home/spark/bin/${spark_version}-bin-${hadoop_version}.tgz && rm /home/spark/bin/${spark_version}-bin-${hadoop_version}.tgz
ENV HOME /home/spark/
ENV SPARK_HOME ${HOME}bin/${spark_version}-bin-${hadoop_version}
ENV SPARK_MASTER_NODE_HOST spark-master-node
ENV SPARK_MASTER_NODE_PORT 7077
RUN mkdir -p $HOME/logs && chown -R spark:spark ${HOME}
WORKDIR ${SPARK_HOME}
USER spark
