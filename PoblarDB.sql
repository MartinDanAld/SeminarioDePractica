-- Insertar Datos de Prueba SQL (Actualizado para SISEG)

-- Insertar Clientes
INSERT INTO CLIENTE (cliente_id, nombre, apellido, dni, mail) VALUES
(10, 'Julia', 'Ramirez', '25456789X', 'julia.ramirez@mail.com'),
(20, 'Marcos', 'Fernandez', '30987654Z', 'marcos.f@mail.com');

-- Insertar Bienes
INSERT INTO BIEN (bien_id, nombre, tipo, marca, modelo, estado) VALUES
(1001, 'Cafetera Expresso', 'PEQUEÑOS ELECTRODOMESTICOS', 'Oster', 'PrimaLatte', 'Verificado'),
(1002, 'Aspiradora Robot', 'PEQUEÑOS ELECTRODOMESTICOS', 'Xiaomi', 'Mi Vacuum 2', 'NOVerificado'),
(1003, 'Batidora de Mano', 'PEQUEÑOS ELECTRODOMESTICOS', 'Phillips', 'HR3705', 'Verificado');

-- Insertar Pólizas
INSERT INTO POLIZA (poliza_id, tipo, fecha_inicio, fecha_fin, estado, id_cliente, id_bien) VALUES
(8001, 'PEQ. ELECTRODOMESTICOS', '2025-05-01', '2026-05-01', 'VIGENTE', 10, 1001), -- Julia asegura su cafetera
(8002, 'PEQ. ELECTRODOMESTICOS', '2025-06-15', '2026-06-15', 'VIGENTE', 20, 1002), -- Marcos asegura su aspiradora
(8003, 'PEQ. ELECTRODOMESTICOS', '2025-07-20', '2026-07-20', 'PENDIENTE', 10, 1003); -- Julia asegura su batidora]

-- Insertar Reclamos de Prueba SQL
INSERT INTO RECLAMO (reclamo_id, descripcion, estado, id_poliza) VALUES
(1, 'La aspiradora dejó de cargar completamente. Necesita servicio técnico.', 'EN_REVISION', 8002), -- Reclamo contra la póliza de Marcos
(2, 'Rotura de jarra. Reemplazo solicitado y aprobado.', 'FINALIZADO', 8001); -- Reclamo contra la póliza de Julia