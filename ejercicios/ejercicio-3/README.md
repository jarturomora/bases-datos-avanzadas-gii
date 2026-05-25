# Ejercicio tipo examen: Gestión de Medicamentos

## **BLOQUE 1 - CASO PRÁCTICO (50 %)**

### **Enunciado**

Debes crear una base de datos llamada **`farmacia_central`** que contenga **exactamente dos colecciones**:

1. **`medicamentos`**
2. **`dispensaciones`**

### **Requisitos obligatorios**

#### Colección `medicamentos`

* Insertar **exactamente 6 documentos**.
* Cada documento debe contener obligatoriamente los campos:
  * `nombre` (string)
  * `categoria` (string)
  * `stock` (number)
  * `requiereReceta` (boolean)
* Condiciones:
  * `stock` debe estar entre **0 y 500**.
  * Al menos **2 medicamentos** deben tener `stock` menor a **20**.
  * Debe existir **al menos un medicamento** de categoría **"Antibiótico"**.
  * Al menos **3 medicamentos** deben tener `requiereReceta: true`.

#### Colección `dispensaciones`

* Insertar **exactamente 5 documentos**.
* Cada documento debe contener obligatoriamente los campos:
  * `paciente` (string)
  * `medicamento` (string)
  * `unidades` (number)
  * `fecha` (date)
  * `validada` (boolean)
* Condiciones:
  * `unidades` debe estar entre **1 y 30**.
  * Al menos **3 dispensaciones** deben tener `validada: true`.
  * Debe existir **al menos una dispensación** de más de **10 unidades**.

### **Entrega**

* Debes entregar **únicamente las colecciones creadas** exportadas en **formato ZIP**.

## **BLOQUE 2 - TEST DE CONSULTAS (50 %)**

Selecciona **la consulta MongoDB correcta** en cada caso.

### **Pregunta 1**

Obtener todos los medicamentos que **requieren receta**.

a)

```js
db.medicamentos.find({ requiereReceta = true })
```

b)

```js
db.medicamento.find({ requiereReceta: true })
```

c)

```js
db.medicamentos.find({ requiereReceta: "true" })
```

d)

```js
db.medicamentos.find({ requiereReceta: true })
```

***

### **Pregunta 2**

Mostrar solo el **nombre y el stock** de todos los medicamentos.

a)

```js
db.medicamentos.find({}, { nombre: 1, stock: 1, _id: 0 })
```

b)

```js
db.medicamentos.find({ nombre, stock })
```

c)

```js
db.medicamentos.select({ nombre: 1, stock: 1 })
```

d)

```js
db.medicamentos.find({}, { nombre: true, stock: true })
```

***

### **Pregunta 3**

Obtener las dispensaciones con **más de 10 unidades**.

a)

```js
db.dispensaciones.find({ unidades > 10 })
```

b)

```js
db.dispensacion.find({ unidades: { $gt = 10 } })
```

c)

```js
db.dispensaciones.find({ unidades: { $gt: 10 } })
```

d)

```js
db.dispensaciones.find({ unidades: "10" })
```

***

### **Pregunta 4**

Listar las dispensaciones **ordenadas por número de unidades de mayor a menor**.

a)

```js
db.dispensaciones.sort({ unidades: -1 })
```

b)

```js
db.dispensaciones.find().orderBy({ unidades: "desc" })
```

c)

```js
db.dispensaciones.find().sort(unidades: -1)
```

d)

```js
db.dispensaciones.find().sort({ unidades: -1 })
```
