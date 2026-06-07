-- ============================================================================
-- SCRIPT DE CONSULTAS DE SELECCIÓN (SELECT) Y MANIPULACIÓN (DML)
-- ============================================================================

USE siseg_db;

-- ----------------------------------------------------------------------------
-- 1. CONSULTAS DE SELECCIÓN (DQL)
-- ----------------------------------------------------------------------------

-- Consulta A: Listar todas las pólizas con estado 'VIGENTE' junto a los datos del cliente asignado
SELECT 
    P.poliza_id, 
    P.fecha_fin, 
    C.nombre AS Cliente_Nombre, 
    C.apellido AS Cliente_Apellido, 
    C.dni AS CUIL
FROM POLIZA P 
JOIN CLIENTE C ON P.id_cliente = C.cliente_id 
WHERE P.estado = 'VIGENTE';


-- Consulta B: Buscar bienes asegurados filtrando por una marca específica (ej. 'Oster')
SELECT 
    bien_id, 
    nombre, 
    tipo, 
    modelo 
FROM BIEN 
WHERE marca = 'Oster';


-- Consulta C: Detalle integral de una póliza en particular (ej. 8001) mostrando Cliente y Bien
SELECT 
    P.poliza_id,
    C.nombre AS Nombre_Cliente, 
    C.apellido AS Apellido_Cliente, 
    B.nombre AS Bien_Asegurado, 
    B.marca AS Marca_Bien,
    P.fecha_inicio, 
    P.fecha_fin 
FROM POLIZA P 
JOIN CLIENTE C ON P.id_cliente = C.cliente_id 
JOIN BIEN B ON P.id_bien = B.bien_id 
WHERE P.poliza_id = 8001;


-- Consulta D: Pólizas en estado 'PENDIENTE' asociadas al cliente Martín Alderete
SELECT 
    P.poliza_id, 
    B.nombre AS Bien_Asegurado,
    B.marca,
    B.modelo,
    P.estado AS Estado_Poliza
FROM POLIZA P 
JOIN CLIENTE C ON P.id_cliente = C.cliente_id 
JOIN BIEN B ON P.id_bien = B.bien_id 
WHERE C.nombre = 'Martín' AND C.apellido = 'Alderete';


-- Consulta E: Listar mapeo general del sistema (Nombre completo de cliente, Bien y Estado de Póliza)
SELECT 
    C.nombre AS Cliente_Nombre, 
    C.apellido AS Cliente_Apellido, 
    B.nombre AS Objeto_Asegurado, 
    P.estado AS Estado_Seguro
FROM POLIZA P 
JOIN CLIENTE C ON P.id_cliente = C.cliente_id 
JOIN BIEN B ON P.id_bien = B.bien_id;


-- ----------------------------------------------------------------------------
-- 2. CONSULTAS DE MANIPULACIÓN DE DATOS (DML)
-- ----------------------------------------------------------------------------

-- Acción A: Modificar el estado de una póliza (Aprobación del estado PENDIENTE a VIGENTE)
UPDATE POLIZA 
SET estado = 'VIGENTE' 
WHERE poliza_id = 8003;


-- Acción B: Actualizar información de contacto de un cliente utilizando la consistencia de VARCHAR
UPDATE CLIENTE 
SET mail = 'martin.alderete.nuevo@mail.com', 
    direccion = 'Av. Alem 1200, San Miguel de Tucumán',
    telefono = '+543816677889'
WHERE cliente_id = 30;


-- Acción C: Registrar un nuevo reclamo técnico sobre una póliza existente
INSERT INTO RECLAMO (reclamo_id, descripcion, estado, id_poliza) 
VALUES (3, 'El motor de la batidora recalienta y genera olor a quemado a los 2 minutos de uso.', 'PENDIENTE', 8003);