# 🔥 Apache Spark Cluster (Standalone con Docker)

Este proyecto crea un clúster Apache Spark en modo standalone usando contenedores Docker (o Podman), ideal para pruebas locales o desarrollo distribuido.

---

## 🧰 Requisitos

- [Docker](https://www.docker.com/) o [Podman](https://podman.io/)
- 2 GB de RAM libres por nodo (recomendado)
- Acceso a puertos locales (ver sección de puertos)
- Make
---

## ⚙️ Arquitectura

| Rol     | Contenedor       | Hostname/IP       | Puerto UI | Observaciones        |
|---------|------------------|-------------------|-----------|-----------------------|
| Master  | `spark_master_node`   | `spark-master-node`    | `9091`    | Interfaz Web de Spark |
| Worker1 | `spark_worker_node_1` | `spark-worker-node-1`  | `9092`    | Primer worker         |
| Worker2 | `spark_worker_node_2` | `spark-worker-node-2`  | `9093`    | Segundo worker        |

---

## 🐳 Imágenes utilizadas
Para lograr el mejor rendimiento de este cluster se utiliza la imagen de linux alpinev3.14.
```bash
FROM alpine:3.14
```

## 🚀 Cómo levantar el clúster
1. Crear red
```bash
make config
```
2. Construccion de imagenes
```bash
make build
```
2. Levantar el cluster
```bash
make up
```

## 🛑 Comandos adicionales
* Bajar el cluster
```bash
make down
```

## 🧪 Verificar el clúster
Abre el navegador e ingresa a
```
http://0.0.0.0:9091/ -> Master
http://0.0.0.0:9092/ -> Worker1
http://0.0.0.0:9093/ -> Worker2
```