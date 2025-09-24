D ?= podman
SPARK_VERSION=spark-2.4.6
HADOOP_VERSION=hadoop2.7
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
		-f ./docker/images/nodes/base/Dockerfile

	$(D) build \
		-t spark_master_node \
		-f ./docker/images/nodes/master/Dockerfile

	$(D) build \
		-t spark_worker_node \
		-f ./docker/images/nodes/worker/Dockerfile

up:
	$(D) run --hostname spark-master-node --network $(NETWORK_NAME) --name spark_master_node -p 9091:8080 -p 7077:7077 -d spark_master_node
	$(D) run --hostname spark-worker-node-1 --network $(NETWORK_NAME) --expose 8081 --name spark_worker_node_1 -p 9092:8081 -d spark_worker_node
	$(D) run --hostname spark-worker-node-2 --network $(NETWORK_NAME) --expose 8081 --name spark_worker_node_2 -p 9093:8081 -d spark_worker_node

down:
	$(D) stop spark_master_node && $(D) rm spark_master_node
	$(D) stop spark_worker_node_1 && $(D) rm spark_worker_node_1
	$(D) stop spark_worker_node_2 && $(D) rm spark_worker_node_2
