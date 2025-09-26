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
| Jupyter | `spark_worker_node_2` | `jupyter-notebook`  | `8888`    | Jupyter Notebooks worker        |

---


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


## 📒 Uso de Jupyter Notebook
Este entorno también incluye soporte para Jupyter Notebook, ideal para experimentar con Spark en un entorno interactivo. Para usar Jupyter debes entrar a http://0.0.0.0:8888

#### 🗂️ Carpeta de notebooks
Los notebooks se pueden guardar en la carpeta notebooks/ que podras encontrar en la raiz del proyecto. Esta carpeta está montada como volumen para que tus archivos no se pierdan entre reinicios de contenedores (se deja un archivo de ejemplo con la conexion al cluster y la ejecucion de un dataframe de ejemplo).


## 🤝 Contribuciones

¡Las contribuciones son bienvenidas!

Si querés colaborar con mejoras, agregar nuevas funcionalidades o reportar problemas, seguí estos pasos:

### 🧩 Cómo contribuir


- Clona tu fork localmente:
``` bash
git clone https://github.com/tu-usuario/tu-fork.git
cd tu-fork
```


- Crea una nueva rama:
``` bash
git checkout -b feature/nombre-de-tu-feature
```

- Hace tus cambios y commitealos:
``` bash
git commit -m "Agrega nueva funcionalidad: ..."
```

- Pushea tu rama:
``` bash
git push origin feature/nombre-de-tu-feature
```

- Abre un Pull Request desde tu fork al repositorio original.

### ✅ Buenas prácticas

- Escribe mensajes de commit claros y concisos.
- Usa ramas por feature o fix (para evitar trabajar directamente en main).
- Si es posible, actualiza la documentación (README.md, comentarios, etc.).
- Prueba tus cambios localmente antes de enviar un PR.

### 🐛 Reportar errores o sugerencias
- Si encontrás un problema o querés proponer una mejora, podés abrir un Issue, detallando:
    - Que estabas haciendo.
    - Que esperabas que pasara.
    - Que ocurrió.
    - Logs, errores o capturas si es necesario.


### 📬 Contacto
Si prefieres, también puedes contactarme directamente por [LinkedIn](https://www.linkedin.com/in/matias-moreno-iglesias/) para charlar sobre ideas o propuestas relacionadas al proyecto.