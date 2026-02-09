# Ejercicios Tipo Examen

## Contexto

Los ejercicios se componen de dos partes, una práctica y un test relacionado con la parte práctica. Las instrucciones generales son las siguientes.

### Parte 1: Diseño y construcción de una base de datos relacional (6 puntos)

A partir del caso práctico, se debe realizar lo siguiente:

1. **Diagrama Entidad–Relación**
   * Puede realizarse a mano o utilizando alguna herramienta de diagramación (Draw.io, LucidChart, Visual Paradigm, Miro, PowerPoint u otra de su elección).  
   * El diagrama debe incluir entidades, atributos, claves primarias, claves foráneas y cardinalidades.

2. **Script SQL de creación**  
   * Debe contener las sentencias necesarias para la creación de las tablas diseñadas (CREATE TABLE).  
   * Todas las tablas deben incluir claves primarias y foráneas correctamente definidas.

3. **Inserción de datos de prueba**  
   * Para cada tabla creada, se deben insertar al menos 10 registros reales o simulados utilizando sentencias INSERT INTO.

**Entrega:**  
Se debe entregar el diagrama entidad-relación, el script de creación de la base de datos y el script de inserción de datos de prueba. Cada apartado tiene un valor de 2 puntos.

### Parte 2: Preguntas tipo test

A continuación, seleccione la consulta SQL correcta para cada una de las siguientes preguntas, tomando como referencia la base de datos que usted ha diseñado. Solo hay una respuesta correcta, y las incorrectas, no restan.

> **Notas:**
>
> * ✅ Indica un ejercicio resuelto
> * 🤔 Indica un ejercicio no resuelto
> * 👌 Indica respuesta correcta en los test
> * 🐋 Para probar las soluciones puedes utilizar [este contenedor Docker](docker-ejercicios/README.md).

## Ejercicios de práctica Otoño 2026

### ✅ Ejercicio 1: Sistema de Gestión de Comercio Electrónico Multivendedor

> Puedes ver la solución de este ejercicio en [este enlace](../ejercicios/soluciones/ejercicio-1/README.md).

#### Parte 1 – Caso práctico (6 puntos)

Diseñe una base de datos para una plataforma de comercio electrónico en la que múltiples vendedores ofrecen productos a clientes finales. El sistema debe contemplar:

* **Vendedores**, con datos de contacto y estado de verificación.
* **Clientes**, con información personal y direcciones de envío.
* **Productos**, ofrecidos por vendedores, con precio y stock.
* **Pedidos**, realizados por clientes y asociados a uno o varios vendedores.
* **Líneas de pedido**, que detallan producto, cantidad y precio unitario.
* **Pagos**, asociados a pedidos y con método e importe.

Un pedido puede incluir productos de distintos vendedores.

#### Parte 2 – Preguntas tipo test (4 puntos)

**1. ¿Cómo se obtienen los productos ofrecidos por un vendedor concreto?**

A)

```sql
SELECT * FROM producto;
```

B) 👌

```sql
SELECT p.*
FROM producto p
WHERE p.vendedor_id = 6;
```

C)

```sql
SELECT vendedor_id FROM producto;
```

D)

```sql
SELECT * FROM vendedor;
```

**2. ¿Cómo se obtienen los pedidos realizados por un cliente determinado?**

A)

```sql
SELECT cliente_id FROM pedido;
```

B) 👌

```sql
SELECT *
FROM pedido
WHERE cliente_id = 14;
```

C)

```sql
SELECT * FROM cliente;
```

D)

```sql
SELECT pedido FROM cliente;
```

**3. ¿Cómo se calcula el importe total de un pedido a partir de sus líneas?**

A)

```sql
SELECT SUM(precio) FROM producto;
```

B) 👌

```sql
SELECT SUM(lp.cantidad * lp.precio_unitario)
FROM linea_pedido lp
WHERE lp.pedido_id = 20;
```

C)

```sql
SELECT * FROM linea_pedido;
```

D)

```sql
SELECT precio_unitario FROM linea_pedido;
```

**4. ¿Cómo se obtienen los vendedores implicados en un pedido concreto?**

A)

```sql
SELECT * FROM vendedor;
```

B) 👌

```sql
SELECT DISTINCT v.*
FROM vendedor v
JOIN producto p ON v.id = p.vendedor_id
JOIN linea_pedido lp ON p.id = lp.producto_id
WHERE lp.pedido_id = 20;
```

C)

```sql
SELECT vendedor_id FROM pedido;
```

D)

```sql
SELECT * FROM linea_pedido;
```

### ✅ Ejercicio 2: Sistema de Gestión de Plataforma de Aprendizaje Corporativo

> Puedes ver la solución de este ejercicio en [este enlace](../ejercicios/soluciones/ejercico-2/README.md).

#### Parte 1 – Caso práctico (6 puntos)

