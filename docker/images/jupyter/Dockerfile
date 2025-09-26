FROM python:3.9-alpine


# Crear usuario y directorio
RUN adduser -D jupyter
USER jupyter
WORKDIR /home/jupyter
RUN mkdir -p /home/jupyter/work && chmod -R 755 /home/jupyter/work
WORKDIR /home/jupyter/work


USER root


RUN apk add --no-cache \
    openjdk17 \
    bash \
    curl \
    build-base \
    musl-dev \
    libffi-dev \
    openssl-dev
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV PATH="$JAVA_HOME/bin:$PATH"
RUN pip install --upgrade pip setuptools wheel
RUN pip install pyspark==3.4.1 jupyterlab findspark

USER jupyter

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''", "--NotebookApp.password=''"]
