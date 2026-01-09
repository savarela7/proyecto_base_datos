-- =========================
-- CREACIÓN DEL ESQUEMA
-- =========================

CREATE SCHEMA gimnasio;

-- =========================
-- TABLAS MAESTRAS
-- =========================

CREATE TABLE gimnasio.Cliente (
  id_cliente SERIAL PRIMARY KEY,
  tipo_identificacion VARCHAR(10) NOT NULL
    CHECK (tipo_identificacion IN ('CEDULA', 'PASAPORTE')),
  identificacion VARCHAR(13) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  telefono VARCHAR(20),
  email VARCHAR(255) UNIQUE,
  fecha_nacimiento DATE,
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP,
  UNIQUE (tipo_identificacion, identificacion)
);

CREATE TABLE gimnasio.Membresia (
  id_membresia SERIAL PRIMARY KEY,
  tipo VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL CHECK (precio >= 0),
  duracion_meses INT NOT NULL CHECK (duracion_meses > 0),
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP
);

CREATE TABLE gimnasio.Entrenador (
  id_entrenador SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(100),
  telefono VARCHAR(20),
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP
);

-- =========================
-- TABLAS TRANSACCIONALES
-- =========================

CREATE TABLE gimnasio.Inscripcion (
  id_inscripcion SERIAL PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_membresia INT NOT NULL,
  fecha_inicio DATE NOT NULL,
  fecha_fin DATE NOT NULL,
  estado VARCHAR(20) DEFAULT 'ACTIVA'
    CHECK (estado IN ('ACTIVA', 'VENCIDA', 'CANCELADA')),
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP,
  FOREIGN KEY (id_cliente) REFERENCES gimnasio.Cliente(id_cliente),
  FOREIGN KEY (id_membresia) REFERENCES gimnasio.Membresia(id_membresia)
);

CREATE TABLE gimnasio.Pago (
  id_pago SERIAL PRIMARY KEY,
  id_inscripcion INT NOT NULL,
  fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  monto DECIMAL(10,2) NOT NULL CHECK (monto >= 0),
  metodo_pago VARCHAR(20)
    CHECK (metodo_pago IN ('EFECTIVO', 'TRANSFERENCIA', 'TARJETA')),
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP,
  FOREIGN KEY (id_inscripcion) REFERENCES gimnasio.Inscripcion(id_inscripcion)
);

CREATE TABLE gimnasio.Clase (
  id_clase SERIAL PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  horario VARCHAR(50) NOT NULL,
  id_entrenador INT NOT NULL,
  cupo_maximo INT CHECK (cupo_maximo > 0),
  activo BOOLEAN DEFAULT TRUE,
  creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  actualizado_en TIMESTAMP,
  FOREIGN KEY (id_entrenador) REFERENCES gimnasio.Entrenador(id_entrenador)
);

