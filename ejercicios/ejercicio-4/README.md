# Ejercicio tipo examen: Gestión de Pagos en Comercio Electrónico

## **BLOQUE 1 - CASO PRÁCTICO (50 %)**

### **Enunciado**

Debes crear una base de datos llamada **`ecommerce_pagos`** que contenga **exactamente dos colecciones**:

1. **`pagos`**
2. **`metodosPago`**

### **Requisitos obligatorios**

#### Colección `pagos`

* Insertar **exactamente 6 documentos**.
* Cada documento debe contener obligatoriamente los campos:
  * `pedido` (string)
  * `importe` (number)
  * `pagado` (boolean)
  * `metodo` (string)
* Condiciones:
  * `importe` debe estar entre **10 y 2000**.
  * Al menos **3 pagos** deben tener `pagado: true`.
  * Debe existir **al menos un pago** con `importe` mayor que **500**.

#### Colección `metodosPago`

* Insertar **exactamente 4 documentos**.
* Cada documento debe contener obligatoriamente los campos:
  * `nombre` (string)
  * `tipo` (string)
  * `comision` (number)
  * `activo` (boolean)
* Condiciones:
  * `comision` debe estar entre **0 y 5**.
  * Debe existir **al menos un método** de tipo **"Tarjeta"**.
  * Al menos **3 métodos de pago** deben tener `activo: true`.

### **Entrega**

* Debes entregar **únicamente las colecciones creadas** exportadas en **formato ZIP**.

## **BLOQUE 2 - TEST DE CONSULTAS (50 %)**

Selecciona **la consulta MongoDB correcta** en cada caso.

### **Pregunta 1**

Obtener todos los pagos que **ya están pagados**.

a)

```js
db.pagos.find({ pagado = true })
```

b)

```js
db.pago.find({ pagado: true })
```

c)

```js
db.pagos.find({ pagado: "true" })
```

d)

```js
db.pagos.find({ pagado: true })
```

***

### **Pregunta 2**

Mostrar solo el **pedido y el importe** de todos los pagos.

a)

```js
db.pagos.find({}, { pedido: 1, importe: 1, _id: 0 })
```

b)

```js
db.pagos.find({ pedido, importe })
```

c)

```js
db.pagos.select({ pedido: 1, importe: 1 })
```

d)

```js
db.pagos.find({}, { pedido: true, importe: true })
```

***

### **Pregunta 3**

Obtener los pagos con **importe mayor a 300**.

a)

```js
db.pagos.find({ importe > 300 })
```

b)

```js
db.pago.find({ importe: { $gt: 300 } })
```

c)

```js
db.pagos.find({ importe: { $gt: 300 } })
```

d)

```js
db.pagos.find({ importe: "300" })
```

***

### **Pregunta 4**

Listar los métodos de pago **ordenados por comisión de menor a mayor**.

a)

```js
db.metodosPago.sort({ comision: 1 })
```

b)

```js
db.metodosPago.find().orderBy({ comision: "asc" })
```

c)

```js
db.metodosPago.find().sort(comision: 1)
```

d)

```js
db.metodosPago.find().sort({ comision: 1 })
```
