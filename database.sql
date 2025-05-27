create database IF NOT EXISTS  catedra;
Use
catedra;

CREATE TABLE IF NOT EXISTS clientes
(
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    nombre              VARCHAR(30)     NOT NULL,
    dui                 char(10) UNIQUE NOT NULL,
    tipo_persona        ENUM('Natural', 'Jurídica') NOT NULL,
    telefono            VARCHAR(20),
    correo              VARCHAR(100),
    direccion           TEXT,
    estado              ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    creado_por          VARCHAR(100),
    fecha_creacion      DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    fecha_inactivacion  DATETIME
);

CREATE TABLE IF NOT EXISTS  empleados
(
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    nombre              VARCHAR(30)     NOT NULL,
    dui                 char(10) UNIQUE NOT NULL,
    tipo_persona        ENUM('Natural', 'Jurídica') NOT NULL,
    tipo_contratacion   ENUM('Permanente', 'Por Horas') NOT NULL,
    telefono            VARCHAR(20),
    correo              VARCHAR(100),
    direccion           TEXT,
    estado              ENUM('Activo', 'Inactivo') DEFAULT 'Activo',
    creado_por          VARCHAR(100),
    fecha_creacion      DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    fecha_inactivacion  DATETIME
);

CREATE TABLE  IF NOT EXISTS  cotizaciones
(
    id             INT AUTO_INCREMENT PRIMARY KEY,
    cliente_dui     char(10) NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);

CREATE TABLE  IF NOT EXISTS  actividades
(
    id            INT AUTO_INCREMENT PRIMARY KEY,
    cotizacion_id INT NOT NULL,
    empleado_id   INT NOT NULL,
    titulo        VARCHAR(255),
    descripcion   TEXT,
    fecha_inicio  DATETIME,
    fecha_fin     DATETIME,
    horas         DECIMAL(5, 2),
    FOREIGN KEY (cotizacion_id) REFERENCES cotizaciones (id),
    FOREIGN KEY (empleado_id) REFERENCES empleados (id)
);







