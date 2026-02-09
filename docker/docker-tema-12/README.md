# Demo Tema 12: Pipeline de Minería de Datos (E-commerce) Empleando Jupyter + Python en Docker

Este proyecto levanta un contenedor Docker con **JupyterLab** y un notebook que:

* Genera **datos ficticios** de un e-commerce (volumen mediano).
* Entrena un modelo para **predicción de compra** (clasificación).
* Realiza **clustering** de clientes (segmentación).
* Guarda artefactos (modelo y clusters) en `./artifacts`.

## Requisitos

* Docker y Docker Compose

## Arranque

En la carpeta del proyecto:

```bash
docker compose up --build
```

Abre en el navegador:
* http://localhost:8888

Notebook:

* `notebooks/01_pipeline_mineria_ecommerce.ipynb`

## Estructura

* `notebooks/` Notebooks de la demo
* `artifacts/` Salidas (modelos, métricas, etc.)
* `Dockerfile`, `docker-compose.yml`, `requirements.txt`
