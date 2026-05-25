# Ejercicio Práctico de MongoDB – Video Club

## BLOQUE 1 – CASO PRÁCTICO

### Enunciado

Un **video club** necesita registrar información básica sobre sus **películas** y sus **clientes**.

Debes realizar las siguientes tareas en MongoDB:

1. Crear una base de datos llamada **videoclub**.
2. Crear **exactamente dos colecciones**:
    * `peliculas`
    * `clientes`
3. Insertar los datos cumpliendo **todas** las condiciones obligatorias:

### Colección `peliculas`

* Insertar **exactamente 6 documentos**.
* Cada documento debe incluir obligatoriamente:
  * `titulo` (string)
  * `genero` (string)
  * `anio` (number)
  * `precio_alquiler` (number)
* Condiciones:
  * `anio` debe estar entre **2000 y 2022**.
  * `precio_alquiler` debe estar entre **2 y 6** (inclusive).
  * Al menos **2 películas** deben ser del género `"Acción"`.

### Colección `clientes`

* Insertar **exactamente 4 documentos**.
* Cada documento debe incluir obligatoriamente:
  * `nombre` (string)
  * `edad` (number)
  * `socio_activo` (boolean)
* Condiciones:
  * `edad` debe estar entre **18 y 65**.
  * Al menos **2 clientes** deben tener `socio_activo: true`.

📦 **Entrega obligatoria**: exportar la base de datos y entregar **la colección creada en formato ZIP**.

## BLOQUE 2 – TEST DE CONSULTAS (50 %)

Selecciona la **consulta MongoDB correcta** en cada caso.

### Pregunta 1

Obtener todas las películas del género `"Acción"`.

a)

```js
db.peliculas.find("genero: Acción")
```

b)

```js
db.peliculas.find({ genero = "Acción" })
```

c)

```js
db.peliculas.find({ genero: "Acción" })
```

d)

```js
db.find.peliculas({ genero: "Acción" })
```

### Pregunta 2

Mostrar las películas cuyo `precio_alquiler` sea **mayor a 4**.

a)

```js
db.peliculas.find({ precio_alquiler: > 4 })
```

b)

```js
db.peliculas.find({ precio_alquiler: { $gt: 4 } })
```

c)

```js
db.peliculas.find({ $gt: { precio_alquiler: 4 } })
```

d)

```js
db.peliculas.find(precio_alquiler > 4)
```

### Pregunta 3

Obtener los clientes que tengan `socio_activo` en **true**.

a)

```js
db.clientes.find({ socio_activo = true })
```

b)

```js
db.clientes.find("socio_activo: true")
```

c)

```js
db.clientes.find({ socio_activo: true })
```

d)

```js
db.find({ socio_activo: true })
```

### Pregunta 4

Mostrar los clientes cuya `edad` sea **menor o igual a 30**.

a)

```js
db.clientes.find({ edad: { $lt: 30 } })
```

b)

```js
db.clientes.find({ edad <= 30 })
```

c)

```js
db.clientes.find({ edad: { $lte: 30 } })
```

d)

```js
db.clientes.find({ $lte: { edad: 30 } })
```
