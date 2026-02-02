-- =========================================================
-- Sistema de Gestión de Comercio Electrónico Multivendedor
-- =========================================================

-- -------------------------
-- VENDEDORES
-- -------------------------
CREATE TABLE vendedores (
  vendedor_id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre               VARCHAR(120) NOT NULL,
  email                VARCHAR(160) NOT NULL UNIQUE,
  telefono             VARCHAR(40),
  estado_verificacion  VARCHAR(20) NOT NULL,
  creado_en            TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT chk_vendedores_estado_verificacion
    CHECK (estado_verificacion IN ('pendiente', 'verificado', 'rechazado', 'suspendido'))
);

-- -------------------------
-- CLIENTES
-- -------------------------
CREATE TABLE clientes (
  cliente_id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre       VARCHAR(80) NOT NULL,
  apellidos    VARCHAR(80) NOT NULL,
  email        VARCHAR(160) NOT NULL UNIQUE,
  telefono     VARCHAR(40),
  creado_en    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- -------------------------
-- DIRECCIONES_CLIENTE
-- -------------------------
CREATE TABLE direcciones_cliente (
  direccion_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  cliente_id       INT NOT NULL REFERENCES clientes(cliente_id) ON DELETE CASCADE,
  etiqueta         VARCHAR(40) NOT NULL, -- "Casa", "Trabajo"
  destinatario     VARCHAR(160) NOT NULL,
  linea1           VARCHAR(160) NOT NULL,
  linea2           VARCHAR(160),
  ciudad           VARCHAR(100) NOT NULL,
  provincia        VARCHAR(100),
  codigo_postal    VARCHAR(20) NOT NULL,
  pais             VARCHAR(80) NOT NULL,
  es_principal     BOOLEAN NOT NULL DEFAULT FALSE,
  creado_en        TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_direcciones_cliente_cliente ON direcciones_cliente(cliente_id);

-- -------------------------
-- PRODUCTOS
-- -------------------------
CREATE TABLE productos (
  producto_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  vendedor_id  INT NOT NULL REFERENCES vendedores(vendedor_id) ON DELETE RESTRICT,
  sku          VARCHAR(40) NOT NULL UNIQUE,
  nombre       VARCHAR(160) NOT NULL,
  descripcion  TEXT,
  precio       NUMERIC(12,2) NOT NULL,
  stock        INT NOT NULL,
  activo       BOOLEAN NOT NULL DEFAULT TRUE,
  creado_en    TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT chk_productos_precio CHECK (precio >= 0),
  CONSTRAINT chk_productos_stock CHECK (stock >= 0)
);

CREATE INDEX idx_productos_vendedor ON productos(vendedor_id);

-- -------------------------
-- PEDIDOS
-- -------------------------
CREATE TABLE pedidos (
  pedido_id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,  
  direccion_envio_id  INT NOT NULL REFERENCES direcciones_cliente(direccion_id) ON DELETE RESTRICT,
  estado              VARCHAR(20) NOT NULL,
  realizado_en        TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT chk_pedidos_estado
    CHECK (estado IN ('creado', 'pagado', 'enviado', 'entregado', 'cancelado'))
);

CREATE INDEX idx_pedidos_direccion_envio ON pedidos(direccion_envio_id);

-- -------------------------
-- LINEAS_PEDIDO
-- -------------------------
CREATE TABLE lineas_pedido (
  linea_pedido_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  pedido_id        INT NOT NULL REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
  producto_id      INT NOT NULL REFERENCES productos(producto_id) ON DELETE RESTRICT,
  cantidad         INT NOT NULL,
  precio_unitario  NUMERIC(12,2) NOT NULL, -- precio "congelado" al comprar
  CONSTRAINT chk_lineas_pedido_cantidad CHECK (cantidad > 0),
  CONSTRAINT chk_lineas_pedido_precio_unitario CHECK (precio_unitario >= 0),
  CONSTRAINT uq_pedido_producto UNIQUE (pedido_id, producto_id)
);

CREATE INDEX idx_lineas_pedido_pedido ON lineas_pedido(pedido_id);
CREATE INDEX idx_lineas_pedido_producto ON lineas_pedido(producto_id);

-- -------------------------
-- PAGOS
-- -------------------------
CREATE TABLE pagos (
  pago_id                INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  pedido_id              INT NOT NULL REFERENCES pedidos(pedido_id) ON DELETE CASCADE,
  metodo                 VARCHAR(20) NOT NULL,
  importe                NUMERIC(12,2) NOT NULL,
  estado                 VARCHAR(20) NOT NULL,
  pagado_en              TIMESTAMPTZ,
  referencia_transaccion VARCHAR(80) UNIQUE,
  CONSTRAINT chk_pagos_metodo CHECK (metodo IN ('tarjeta', 'paypal', 'transferencia', 'bizum')),
  CONSTRAINT chk_pagos_estado CHECK (estado IN ('pendiente', 'pagado', 'fallido', 'reembolsado')),
  CONSTRAINT chk_pagos_importe CHECK (importe >= 0)
);

CREATE INDEX idx_pagos_pedido ON pagos(pedido_id);