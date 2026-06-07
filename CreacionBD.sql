-- ============================================================================
-- SCRIPT DE CREACIÓN DE BASE DE DATOS - SISEG (SISTEMA DE SEGUROS)
-- VERSION REFACTORIZADA (NORMALIZACIÓN Y AJUSTES DE TIPOS DE DATOS)
-- ============================================================================
CREATE DATABASE IF NOT EXISTS siseg_db;
USE siseg_db;

-- 1. Creación de la tabla CLIENTE
-- Se ajustan DNI/CUIL y Teléfono a VARCHAR para garantizar consistencia de formatos
CREATE TABLE CLIENTE (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(16) UNIQUE NOT NULL, -- Soporta formato de DNI estándar o CUIL (ej. 20-38765432-9)
    direccion VARCHAR(255),
    mail VARCHAR(100) UNIQUE,
    telefono VARCHAR(20)            -- Modificado de INT a VARCHAR para evitar desbordamientos y admitir prefijos
);

-- 2. Creación de la tabla BIEN
-- Se remueve el campo 'estado' por simplificación del alcance de negocio
CREATE TABLE BIEN (
    bien_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),                -- Línea de negocio: 'PEQUEÑOS ELECTRODOMESTICOS'
    marca VARCHAR(50),
    modelo VARCHAR(50)
);

-- 3. Creación de la tabla POLIZA
-- Se remueve el campo redundante 'tipo' dado que el dominio del sistema está acotado
CREATE TABLE POLIZA (
    poliza_id INT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(50),             -- Estados de gestión de la póliza (ej. 'VIGENTE', 'PENDIENTE')
    id_cliente INT NOT NULL,
    id_bien INT NOT NULL,
    
    CONSTRAINT fk_poliza_cliente
        FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(cliente_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
        
    CONSTRAINT fk_poliza_bien
        FOREIGN KEY (id_bien) 
        REFERENCES BIEN(bien_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 4. Creación de la tabla RECLAMO
CREATE TABLE RECLAMO (
    reclamo_id INT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    estado VARCHAR(50),             -- Estados del reclamo (ej. 'OPEN', 'CLOSE')
    id_poliza INT NOT NULL,
    
    CONSTRAINT fk_reclamo_poliza
        FOREIGN KEY (id_poliza) 
        REFERENCES POLIZA(poliza_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);