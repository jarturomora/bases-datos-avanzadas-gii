# Ejercicios Tipo Examen

## Descripción

En este directorio encontrarás ejercicios similares a los que resolverás en el examen de la asignatura. Están pensados para practicar la creación de colecciones, la inserción de documentos y la construcción de consultas en MongoDB en un contexto parecido al de la prueba final.

## Requisitos

Para trabajar con estos ejercicios necesitas las siguientes herramientas:

* [MongoDB](https://www.mongodb.com/), ya sea como [aplicación de escritorio](https://www.mongodb.com/products/self-managed/community-edition) o en un contenedor Docker (puedes usar [este contenedor](docker-ejercicio/docker-compose.yml)).

* [MongoDB Compass](https://www.mongodb.com/products/tools/compass)

* [Visual Studio Code](https://code.visualstudio.com/) con la extensión [Container Tools](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-containers) si optaste por utilizar MongoDB en Docker.

* [Docker Desktop](https://www.docker.com/products/docker-desktop/) (en caso de que lo requieras)

## Puesta en marcha

Si no tienes MongoDB instalado en local, puedes utilizar el contenedor incluido en [docker-ejercicio](docker-ejercicio/):

```bash
docker compose -f ejercicios/docker-ejercicio/docker-compose.yml up -d
```

El contenedor expone MongoDB en el puerto `27017` y crea la base de datos `ejercicios` como punto de partida.

## Forma de trabajo recomendada

Para cada ejercicio se recomienda seguir este flujo:

1. Leer el enunciado completo y detectar las colecciones, restricciones y consultas solicitadas.
2. Crear la base de datos y las colecciones en MongoDB Compass o en la shell de MongoDB.
3. Insertar los documentos respetando exactamente las condiciones indicadas.
4. Verificar las consultas pedidas antes de preparar la entrega.
5. Exportar únicamente las colecciones o ficheros solicitados en el formato indicado en el enunciado.

## Leyenda

✅ - Ejercicio resuelto
🤔 - Ejercicio sin resolver

## Ejercicios disponibles

### Curso 2025 - 2026

* [✅- Ejercicio 1 - Videoclub](ejercicio-1/)
* [🤔- Ejercicio 2 - Reservas de hotel](ejercicio-2/)
* [🤔- Ejercicio 3 - Gestión de medicamentos](ejercicio-3/)
* [🤔- Ejercicio 4 - Gestión de pagos](ejercicio-4/)
