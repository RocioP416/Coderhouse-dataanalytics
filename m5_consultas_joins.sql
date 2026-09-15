-- ============================================================================
-- Pre-entrega: Consultas con JOINs para el proyecto – Cruzando tablas para enriquecer el análisis
-- Aclaración: Inicialmente, se agrega el código para actualizar y expandir el modelo de datos propuesto en M3 
--              para poder realizar el analisis de la problematica definida en la pre-entrega 1. 
--              A PARTIR DE LA LINEA 107, SE RESUELVEN LAS CONSULTAS DE LA PRE-ENTREGA 5.
-- ============================================================================

USE Ventas_Tech_DB;

-- ----------------------------------------------------------------------------
-- CREACIÓN DE TABLAS NUEVAS
-- ----------------------------------------------------------------------------

-- Crear tabla Territorio 
CREATE TABLE territorio (
    id_territorio INT PRIMARY KEY,
    region VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    zona VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL);

-- Modificar la tabla Ventas para incluir los nuevos campos del modelo
ALTER TABLE ventas ADD canal VARCHAR(10) NOT NULL DEFAULT 'Online';
ALTER TABLE ventas ADD id_territorio INT;
ALTER TABLE ventas ADD descuentos CHAR(1);
ALTER TABLE ventas ADD fecha_entrega DATE;
ALTER TABLE ventas ADD forma_entrega VARCHAR(15);

-- Agregar la Foreign Key entre Ventas y territorio
ALTER TABLE ventas ADD CONSTRAINT fk_ventas_territorio 
FOREIGN KEY (id_territorio) REFERENCES territorio(id_territorio);

-- Crear tabla Reclamos
CREATE TABLE reclamos (
    id_reclamo INT PRIMARY KEY,
    id_ventas INT NOT NULL,
    id_producto INT NOT NULL,
    id_cliente INT NOT NULL,
    motivo_reclamo VARCHAR(50),
    fecha_reclamo DATE,
    estado_reclamo VARCHAR(10),
    fecha_cierre DATE,
    FOREIGN KEY (id_ventas) REFERENCES ventas(id_venta),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente));

-- ----------------------------------------------------------------------------
-- ACTUALIZACIÓN DE DATOS
-- ----------------------------------------------------------------------------

-- Carga de datos en la tabla Territorio
INSERT INTO territorio VALUES
(1, 'Pampa',   'Argentina', 'Centro', 'Buenos Aires'),
(2, 'Centro',  'Argentina', 'Centro', 'Córdoba'),
(3, 'Litoral', 'Argentina', 'Este',   'Rosario'),
(4, 'Cuyo',    'Argentina', 'Oeste',  'Mendoza'),
(5, 'NOA',     'Argentina', 'Norte',  'Tucumán')

-- Creación de nuevos clientes
INSERT INTO clientes VALUES
(6,  'Diego Martín',  'diego@mail.com',   'Buenos Aires', '2024-02-01'),
(7,  'Sofía Rossi',   'sofia@mail.com',   'Córdoba',      '2024-02-05'),
(8,  'Javier Pérez',  'javier@mail.com',  'Rosario',      '2024-02-10'),
(9,  'Lucía Blanco',  'lucia@mail.com',   'Mendoza',      '2024-02-15'),
(10, 'Gonzalo Diaz',  'gonzalo@mail.com', 'Tucumán',      '2024-02-20')

-- Actualización de las ventas pre-existentes (1 al 10) con los nuevos campos
UPDATE ventas SET canal = 'Online', id_territorio = 1, descuentos = 'S', fecha_entrega = '2024-03-08', forma_entrega = 'Domicilio' WHERE id_venta = 1;
UPDATE ventas SET canal = 'Online', id_territorio = 2, descuentos = 'N', fecha_entrega = '2024-03-09', forma_entrega = 'Domicilio' WHERE id_venta = 2;
UPDATE ventas SET canal = 'Online', id_territorio = 3, descuentos = 'S', fecha_entrega = '2024-03-12', forma_entrega = 'Correo'    WHERE id_venta = 3;
UPDATE ventas SET canal = 'Fisica', id_territorio = 1, descuentos = 'N', fecha_entrega = '2024-03-08', forma_entrega = 'Retiro Local' WHERE id_venta = 4;
UPDATE ventas SET canal = 'Online', id_territorio = 4, descuentos = 'S', fecha_entrega = '2024-03-15', forma_entrega = 'Correo'    WHERE id_venta = 5;
UPDATE ventas SET canal = 'Online', id_territorio = 2, descuentos = 'N', fecha_entrega = '2024-03-14', forma_entrega = 'Domicilio' WHERE id_venta = 6;
UPDATE ventas SET canal = 'Online', id_territorio = 5, descuentos = 'N', fecha_entrega = '2024-03-18', forma_entrega = 'Correo'    WHERE id_venta = 7;
UPDATE ventas SET canal = 'Online', id_territorio = 3, descuentos = 'S', fecha_entrega = '2024-03-16', forma_entrega = 'Domicilio' WHERE id_venta = 8;
UPDATE ventas SET canal = 'Fisica', id_territorio = 4, descuentos = 'N', fecha_entrega = '2024-03-14', forma_entrega = 'Retiro Local' WHERE id_venta = 9;
UPDATE ventas SET canal = 'Fisica', id_territorio = 5, descuentos = 'S', fecha_entrega = '2024-03-15', forma_entrega = 'Retiro Local' WHERE id_venta = 10;

