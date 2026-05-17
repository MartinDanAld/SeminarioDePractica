-- ----------------------------------CONSULTAS DE SELECCION (SELECT)----------------------------------

-- Listar todas las pólizas Vigentes: Obtiene el ID, fecha de fin y el cliente de todas las pólizas cuyo estado es 'VIGENTE'.
SELECT P.poliza_id, P.fecha_fin, C.nombre, C.apellido FROM POLIZA P JOIN CLIENTE C ON P.id_cliente = C.cliente_id WHERE P.estado = 'VIGENTE';

-- Buscar Bienes Asegurados por Marca: Obtiene todos los electrodomésticos asegurados de la marca 'Oster'.
SELECT bien_id, nombre, modelo, estado FROM BIEN WHERE marca = 'Oster';

-- Detalle Completo de una Póliza Específica: Muestra todos los datos de la póliza 8001: cliente, bien, tipo y vigencia.
SELECT C.nombre AS Cliente, B.nombre AS BienAsegurado, P.tipo, P.fecha_inicio, P.fecha_fin FROM POLIZA P JOIN CLIENTE C ON P.id_cliente = C.cliente_id JOIN BIEN B ON P.id_bien = B.bien_id WHERE P.poliza_id = 8001;

-- Pólizas Pendientes del Cliente Marcos Fernandez: Busca todas las pólizas con estado 'PENDIENTE' que pertenecen a un cliente específico.
SELECT P.poliza_id, B.nombre AS BienAsegurado FROM POLIZA P JOIN CLIENTE C ON P.id_cliente = C.cliente_id JOIN BIEN B ON P.id_bien = B.bien_id WHERE C.nombre = 'Marcos' AND C.apellido = 'Fernandez' AND P.estado = 'PENDIENTE';
SELECT P.poliza_id, B.nombre AS BienAsegurado FROM POLIZA P JOIN CLIENTE C ON P.id_cliente = C.cliente_id JOIN BIEN B ON P.id_bien = B.bien_id WHERE C.nombre = 'Julia' AND C.apellido = 'Ramirez' AND P.estado = 'PENDIENTE';

-- Bienes con Estado 'Nuevo': Cuenta cuántos bienes asegurados tienen la condición de 'Nuevo'.
SELECT COUNT(bien_id) AS TotalNuevos FROM BIEN WHERE estado = 'Nuevo';

-- Listar el nombre completo del cliente, el nombre del bien asegurado, el tipo de póliza y su estado, uniendo las tablas CLIENTE, POLIZA y BIEN.
SELECT C.nombre, C.apellido, B.nombre AS NombreBien, P.tipo AS TipoPoliza, P.estado FROM POLIZA P JOIN CLIENTE C ON P.id_cliente = C.cliente_id JOIN BIEN B ON P.id_bien = B.bien_id;



-- ----------------------------------CONSULTAS DE MANIPULACION DE DATOS (DML)----------------------------------

-- Actualizar el Estado de una Póliza: Cambia el estado de la póliza 8003 de 'PENDIENTE' a 'VIGENTE' (simulando la aprobación final).
UPDATE POLIZA SET estado = 'VIGENTE' WHERE poliza_id = 8003;

-- Actualizar Datos de un Cliente: Cambia el correo electrónico y la dirección de un cliente.
UPDATE CLIENTE SET mail = 'nuevo.mail@empresa.com', direccion = 'Calle Falsa 123' WHERE cliente_id = 10;

-- Registrar un Nuevo Reclamo: Inserta un nuevo registro en la tabla RECLAMO asociado a una póliza existente (8002).
INSERT INTO RECLAMO (reclamo_id, descripcion, estado, id_poliza) VALUES (3, 'Fallo al encender tras 6 meses de uso.', 'INICIADO', 8002);

-- Eliminar un Bien no Asegurado: Elimina un bien que no tiene ninguna póliza asociada (en un sistema real, esto requeriría verificar que no haya FKs activas o que se eliminen las pólizas primero).
DELETE FROM RECLAMO WHERE reclamo_id = 3;