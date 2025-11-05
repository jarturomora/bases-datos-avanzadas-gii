# Contenedores Docker

## Herramientas

* [Docker desktop](https://docs.docker.com/get-started/get-docker/)
* [Extension _Container Tools_ para Visual Studio Code (opcional)](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers)

## Contenedor de Postgres

### Descripción del fichero `docker-compose.yml`

El fichero `postgres/docker-compose.yml` configura los servicios Docker necesarios para la práctica:

* Servicio `db` (imagen `postgres:16`):
  * Usuario, contraseña y base de datos por defecto (POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB).
  * Mapeo de puerto (por defecto "5432:5432").
  * Volúmenes: `pgdata` para datos y `./init` para scripts de inicialización (.sql).
  * Healthcheck para esperar a que la base de datos esté lista.

* Servicio `pgadmin` (imagen `dpage/pgadmin4`):
  * Interfaz web en el puerto 8080.
  * Depende de que `db` esté _healthy_.
  * Volumen `pgadmindata` para persistencia de configuración.

* Volúmenes declarados: `pgdata` y `pgadmindata`.

Notas:

* En Windows, si el puerto 5432 está ocupado, cambie el mapeo de puertos (por ejemplo `5433:5432`).

* Los scripts SQL colocados en `postgres/init` se ejecutan automáticamente al crear el contenedor de la base de datos.
