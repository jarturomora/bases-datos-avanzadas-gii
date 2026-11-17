-- Actividad 1: modelo relacional de estaciones de servicio
-- PostgreSQL 14+
-- Ejecutar conectado a la base de datos en la que se quieran crear las tablas.

BEGIN;

CREATE TABLE provincia (
    provincia_id integer GENERATED ALWAYS AS IDENTITY,
    nombre varchar(100) NOT NULL,

    CONSTRAINT pk_provincia PRIMARY KEY (provincia_id),
    CONSTRAINT uq_provincia_nombre UNIQUE (nombre)
);

CREATE TABLE municipio (
    municipio_id integer GENERATED ALWAYS AS IDENTITY,
    provincia_id integer NOT NULL,
    nombre varchar(150) NOT NULL,

    CONSTRAINT pk_municipio PRIMARY KEY (municipio_id),
    CONSTRAINT fk_municipio_provincia
        FOREIGN KEY (provincia_id)
        REFERENCES provincia (provincia_id),
    CONSTRAINT uq_municipio_provincia_nombre
        UNIQUE (provincia_id, nombre)
);

CREATE TABLE localidad (
    localidad_id integer GENERATED ALWAYS AS IDENTITY,
    municipio_id integer NOT NULL,
    nombre varchar(150) NOT NULL,

    CONSTRAINT pk_localidad PRIMARY KEY (localidad_id),
    CONSTRAINT fk_localidad_municipio
        FOREIGN KEY (municipio_id)
        REFERENCES municipio (municipio_id),
    CONSTRAINT uq_localidad_municipio_nombre
        UNIQUE (municipio_id, nombre)
);

CREATE TABLE empresa (
    empresa_id integer GENERATED ALWAYS AS IDENTITY,
    nombre_rotulo varchar(255) NOT NULL,

    CONSTRAINT pk_empresa PRIMARY KEY (empresa_id),
    CONSTRAINT uq_empresa_nombre_rotulo UNIQUE (nombre_rotulo)
);

CREATE TABLE estacion (
    estacion_id integer GENERATED ALWAYS AS IDENTITY,
    localidad_id integer NOT NULL,
    empresa_id integer,
    tipo_estacion varchar(9) NOT NULL,
    codigo_postal varchar(5) NOT NULL,
    direccion varchar(500) NOT NULL,
    margen char(1),
    longitud numeric(9, 6),
    latitud numeric(8, 6),
    fecha_actualizacion timestamp without time zone NOT NULL,
    tipo_venta varchar(100) NOT NULL,
    horario varchar(500) NOT NULL,
    tipo_servicio varchar(500),

    CONSTRAINT pk_estacion PRIMARY KEY (estacion_id),
    CONSTRAINT fk_estacion_localidad
        FOREIGN KEY (localidad_id)
        REFERENCES localidad (localidad_id),
    CONSTRAINT fk_estacion_empresa
        FOREIGN KEY (empresa_id)
        REFERENCES empresa (empresa_id),
    CONSTRAINT uq_estacion_ubicacion
        UNIQUE (tipo_estacion, localidad_id, codigo_postal, direccion),
    CONSTRAINT ck_estacion_tipo
        CHECK (tipo_estacion IN ('TERRESTRE', 'MARITIMA')),
    CONSTRAINT ck_estacion_codigo_postal
        CHECK (codigo_postal ~ '^[0-9]{5}$'),
    CONSTRAINT ck_estacion_margen
        CHECK (
            (tipo_estacion = 'TERRESTRE' AND margen IN ('D', 'I', 'N'))
            OR (tipo_estacion = 'MARITIMA' AND margen IS NULL)
        ),
    CONSTRAINT ck_estacion_tipo_servicio
        CHECK (
            (tipo_estacion = 'TERRESTRE' AND tipo_servicio IS NOT NULL)
            OR (tipo_estacion = 'MARITIMA' AND tipo_servicio IS NULL)
        ),
    CONSTRAINT ck_estacion_longitud
        CHECK (longitud BETWEEN -180 AND 180),
    CONSTRAINT ck_estacion_latitud
        CHECK (latitud BETWEEN -90 AND 90),
    CONSTRAINT ck_estacion_coordenadas
        CHECK (
            (longitud IS NULL AND latitud IS NULL)
            OR (longitud IS NOT NULL AND latitud IS NOT NULL)
        )
);

CREATE TABLE carburante (
    carburante_id integer GENERATED ALWAYS AS IDENTITY,
    nombre varchar(150) NOT NULL,

    CONSTRAINT pk_carburante PRIMARY KEY (carburante_id),
    CONSTRAINT uq_carburante_nombre UNIQUE (nombre)
);

CREATE TABLE precio_estacion (
    estacion_id integer NOT NULL,
    carburante_id integer NOT NULL,
    precio_euros numeric(8, 3) NOT NULL,
    porcentaje_biocomponente numeric(5, 2),

    CONSTRAINT pk_precio_estacion
        PRIMARY KEY (estacion_id, carburante_id),
    CONSTRAINT fk_precio_estacion_estacion
        FOREIGN KEY (estacion_id)
        REFERENCES estacion (estacion_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_precio_estacion_carburante
        FOREIGN KEY (carburante_id)
        REFERENCES carburante (carburante_id),
    CONSTRAINT ck_precio_estacion_precio
        CHECK (precio_euros > 0),
    CONSTRAINT ck_precio_estacion_porcentaje
        CHECK (
            porcentaje_biocomponente IS NULL
            OR porcentaje_biocomponente BETWEEN 0 AND 100
        )
);

-- Índices para las uniones y consultas requeridas en la actividad.
CREATE INDEX ix_municipio_provincia
    ON municipio (provincia_id);

CREATE INDEX ix_localidad_municipio
    ON localidad (municipio_id);

CREATE INDEX ix_estacion_empresa_tipo
    ON estacion (empresa_id, tipo_estacion);

CREATE INDEX ix_estacion_localidad
    ON estacion (localidad_id);

CREATE INDEX ix_estacion_coordenadas
    ON estacion (latitud, longitud)
    WHERE latitud IS NOT NULL AND longitud IS NOT NULL;

CREATE INDEX ix_precio_estacion_carburante_precio
    ON precio_estacion (carburante_id, precio_euros);

COMMENT ON TABLE estacion IS
    'Estaciones terrestres y postes marítimos procedentes de los ficheros del Ministerio.';

COMMENT ON COLUMN estacion.empresa_id IS
    'Puede ser nulo cuando el fichero de origen no informa el rótulo.';

COMMENT ON COLUMN estacion.fecha_actualizacion IS
    'Toma de datos para estaciones terrestres y fecha de generación del fichero para postes marítimos.';

COMMENT ON COLUMN precio_estacion.porcentaje_biocomponente IS
    'Porcentaje de bioalcohol o éster metílico cuando sea aplicable al carburante.';

COMMIT;
