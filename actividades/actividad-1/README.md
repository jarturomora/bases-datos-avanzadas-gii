# Actividad 1: diseño de una base de datos relacional

Esta actividad parte de los datos publicados por el Ministerio para diseñar y cargar en PostgreSQL una base de datos de estaciones de servicio terrestres y postes marítimos.

## Contenido del directorio

```text
actividad-1/
├── README.md
├── crear-base-datos.sql
├── diagrama-modelo-relacional.md
├── datos/
│   ├── embarcacionesPrecios_es.xls
│   ├── gii35_act1.docx
│   └── preciosEESS_es.xls
└── docker/
    └── docker-compose.yml
```

- `datos/gii35_act1.docx`: enunciado de la actividad.
- `datos/preciosEESS_es.xls`: datos de las estaciones de servicio terrestres.
- `datos/embarcacionesPrecios_es.xls`: datos de los postes marítimos.
- `diagrama-modelo-relacional.md`: diagrama Mermaid del modelo relacional y explicación de las decisiones de diseño.
- `crear-base-datos.sql`: DDL de PostgreSQL que crea las tablas, claves, restricciones e índices.
- `docker/docker-compose.yml`: entorno local con PostgreSQL 16 y pgAdmin 4.

El modelo contiene las tablas `provincia`, `municipio`, `localidad`, `empresa`, `estacion`, `carburante` y `precio_estacion`.

## Requisitos en Windows

1. Tener instalado [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Iniciar Docker Desktop y esperar hasta que indique que el motor está en ejecución.
3. Abrir PowerShell en la raíz del repositorio.

Se puede comprobar que Docker está disponible con:

```powershell
docker version
docker compose version
```

## Iniciar PostgreSQL y pgAdmin

Desde la raíz del repositorio, entrar en el directorio de la actividad:

```powershell
Set-Location .\actividades\actividad-1
```

Iniciar los contenedores en segundo plano:

```powershell
docker compose -f .\docker\docker-compose.yml up -d
```

Comprobar su estado:

```powershell
docker compose -f .\docker\docker-compose.yml ps
```

PostgreSQL debe aparecer como `healthy` y pgAdmin como `Up`.

Durante el primer arranque, PostgreSQL ejecuta automáticamente `crear-base-datos.sql`. El script solo vuelve a ejecutarse si se crea un volumen de datos nuevo.

## Abrir pgAdmin

Abrir la siguiente dirección en el navegador:

[http://localhost:8080](http://localhost:8080)

Credenciales de pgAdmin:

| Campo | Valor |
|---|---|
| Correo | `admin@example.com` |
| Contraseña | `admin` |

La primera vez es necesario registrar la conexión a PostgreSQL desde **Add New Server**.

En la pestaña **General**:

| Campo | Valor |
|---|---|
| Name | `Actividad 1` |

En la pestaña **Connection**:

| Campo | Valor |
|---|---|
| Host name/address | `db` |
| Port | `5432` |
| Maintenance database | `actividad1` |
| Username | `actividad1` |
| Password | `actividad1` |

El nombre de host debe ser `db`, no `localhost`, porque pgAdmin se comunica con PostgreSQL a través de la red interna de Docker.

## Acceder a PostgreSQL desde PowerShell

No es necesario instalar `psql` en Windows. Se puede ejecutar dentro del contenedor:

```powershell
docker compose -f .\docker\docker-compose.yml exec db psql -U actividad1 -d actividad1
```

Por ejemplo, para listar las tablas sin abrir una sesión interactiva:

```powershell
docker compose -f .\docker\docker-compose.yml exec db psql -U actividad1 -d actividad1 -c "\dt"
```

## Consultar los registros y diagnosticar problemas

Mostrar los registros de todos los servicios:

```powershell
docker compose -f .\docker\docker-compose.yml logs
```

Seguir los registros en tiempo real:

```powershell
docker compose -f .\docker\docker-compose.yml logs -f
```

Mostrar únicamente los registros de PostgreSQL:

```powershell
docker compose -f .\docker\docker-compose.yml logs db
```

Si los puertos `5432` o `8080` ya están ocupados, se debe detener el programa que los utiliza o cambiar el puerto situado a la izquierda de `:` en `docker/docker-compose.yml`. Por ejemplo, `5433:5432` publica PostgreSQL en el puerto `5433` de Windows sin cambiar su puerto interno.

## Detener el entorno

Detener y eliminar los contenedores conservando los datos:

```powershell
docker compose -f .\docker\docker-compose.yml down
```

Los datos permanecen en los volúmenes de Docker y estarán disponibles en el siguiente arranque.

## Reinicializar la base de datos

Para borrar los datos y crear de nuevo la base a partir de `crear-base-datos.sql`:

```powershell
docker compose -f .\docker\docker-compose.yml down -v
docker compose -f .\docker\docker-compose.yml up -d
```

> **Advertencia:** la opción `-v` elimina definitivamente los datos almacenados en los volúmenes de PostgreSQL y pgAdmin.
