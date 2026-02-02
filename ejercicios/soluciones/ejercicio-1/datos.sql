-- -------------------------
-- VENDEDORES (10)
-- -------------------------
INSERT INTO vendedores (nombre, email, telefono, estado_verificacion) VALUES
('Tienda Norte', 'contacto@tiendanorte.es', '+34 600 111 001', 'verificado'),
('ElectroMundo', 'ventas@electromundo.es', '+34 600 111 002', 'verificado'),
('Moda Sur', 'hola@modasur.es', '+34 600 111 003', 'pendiente'),
('Hogar y Vida', 'soporte@hogaryvida.es', '+34 600 111 004', 'verificado'),
('DeportePro', 'info@deportepro.es', '+34 600 111 005', 'verificado'),
('Gourmet Cantabria', 'ventas@gourmetcantabria.es', '+34 600 111 006', 'verificado'),
('LibroFácil', 'contacto@librofacil.es', '+34 600 111 007', 'pendiente'),
('Juguetes y Más', 'ayuda@juguetesymas.es', '+34 600 111 008', 'verificado'),
('Repuestos Tech', 'ventas@repuestostech.es', '+34 600 111 009', 'rechazado'),
('EcoMercado', 'hola@ecomercado.es', '+34 600 111 010', 'verificado');

-- -------------------------
-- CLIENTES (10)
-- -------------------------
INSERT INTO clientes (nombre, apellidos, email, telefono) VALUES
('Ana', 'García', 'ana.garcia@mail.es', '+34 700 200 001'),
('Luis', 'Pérez', 'luis.perez@mail.es', '+34 700 200 002'),
('Marta', 'López', 'marta.lopez@mail.es', '+34 700 200 003'),
('Javier', 'Ruiz', 'javier.ruiz@mail.es', '+34 700 200 004'),
('Sofía', 'Martín', 'sofia.martin@mail.es', '+34 700 200 005'),
('Carlos', 'Sánchez', 'carlos.sanchez@mail.es', '+34 700 200 006'),
('Lucía', 'Navarro', 'lucia.navarro@mail.es', '+34 700 200 007'),
('Diego', 'Romero', 'diego.romero@mail.es', '+34 700 200 008'),
('Paula', 'Torres', 'paula.torres@mail.es', '+34 700 200 009'),
('Hugo', 'Díaz', 'hugo.diaz@mail.es', '+34 700 200 010');

-- -------------------------
-- DIRECCIONES_CLIENTE (10)
-- -------------------------
INSERT INTO direcciones_cliente
(cliente_id, etiqueta, destinatario, linea1, linea2, ciudad, provincia, codigo_postal, pais, es_principal)
VALUES
(1, 'Casa', 'Ana García', 'C/ Mayor 10', 'Piso 2', 'Madrid', 'Madrid', '28001', 'España', TRUE),
(2, 'Casa', 'Luis Pérez', 'Av. de la Constitución 55', NULL, 'Sevilla', 'Andalucía', '41001', 'España', TRUE),
(3, 'Casa', 'Marta López', 'C/ Gran Vía 120', 'Portal B', 'Barcelona', 'Cataluña', '08010', 'España', TRUE),
(4, 'Casa', 'Javier Ruiz', 'C/ Colón 3', NULL, 'Valencia', 'Valencia', '46001', 'España', TRUE),
(5, 'Casa', 'Sofía Martín', 'C/ Uría 18', '3ºA', 'Oviedo', 'Asturias', '33003', 'España', TRUE),
(6, 'Casa', 'Carlos Sánchez', 'C/ Hernán Cortés 7', NULL, 'Bilbao', 'País Vasco', '48001', 'España', TRUE),
(7, 'Casa', 'Lucía Navarro', 'C/ San Fernando 22', 'Bajo', 'Zaragoza', 'Aragón', '50001', 'España', TRUE),
(8, 'Casa', 'Diego Romero', 'Paseo Marítimo 5', NULL, 'Málaga', 'Andalucía', '29001', 'España', TRUE),
(9, 'Casa', 'Paula Torres', 'C/ Real 9', '1º', 'Santander', 'Cantabria', '39001', 'España', TRUE),
(10, 'Casa', 'Hugo Díaz', 'C/ Alameda 14', NULL, 'Valladolid', 'Castilla y León', '47001', 'España', TRUE);

