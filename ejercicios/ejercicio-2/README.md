# Ejercicio tipo examen: Gestión de Hoteles

## **BLOQUE 1 – CASO PRÁCTICO (50 %)**

### **Enunciado**

Debes crear una base de datos llamada **`turismo_hotel`** que contenga **exactamente dos colecciones**:

1. **`habitaciones`**
2. **`reservas`**

### **Requisitos obligatorios**

#### Colección `habitaciones`

* Insertar **exactamente 5 documentos**.
* Cada documento debe contener obligatoriamente los campos:
  * `numero` (number)
  * `tipo` (string)
  * `precioNoche` (number)
  * `disponible` (boolean)
* Condiciones:
  * `precioNoche` debe estar entre **50 y 300**.
  * Al menos **3 habitaciones** deben tener `disponible: true`.
  * Debe existir **al menos una habitación** de tipo **"Suite"**.

#### Colección `reservas`

* Insertar **exactamente 4 documentos**.
* Cada documento debe contener obligatoriamente los campos:
  * `cliente` (string)
  * `noches` (number)
  * `personas` (number)
  * `confirmada` (boolean)
* Condiciones:
  * `noches` debe estar entre **1 y 14**.
  * `personas` debe estar entre **1 y 4**.
  * Al menos **2 reservas** deben tener `confirmada: true`.
  * Debe existir **al menos una reserva** de **más de 2 noches**.

### **Entrega**

* Debes entregar **únicamente las colecciones creadas** exportadas en **formato ZIP**.

## **BLOQUE 2 – TEST DE CONSULTAS (50 %)**

Selecciona **la consulta MongoDB correcta** en cada caso.

### **Pregunta 1**

Obtener todas las habitaciones que **están disponibles**.

a)

```js
db.habitaciones.find({ disponible = true })
```

b)

```js
db.habitacion.find({ disponible: true })
```

c)

```js
db.habitaciones.find({ disponible: "true" })
```

d) 

```js
db.habitaciones.find({ disponible: true })
```

***

### **Pregunta 2**

Mostrar solo el **número y el precio por noche** de todas las habitaciones.

a)

```js
db.habitaciones.find({}, { numero: 1, precioNoche: 1, _id: 0 })
```

b)

```js
db.habitaciones.find({ numero, precioNoche })
```

c)

```js
db.habitaciones.select({ numero: 1, precioNoche: 1 })
```

d)

```js
db.habitaciones.find({}, { numero: true, precioNoche: true })
```

***

### **Pregunta 3**

Obtener las reservas con **más de 3 noches**.

a)

```js
db.reservas.find({ noches > 3 })
```

b)

```js
db.reserva.find({ noches: { $gt = 3 } })
```

c)

```js
db.reservas.find({ noches: { $gt: 3 } })
```

d)

```js
db.reservas.find({ noches: "3" })
```

***

### **Pregunta 4**

Listar las reservas **ordenadas por número de noches de mayor a menor**.

a)

```js
db.reservas.sort({ noches: -1 })
```

b)

```js
db.reservas.find().orderBy({ noches: "desc" })
```

c)

```js
db.reservas.find().sort(noches: -1)
```

d)

```js
db.reservas.find().sort({ noches: -1 })
```
