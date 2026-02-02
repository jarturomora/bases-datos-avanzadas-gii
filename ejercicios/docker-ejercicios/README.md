# Descripción del contenedor para probar soluciones

Este directorio proporciona un **entorno base reproducible** para trabajar con las soluciones de la asignatura de **Bases de Datos Avanzadas (BDA)** utilizando **PostgreSQL** y **pgAdmin 4** mediante **Docker Compose**.

El objetivo es disponer de una **instancia local** de PostgreSQL y una interfaz web (pgAdmin) para:

* Crear esquemas y tablas a partir de scripts SQL (DDL).
* Insertar datos de prueba (DML).
* Ejecutar consultas de validación y explotación.
* Gestionar conexiones y bases de datos de manera visual.

> Importante: este entorno **no incluye scripts de inicialización** en `/init`. La base se levanta “vacía” (con la base de datos configurada en `.env`) y las soluciones se cargan manualmente desde **pgAdmin (Query Tool)** o desde `psql`.

## Estructura de directorios

```text
bda-docker/
├─ docker-compose.yml
├─ .env
└─  README.md
```

* `docker-compose.yml`: define los servicios `postgres` y `pgadmin`, volúmenes persistentes y puertos.
* `.env`: centraliza el nombre de la base de datos, las credenciales de acceso y puertos (Postgres y pgAdmin).
* `README.md`: guía de uso del entorno.

## Componentes del entorno

* **PostgreSQL** (contenedor `postgres`): motor de base de datos relacional.
* **pgAdmin 4** (contenedor `pgadmin`): consola web para administrar PostgreSQL, ejecutar scripts SQL y navegar por objetos.

## Persistencia de datos

El entorno utiliza volúmenes Docker para persistir:

* Datos de PostgreSQL (`pgdata`)
* Configuración y metadatos de pgAdmin (`pgadmin_data`)

Esto permite reiniciar contenedores sin perder el trabajo. Si se desea **resetear completamente**, se eliminan volúmenes con `docker compose down -v`.

## Flujo de uso recomendado

1. Levantar el entorno con Docker Compose.
2. Acceder a pgAdmin desde el navegador: <http://localhost:8080/>
3. Registrar el servidor PostgreSQL (host `postgres`, puerto `5432`).
4. Ejecutar los scripts SQL de cada modelo (DDL + inserts) desde el **Query Tool** o con `psql`.
