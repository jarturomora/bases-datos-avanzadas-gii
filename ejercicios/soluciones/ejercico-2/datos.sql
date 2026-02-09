-- -------------------------
-- EMPRESAS (10)
-- -------------------------
INSERT INTO empresas (nombre, sector) VALUES
('AlfaTech', 'Tecnología'),
('BioSalud', 'Salud'),
('FinanCore', 'Finanzas'),
('LogiTrans', 'Logística'),
('RetailPlus', 'Retail'),
('EnerGreen', 'Energía'),
('IndusNova', 'Manufactura'),
('AeroWorks', 'Aeroespacial'),
('EduPro', 'Servicios profesionales'),
('FoodMarket', 'Alimentación');

-- -------------------------
-- EMPLEADOS (10)
-- -------------------------
INSERT INTO empleados (empresa_id, nombre, apellidos, email, puesto, fecha_alta) VALUES
(1, 'Ana',   'García',   'ana.garcia@alfatech.com',     'Analista de datos',     '2025-10-01'),
(2, 'Luis',  'Pérez',    'luis.perez@biosalud.com',     'Técnico de laboratorio','2025-09-15'),
(3, 'Marta', 'López',    'marta.lopez@financore.com',   'Contabilidad',          '2025-08-20'),
(4, 'Javier','Ruiz',     'javier.ruiz@logitrans.com',   'Operaciones',           '2025-11-05'),
(5, 'Sofía', 'Martín',   'sofia.martin@retailplus.com', 'Responsable de tienda', '2025-07-11'),
(6, 'Carlos','Sánchez',  'carlos.sanchez@energreen.com','Ingeniero de planta',   '2025-06-03'),
(7, 'Lucía', 'Navarro',  'lucia.navarro@indusnova.com', 'Calidad',               '2025-10-22'),
(8, 'Diego', 'Romero',   'diego.romero@aeroworks.com',  'Ingeniero junior',      '2025-12-01'),
(9, 'Paula', 'Torres',   'paula.torres@edupro.com',     'Consultora',            '2025-05-18'),
(10,'Hugo',  'Díaz',     'hugo.diaz@foodmarket.com',    'Compras',               '2025-09-02');

-- -------------------------
-- CURSOS (10)
-- -------------------------
INSERT INTO cursos (titulo, duracion_horas, nivel, activo) VALUES
('Introducción a SQL', 12, 'basico', TRUE),
('Power BI para informes', 16, 'intermedio', TRUE),
('Seguridad de la información', 10, 'basico', TRUE),
('Gestión de proyectos ágiles', 14, 'intermedio', TRUE),
('Python para automatización', 18, 'intermedio', TRUE),
('Fundamentos de Cloud', 15, 'basico', TRUE),
('Análisis avanzado de datos', 20, 'avanzado', TRUE),
('Arquitectura de microservicios', 22, 'avanzado', TRUE),
('Excel financiero', 12, 'basico', TRUE),
('Comunicación efectiva', 8, 'basico', TRUE);

-- -------------------------
-- INSCRIPCIONES (10)
-- (10 empleados, cada uno en 1 curso distinto para mantener 10 filas exactas)
-- -------------------------
INSERT INTO inscripciones (empleado_id, curso_id, fecha_inscripcion) VALUES
(1,  1, '2026-01-03'),
(2,  3, '2026-01-04'),
(3,  9, '2026-01-04'),
(4,  4, '2026-01-05'),
(5, 10, '2026-01-06'),
(6,  6, '2026-01-06'),
(7,  2, '2026-01-07'),
(8,  8, '2026-01-08'),
(9,  5, '2026-01-08'),
(10, 7, '2026-01-09');

-- -------------------------
-- PROGRESO (10)
-- (Cumple checks: completado => 100% + fecha_completado)
-- -------------------------
INSERT INTO progreso (inscripcion_id, porcentaje_avance, estado, ultima_actividad, fecha_completado) VALUES
(1,  100, 'completado',   '2026-01-15', '2026-01-15'),
(2,   40, 'en_progreso',  '2026-01-12', NULL),
(3,    0, 'inscrito',     NULL,         NULL),
(4,   75, 'en_progreso',  '2026-01-20', NULL),
(5,  100, 'completado',   '2026-01-18', '2026-01-18'),
(6,   20, 'en_progreso',  '2026-01-10', NULL),
(7,  100, 'completado',   '2026-01-22', '2026-01-22'),
(8,   10, 'en_progreso',  '2026-01-11', NULL),
(9,  100, 'completado',   '2026-01-25', '2026-01-25'),
(10,  55, 'en_progreso',  '2026-01-19', NULL);

-- -------------------------
-- CERTIFICACIONES (10)
-- (Regla de negocio: se emiten al completar.
-- Para tener 10 filas exactas, actualizamos progreso (10) a completado.
-- -------------------------

UPDATE progreso
SET porcentaje_avance = 100,
    estado = 'completado',
    ultima_actividad = COALESCE(ultima_actividad, CURRENT_DATE),
    fecha_completado = COALESCE(fecha_completado, CURRENT_DATE)
WHERE inscripcion_id IN (2,3,4,6,8,10);

-- Ahora insertamos 10 certificaciones (una por inscripción)
INSERT INTO certificaciones (inscripcion_id, codigo, emitido_en) VALUES
(1,  'CERT-2026-0001', '2026-01-15'),
(2,  'CERT-2026-0002', '2026-01-26'),
(3,  'CERT-2026-0003', '2026-01-26'),
(4,  'CERT-2026-0004', '2026-01-26'),
(5,  'CERT-2026-0005', '2026-01-18'),
(6,  'CERT-2026-0006', '2026-01-26'),
(7,  'CERT-2026-0007', '2026-01-22'),
(8,  'CERT-2026-0008', '2026-01-26'),
(9,  'CERT-2026-0009', '2026-01-25'),
(10, 'CERT-2026-0010', '2026-01-26');