-- Agregar de nuevas ventas 
INSERT INTO ventas VALUES
(11, 1, 2, 1,  28.00, '2024-02-15', 'Online', 1, 'N', '2024-02-17', 'Domicilio'),
(12, 2, 6, 1,  95.00, '2024-02-20', 'Online', 2, 'N', '2024-02-22', 'Domicilio'),
(13, 4, 2, 1,  28.00, '2024-03-01', 'Fisica', 4, 'N', '2024-03-01', 'Retiro Local'),
(14, 6, 5, 1, 130.00, '2024-03-05', 'Online', 1, 'N', '2024-03-07', 'Domicilio'),
(15, 8, 4, 1, 120.00, '2024-03-15', 'Fisica', 3, 'N', '2024-03-15', 'Retiro Local'),
(16, 9, 5, 2, 130.00, '2024-03-20', 'Online', 4, 'N', '2024-03-22', 'Domicilio')

-- Agregar nuevo producto 
INSERT INTO productos VALUES (7, 'Soporte Monitor Ergonómico', 2, 45.00, 15, 1);

-- Carga de datos en la tabla Reclamos
INSERT INTO reclamos VALUES
(1, 4, 5, 4, 'Demora en entrega',   '2024-02-06', 'Cerrado', '2024-02-10'),
(2, 5, 4, 5, 'Producto defectuoso', '2024-02-03', 'Cerrado', '2024-02-15'),
(3, 8, 1, 8, 'Demora en entrega',   '2024-03-01', 'Abierto', NULL)
INSERT INTO reclamos VALUES
(4, 3, 3, 3, 'Demora en entrega',   '2024-03-13', 'Cerrado', '2024-03-18'), 
(5, 7, 1, 5, 'Producto equivocado', '2024-03-19', 'Abierto', NULL),         
(6, 11, 2, 1, 'Empaque dañado',     '2024-02-18', 'Cerrado', '2024-02-22'), 
(7, 14, 5, 6, 'Demora en entrega',  '2024-03-08', 'Cerrado', '2024-03-15'), 
(8, 16, 5, 9, 'Producto defectuoso','2024-03-23', 'Abierto', NULL);         

UPDATE reclamos SET fecha_reclamo = '2024-03-09', estado_reclamo='Cerrado', fecha_cierre='2024-03-12' WHERE id_reclamo=1;
UPDATE reclamos SET fecha_reclamo = '2024-03-16', estado_reclamo='Cerrado', fecha_cierre='2024-03-20' WHERE id_reclamo=2;
UPDATE reclamos SET fecha_reclamo = '2024-03-17', estado_reclamo='Abierto' WHERE id_reclamo=3

-- ----------------------------------------------------------------------------
-- PRE-ENTREGA 5
-- ----------------------------------------------------------------------------

-- Consulta 1: Vista base del proyecto (INNER JOIN) - Datos de ventas con reclamos asociados
SELECT 
v.id_venta, v.fecha_venta,p.nombre_producto, ca.nombre_categoria as 'Categoria Prod', v.cantidad, (v.cantidad*v.precio_unitario) as 'Total venta',
v.id_cliente, c.nombre as 'Nombre cliente', v.canal as 'Canal', t.zona, r.motivo_reclamo as 'Motivo de Reclamo', r.estado_reclamo as 'Estado'
FROM ventas v
INNER JOIN clientes c
ON v.id_cliente=c.id_cliente
INNER JOIN productos p
ON v.id_producto=p.id_producto
INNER JOIN categorias ca
ON p.id_categoria=ca.id_categoria
INNER JOIN territorio t
ON v.id_territorio=t.id_territorio
LEFT JOIN reclamos r
ON v.id_venta=r.id_ventas

-- Consulta 2: Clientes sin ventas (LEFT JOIN)
SELECT 
c.id_cliente, c.nombre, c.email, c.fecha_registro 
FROM clientes c
LEFT JOIN ventas v
ON c.id_cliente=v.id_cliente
WHERE v.id_venta is NULL

-- Consulta 3: Productos sin ventas (LEFT JOIN) 
SELECT
p.id_producto, p.nombre_producto, ca.nombre_categoria, p.precio
FROM productos p
JOIN categorias ca
ON p.id_categoria=ca.id_categoria
LEFT JOIN ventas v
ON p.id_producto=v.id_producto
WHERE v.id_producto is null

-- Consulta 4: Consolidado por canal (UNION ALL)
SELECT
v.id_venta, v.fecha_venta,v.id_cliente, (v.cantidad*v.precio_unitario) as 'Total Venta','Online' as Canal
FROM ventas v
WHERE id_cliente =2
UNION ALL
SELECT 
v.id_venta, v.fecha_venta, v.id_cliente, (v.cantidad*v.precio_unitario) as 'Total Venta', 'Tienda física' as Canal
FROM ventas v
Where id_cliente = 4
ORDER BY v.fecha_venta;
