-- ============================================================================
-- SCRIPT DE INSERCIÓN DE DATOS DE PRUEBA (POBLAR BASE DE DATOS)
-- VERSION ADAPTADA AL NUEVO MODELO DE SISEG
-- ============================================================================

USE siseg_db;

-- Desactivar temporalmente restricciones para una inserción limpia en desarrollo
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE RECLAMO;
TRUNCATE TABLE POLIZA;
TRUNCATE TABLE BIEN;
TRUNCATE TABLE CLIENTE;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Insertar Clientes (Utilizando formatos numéricos y CUIL con guiones en VARCHAR)
INSERT INTO CLIENTE (cliente_id, nombre, apellido, dni, direccion, mail, telefono) VALUES
(10, 'Julia', 'Ramirez', '27-25456789-4', 'Av. Mitre 450', 'julia.ramirez@mail.com', '+54 9 381 4556677'),
(20, 'Marcos', 'Fernandez', '20-30987654-3', 'Calle San Martín 1230', 'marcos.f@mail.com', '0381-154998877'),
(30, 'Martín', 'Alderete', '20-35123456-9', 'Barrio Norte Maza 4', 'martin.alderete@mail.com', '3815551234');

-- 2. Insertar Bienes (Se quita la columna 'estado' del insert)
INSERT INTO BIEN (bien_id, nombre, tipo, marca, modelo) VALUES
(1001, 'Cafetera Expresso', 'PEQUEÑOS ELECTRODOMESTICOS', 'Oster', 'PrimaLatte'),
(1002, 'Aspiradora Robot', 'PEQUEÑOS ELECTRODOMESTICOS', 'Xiaomi', 'Mi Vacuum 2'),
(1003, 'Batidora de Mano', 'PEQUEÑOS ELECTRODOMESTICOS', 'Phillips', 'HR3705');

-- 3. Insertar Pólizas (Se quita la columna redundante 'tipo' del insert)
INSERT INTO POLIZA (poliza_id, fecha_inicio, fecha_fin, estado, id_cliente, id_bien) VALUES
(8001, '2025-05-01', '2026-05-01', 'VIGENTE', 10, 1001),   -- Julia asegura su cafetera Oster
(8002, '2025-06-15', '2026-06-15', 'VIGENTE', 20, 1002),   -- Marcos asegura su aspiradora Xiaomi
(8003, '2026-01-10', '2027-01-10', 'PENDIENTE', 30, 1003); -- Martín tiene una póliza pendiente en su batidora

-- 4. Insertar Reclamos
INSERT INTO RECLAMO (reclamo_id, descripcion, estado, id_poliza) VALUES
(1, 'La cafetera no enciende tras golpe de tensión en la línea del hogar.', 'EN REVISIÓN', 8001),
(2, 'Fallo en los sensores de proximidad de la aspiradora robot.', 'PENDIENTE', 8002);