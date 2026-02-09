-- =========================================================
-- Plataforma de Aprendizaje Corporativo - DDL (PostgreSQL)
-- =========================================================

-- -------------------------
-- EMPRESAS
-- -------------------------
CREATE TABLE empresas (
  empresa_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nombre      VARCHAR(160) NOT NULL UNIQUE,
  sector      VARCHAR(120) NOT NULL,
  creado_en   TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- -------------------------
-- EMPLEADOS
-- -------------------------
CREATE TABLE empleados (
  empleado_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  empresa_id   INT NOT NULL REFERENCES empresas(empresa_id) ON DELETE RESTRICT,
  nombre       VARCHAR(80) NOT NULL,
  apellidos    VARCHAR(120) NOT NULL,
  email        VARCHAR(160) NOT NULL UNIQUE,
  puesto       VARCHAR(120),
  fecha_alta   DATE NOT NULL DEFAULT CURRENT_DATE,
  creado_en    TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX idx_empleados_empresa ON empleados(empresa_id);

-- -------------------------
-- CURSOS
-- -------------------------
CREATE TABLE cursos (
  curso_id        INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  titulo          VARCHAR(200) NOT NULL,
  duracion_horas  INT NOT NULL,
  nivel           VARCHAR(20) NOT NULL,
  activo          BOOLEAN NOT NULL DEFAULT TRUE,
  creado_en       TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  CONSTRAINT chk_cursos_duracion CHECK (duracion_horas > 0),
  CONSTRAINT chk_cursos_nivel CHECK (nivel IN ('basico', 'intermedio', 'avanzado'))
);

CREATE INDEX idx_cursos_nivel ON cursos(nivel);

-- -------------------------
-- INSCRIPCIONES (N:M)
-- -------------------------
CREATE TABLE inscripciones (
  inscripcion_id     INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  empleado_id        INT NOT NULL REFERENCES empleados(empleado_id) ON DELETE CASCADE,
  curso_id           INT NOT NULL REFERENCES cursos(curso_id) ON DELETE RESTRICT,
  fecha_inscripcion  DATE NOT NULL DEFAULT CURRENT_DATE,
  CONSTRAINT uq_inscripcion_empleado_curso UNIQUE (empleado_id, curso_id)
);

CREATE INDEX idx_inscripciones_empleado ON inscripciones(empleado_id);
CREATE INDEX idx_inscripciones_curso ON inscripciones(curso_id);

-- -------------------------
-- PROGRESO (1:1 con INSCRIPCIONES)
-- -------------------------
CREATE TABLE progreso (
  progreso_id       INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  inscripcion_id    INT NOT NULL UNIQUE REFERENCES inscripciones(inscripcion_id) ON DELETE CASCADE,
  porcentaje_avance NUMERIC(5,2) NOT NULL DEFAULT 0,
  estado            VARCHAR(20) NOT NULL,
  ultima_actividad  DATE,
  fecha_completado  DATE,
  CONSTRAINT chk_progreso_porcentaje CHECK (porcentaje_avance BETWEEN 0 AND 100),
  CONSTRAINT chk_progreso_estado CHECK (estado IN ('inscrito', 'en_progreso', 'completado', 'abandonado')),
  CONSTRAINT chk_progreso_completado
    CHECK (
      (estado <> 'completado' AND fecha_completado IS NULL)
      OR
      (estado = 'completado' AND fecha_completado IS NOT NULL AND porcentaje_avance = 100)
    )
);

-- -------------------------
-- CERTIFICACIONES (0..1 por INSCRIPCION)
-- -------------------------
CREATE TABLE certificaciones (
  certificacion_id  INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  inscripcion_id    INT NOT NULL UNIQUE REFERENCES inscripciones(inscripcion_id) ON DELETE CASCADE,
  codigo            VARCHAR(40) NOT NULL UNIQUE,
  emitido_en        DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE INDEX idx_certificaciones_emitido_en ON certificaciones(emitido_en);
