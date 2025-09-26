D ?= podman
SPARK_VERSION=spark-3.4.1
HADOOP_VERSION=hadoop3
NETWORK_NAME=spark_network

ps:
	$(D) ps

config:
	$(D) network create $(NETWORK_NAME)

build:
	$(D) build \
		--build-arg spark_version=$(SPARK_VERSION) \
		--build-arg hadoop_version=$(HADOOP_VERSION) \
		-t spark_node \
		-f ./docker/images/spark/base/Dockerfile

	$(D) build \
		-t spark_master_node \
		-f ./docker/images/spark/master/Dockerfile

	$(D) build \
		-t spark_worker_node \
		-f ./docker/images/spark/worker/Dockerfile

	$(D) build \
		-t jupyter_notebooks \
		-f ./docker/images/jupyter/Dockerfile

up:
	$(D) run --hostname jupyter-notebook --network $(NETWORK_NAME) --mount type=bind,source=$(PWD)/notebooks,target=/home/jupyter/work  --name jupyter_notebook_node -p 8888:8888 -d jupyter_notebooks
	$(D) run --hostname spark-master-node --network $(NETWORK_NAME) --name spark_master_node -p 9091:8080 -p 7077:7077 -d spark_master_node
	$(D) run --hostname spark-worker-node-1 --network $(NETWORK_NAME) --name spark_worker_node_1 -p 9092:8081 -d spark_worker_node
	$(D) run --hostname spark-worker-node-2 --network $(NETWORK_NAME) --name spark_worker_node_2 -p 9093:8081 -d spark_worker_node

down:
	$(D) stop jupyter_notebook_node && $(D) rm jupyter_notebook_node
	$(D) stop spark_master_node && $(D) rm spark_master_node
	$(D) stop spark_worker_node_1 && $(D) rm spark_worker_node_1
	$(D) stop spark_worker_node_2 && $(D) rm spark_worker_node_2