Diseñe una base de datos para una plataforma de formación corporativa utilizada por empresas para capacitar a sus empleados. El sistema debe gestionar:

* **Empresas**, con nombre y sector.
* **Empleados**, asociados a una empresa.
* **Cursos**, con título, duración y nivel.
* **Inscripciones**, que relacionan empleados con cursos y fecha de inscripción.
* **Progreso**, que registra el avance y estado de cada empleado en un curso.
* **Certificaciones**, emitidas cuando un curso es completado.

Un empleado puede estar inscrito en varios cursos y obtener varias certificaciones.

#### Parte 2 – Preguntas tipo test (4 puntos)

**1. ¿Cómo se obtienen los cursos en los que está inscrito un empleado concreto?**

A)

```sql
SELECT * FROM curso;
```

B) 👌

```sql
SELECT c.*
FROM curso c
JOIN inscripcion i ON c.id = i.curso_id
WHERE i.empleado_id = 9;
```

C)

```sql
SELECT empleado_id FROM inscripcion;
```

D)

```sql
SELECT * FROM empleado;
```

**2. ¿Cómo se obtiene el progreso de un empleado en un curso determinado?**

A)

```sql
SELECT * FROM progreso;
```

B) 👌

```sql
SELECT *
FROM progreso
WHERE empleado_id = 9 AND curso_id = 4;
```

C)

```sql
SELECT curso_id FROM progreso;
```

D)

```sql
SELECT estado FROM curso;
```

**3. ¿Cómo se obtienen los empleados que han completado un curso específico?**

A)

```sql
SELECT * FROM empleado;
```

B) 👌

```sql
SELECT e.*
FROM empleado e
JOIN progreso p ON e.id = p.empleado_id
WHERE p.curso_id = 4 AND p.estado = 'completado';
```

C)

```sql
SELECT curso_id FROM progreso;
```

D)

```sql
SELECT * FROM curso;
```

**4. ¿Cómo se obtienen las certificaciones emitidas a un empleado concreto?**

A)

```sql
SELECT * FROM certificacion;
```

B) 👌

```sql
SELECT *
FROM certificacion
WHERE empleado_id = 9;
```

C)

```sql
SELECT empleado_id FROM certificacion;
```

D)

```sql
SELECT * FROM empleado;
```

### 🤔 Ejercicio 3: Sistema de Gestión de Centro Médico Privado

#### Parte 1 – Caso práctico (6 puntos)

Diseñe una base de datos para un centro médico privado que presta servicios sanitarios a pacientes. El sistema debe permitir gestionar la siguiente información:

* **Pacientes**, con datos personales, fecha de alta y datos de contacto.
* **Médicos**, con nombre, especialidad y número de colegiado.
* **Consultas**, que registran las visitas de los pacientes, indicando fecha, médico asignado y motivo de la consulta.
* **Tratamientos**, prescritos durante una consulta, con descripción y duración.
* **Facturas**, emitidas a los pacientes por los servicios recibidos, indicando fecha e importe.
* **Pagos**, asociados a las facturas y con método de pago.

Un paciente puede tener múltiples consultas y facturas, y cada consulta puede generar uno o varios tratamientos.

#### Parte 2 – Preguntas tipo test (4 puntos)

Seleccione la **consulta SQL correcta** para cada una de las siguientes preguntas, basándose en el modelo de datos diseñado.

**1. ¿Cómo se obtienen todas las consultas realizadas por un paciente concreto?**

A)

```sql
SELECT * FROM consulta;
```

B)

```sql
SELECT *
FROM consulta
WHERE paciente_id = 15;
```

C)

```sql
SELECT paciente_id FROM consulta;
```

D)

```sql
SELECT * FROM paciente;
```

**2. ¿Cómo se obtienen los tratamientos prescritos en una consulta específica?**

A)

```sql
SELECT * FROM tratamiento;
```

B)

```sql
SELECT t.*
FROM tratamiento t
WHERE t.consulta_id = 8;
```

C)

```sql
SELECT consulta_id FROM tratamiento;
```

D)

```sql
SELECT * FROM consulta;
```

**3. ¿Cómo se calcula el importe total facturado a un paciente?**

A)

```sql
SELECT SUM(importe) FROM factura;
```

B)

```sql
SELECT SUM(f.importe)
FROM factura f
WHERE f.paciente_id = 15;
```

C)

```sql
SELECT importe FROM factura;
```

D)

```sql
SELECT COUNT(*) FROM factura;
```

**4. ¿Cómo se obtienen los médicos que han atendido a un paciente determinado?**

A)

```sql
SELECT * FROM medico;
```

B)

```sql
SELECT DISTINCT m.*
FROM medico m
JOIN consulta c ON m.id = c.medico_id
WHERE c.paciente_id = 15;
```

C)

```sql
SELECT medico_id FROM consulta;
```

D)

```sql
SELECT * FROM consulta;
```
