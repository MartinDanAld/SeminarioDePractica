-- 1. Creación de la tabla CLIENTE
CREATE TABLE CLIENTE (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni VARCHAR(20) UNIQUE,
    direccion VARCHAR(255),
    mail VARCHAR(100) UNIQUE,
    telefono INT
);

-- 2. Creación de la tabla BIEN
CREATE TABLE BIEN (
    bien_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    estado VARCHAR(50)
);

-- 3. Creación de la tabla POLIZA
CREATE TABLE POLIZA (
    poliza_id INT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado VARCHAR(50),
    
    id_cliente INT NOT NULL,
    id_bien INT NOT NULL,
    
    CONSTRAINT fk_poliza_cliente
        FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(cliente_id),
        
    CONSTRAINT fk_poliza_bien
        FOREIGN KEY (id_bien) 
        REFERENCES BIEN(bien_id)
);

-- 4. Creación de la tabla RECLAMO
CREATE TABLE RECLAMO (
    reclamo_id INT PRIMARY KEY,
    descripcion TEXT NOT NULL,
    estado VARCHAR(50),
    
    id_poliza INT NOT NULL,
    
    CONSTRAINT fk_reclamo_poliza
        FOREIGN KEY (id_poliza) 
        REFERENCES POLIZA(poliza_id)
);