-- -------------------------
-- PRODUCTOS (10)
-- -------------------------
INSERT INTO productos (vendedor_id, sku, nombre, descripcion, precio, stock, activo) VALUES
(1, 'SKU-0001', 'Auriculares Bluetooth', 'Auriculares inalámbricos con micrófono', 29.99, 150, TRUE),
(2, 'SKU-0002', 'Teclado Mecánico', 'Teclado mecánico con retroiluminación', 79.90, 60, TRUE),
(3, 'SKU-0003', 'Camiseta Básica', 'Camiseta 100% algodón', 12.50, 300, TRUE),
(4, 'SKU-0004', 'Set de Sartenes', 'Juego de 3 sartenes antiadherentes', 45.00, 40, TRUE),
(5, 'SKU-0005', 'Esterilla de Yoga', 'Esterilla antideslizante', 19.95, 120, TRUE),
(6, 'SKU-0006', 'Pack de Conservas Gourmet', 'Selección de conservas artesanas', 34.75, 80, TRUE),
(7, 'SKU-0007', 'Novela Histórica', 'Libro en tapa blanda', 16.99, 200, TRUE),
(8, 'SKU-0008', 'Juego de Construcción', 'Bloques para niños 6+', 24.90, 90, TRUE),
(10,'SKU-0009', 'Botella Reutilizable', 'Acero inoxidable 750ml', 14.30, 250, TRUE),
(1, 'SKU-0010', 'Cargador USB-C 65W', 'Cargador rápido USB-C', 22.00, 110, TRUE);

-- -------------------------
-- PEDIDOS (10)
-- -------------------------
INSERT INTO pedidos (direccion_envio_id, estado, realizado_en) VALUES
(1, 'pagado',     '2026-01-05 10:15:00+01'),
(2, 'pagado',     '2026-01-08 18:40:00+01'),
(3, 'enviado',    '2026-01-10 09:05:00+01'),
(4, 'creado',     '2026-01-12 12:20:00+01'),
(5, 'pagado',     '2026-01-15 20:10:00+01'),
(6, 'entregado',  '2026-01-18 14:55:00+01'),
(7, 'creado',     '2026-01-20 11:35:00+01'),
(8, 'pagado',     '2026-01-22 16:05:00+01'),
(9, 'cancelado',  '2026-01-24 08:50:00+01'),
(10,'pagado',      '2026-01-28 19:25:00+01');

-- -------------------------
-- LINEAS_PEDIDO (10)
-- Nota: el pedido 3 es multivendedor (producto 3 y producto 6 de vendedores distintos).
-- El pedido 7 queda sin líneas en este set (para mantener 10 filas exactas).
-- -------------------------
INSERT INTO lineas_pedido (pedido_id, producto_id, cantidad, precio_unitario) VALUES
(1,  1, 2, 29.99),
(2,  2, 1, 79.90),
(3,  3, 2, 12.50),  -- vendedor 3
(3,  6, 1, 34.75),  -- vendedor 6 (mismo pedido, distinto vendedor)
(4,  4, 1, 45.00),
(5,  5, 3, 19.95),
(6,  7, 1, 16.99),
(8,  8, 2, 24.90),
(9,  9, 1, 14.30),
(10,10, 2, 22.00);

-- -------------------------
-- PAGOS (10)
-- -------------------------
INSERT INTO pagos (pedido_id, metodo, importe, estado, pagado_en, referencia_transaccion) VALUES
(1,  'tarjeta',        59.98, 'pagado',      '2026-01-05 10:16:00+01', 'TXN-20260105-0001'),
(2,  'paypal',         79.90, 'pagado',      '2026-01-08 18:41:00+01', 'TXN-20260108-0002'),
(3,  'tarjeta',        59.75, 'pagado',      '2026-01-10 09:06:00+01', 'TXN-20260110-0003'),
(4,  'transferencia',  45.00, 'pendiente',   NULL,                    'TXN-20260112-0004'),
(5,  'bizum',          59.85, 'pagado',      '2026-01-15 20:12:00+01', 'TXN-20260115-0005'),
(6,  'tarjeta',        16.99, 'pagado',      '2026-01-18 14:56:00+01', 'TXN-20260118-0006'),
(7,  'paypal',          0.00, 'pendiente',   NULL,                    'TXN-20260120-0007'),
(8,  'tarjeta',        49.80, 'pagado',      '2026-01-22 16:06:00+01', 'TXN-20260122-0008'),
(9,  'tarjeta',        14.30, 'reembolsado', '2026-01-24 09:10:00+01', 'TXN-20260124-0009'),
(10, 'bizum',          44.00, 'pagado',      '2026-01-28 19:26:00+01', 'TXN-20260128-0010');