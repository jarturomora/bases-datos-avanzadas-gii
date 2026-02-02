# Solución Ejercicio 1: Sistema de Gestión de Comercio Electrónico Multivendedor

## Parte 1: Diagrama E-R

```mermaid
erDiagram
    VENDEDORES ||--o{ PRODUCTOS : ofrece
    CLIENTES ||--o{ DIRECCIONES_CLIENTE : tiene
    DIRECCIONES_CLIENTE ||--o{ PEDIDOS : envia_a
    PEDIDOS ||--o{ LINEAS_PEDIDO : contiene
    PRODUCTOS ||--o{ LINEAS_PEDIDO : detalla
    PEDIDOS ||--o{ PAGOS : tiene

    VENDEDORES {
        int vendedor_id PK
        varchar nombre
        varchar email
        varchar telefono
        varchar estado_verificacion
        timestamptz creado_en
    }

    CLIENTES {
        int cliente_id PK
        varchar nombre
        varchar apellidos
        varchar email
        varchar telefono
        timestamptz creado_en
    }

    DIRECCIONES_CLIENTE {
        int direccion_id PK
        int cliente_id FK
        varchar etiqueta
        varchar destinatario
        varchar linea1
        varchar linea2
        varchar ciudad
        varchar provincia
        varchar codigo_postal
        varchar pais
        boolean es_principal
        timestamptz creado_en
    }

    PRODUCTOS {
        int producto_id PK
        int vendedor_id FK
        varchar sku
        varchar nombre
        text descripcion
        numeric precio
        int stock
        boolean activo
        timestamptz creado_en
    }

    PEDIDOS {
        int pedido_id PK        
        int direccion_envio_id FK
        varchar estado
        timestamptz realizado_en
    }

    LINEAS_PEDIDO {
        int linea_pedido_id PK
        int pedido_id FK
        int producto_id FK
        int cantidad
        numeric precio_unitario
    }

    PAGOS {
        int pago_id PK
        int pedido_id FK
        varchar metodo
        numeric importe
        varchar estado
        timestamptz pagado_en
        varchar referencia_transaccion
    }
```

## Código SQL

* [Parte 2: Script para creación de la base de datos](esquema.sql)

* [Parte 3: Script para inserción de datos](datos.sql)

## Consultas para probar la base de datos (opcional)

### 1) Top 5 vendedores por facturación (solo pedidos pagados)

```sql
SELECT
  v.vendedor_id,
  v.nombre AS vendedor,
  ROUND(SUM(lp.cantidad * lp.precio_unitario), 2) AS facturacion
FROM vendedores v
JOIN productos p       ON p.vendedor_id = v.vendedor_id
JOIN lineas_pedido lp  ON lp.producto_id = p.producto_id
JOIN pedidos pe        ON pe.pedido_id = lp.pedido_id
WHERE pe.estado IN ('pagado', 'enviado', 'entregado')
GROUP BY v.vendedor_id, v.nombre
ORDER BY facturacion DESC
LIMIT 5;
```

### 2) Pedidos multivendedor (nº de vendedores distintos por pedido)

```sql
SELECT
  pe.pedido_id,
  COUNT(DISTINCT p.vendedor_id) AS vendedores_distintos,
  ROUND(SUM(lp.cantidad * lp.precio_unitario), 2) AS total_pedido
FROM pedidos pe
JOIN lineas_pedido lp ON lp.pedido_id = pe.pedido_id
JOIN productos p      ON p.producto_id = lp.producto_id
GROUP BY pe.pedido_id
HAVING COUNT(DISTINCT p.vendedor_id) > 1
ORDER BY vendedores_distintos DESC, total_pedido DESC;
```

### 3) Total del pedido vs total pagado (detección de desajustes)

```sql
WITH totales_pedido AS (
  SELECT
    pe.pedido_id,
    ROUND(SUM(lp.cantidad * lp.precio_unitario), 2) AS total_calculado
  FROM pedidos pe
  JOIN lineas_pedido lp ON lp.pedido_id = pe.pedido_id
  GROUP BY pe.pedido_id
),
totales_pago AS (
  SELECT
    pedido_id,
    ROUND(SUM(importe), 2) AS total_pagado
  FROM pagos
  WHERE estado IN ('pagado', 'reembolsado')  -- ajusta si quieres solo pagado
  GROUP BY pedido_id
)
SELECT
  t.pedido_id,
  t.total_calculado,
  COALESCE(p.total_pagado, 0) AS total_pagado,
  ROUND(t.total_calculado - COALESCE(p.total_pagado, 0), 2) AS diferencia
FROM totales_pedido t
LEFT JOIN totales_pago p ON p.pedido_id = t.pedido_id
ORDER BY ABS(t.total_calculado - COALESCE(p.total_pagado, 0)) DESC;
```

### 4) Productos más vendidos (por unidades)

```sql
SELECT
  p.producto_id,
  p.nombre AS producto,
  v.nombre AS vendedor,
  SUM(lp.cantidad) AS unidades_vendidas
FROM productos p
JOIN vendedores v      ON v.vendedor_id = p.vendedor_id
JOIN lineas_pedido lp  ON lp.producto_id = p.producto_id
JOIN pedidos pe        ON pe.pedido_id = lp.pedido_id
WHERE pe.estado IN ('pagado', 'enviado', 'entregado')
GROUP BY p.producto_id, p.nombre, v.nombre
ORDER BY unidades_vendidas DESC
LIMIT 10;
```

### 5) Ranking de métodos de pago por volumen y por importe

```sql
SELECT
  metodo,
  COUNT(*) AS num_pagos,
  ROUND(SUM(importe), 2) AS importe_total,
  ROUND(AVG(importe), 2) AS importe_medio
FROM pagos
GROUP BY metodo
ORDER BY importe_total DESC;
```
