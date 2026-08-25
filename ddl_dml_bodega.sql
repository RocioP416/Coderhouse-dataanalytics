-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Rocio
-- Fecha: 25-8-2026
-- ══════════════════════════════════════════

--ELIMINAR TABLA INVENTARIOS EXISTENTE ---- 
DROP TABLE IF EXISTS inventario;

-- ══════════════════════════ SECCION DDL 
-- CREAR TABLA INVENTARIO, campos y tipo de datos-----
CREATE TABLE inventario (
id_producto INT NOT NULL IDENTITY (1,1) PRIMARY KEY,
nombre_producto VARCHAR(100),
categoria VARCHAR(50),
precio_unitario DECIMAL(10,2),
stock_actual INT,
stock_minimo INT, --- valor entero al tratarse de stock
fecha_ingreso DATE, --- tipo de dato fecha por tratarse de fecha ingreso 
activo TINYINT); --- valores pequeños para verificar estado de actividad

-- ═══════════════════════════ SECCION DML 
--- INSERTAR REGISTROS DENTRO DE LA TABLA INVENTARIO --- 
INSERT INTO inventario 
VALUES 
('Laptop Pro 15','Computacion',1200.00,15,3,'2024-01-10',1),
('Mouse Inalambrico','Accesorios',28.00,80,10,'2024-01-10',1),
('Monitor 4K 27"','Computacion',450.00,12,2,'2024-01-15',1),
('Teclado Mecanico','Accesorios',95.00,40,5,'2024-01-15',1),
('Laptop Basic 14','Computacion',650.00,20,3,'2024-02-01',1),
('Auriculares BT Pro','Audio',120.00,35,5,'2024-02-01',1),
('Hub USB-C 7 puertos','Accesorios',45.00,60,10,'2024-02-10',1),
('Webcam HD 1080p','Accesorios',85.00,25,5,'2024-02-10',1),
('SSD Externo 1TB','Almacenamiento',130.00,18,3,'2024-03-01',1),
('Parlante Bluetooth','Audio',60.00,45,8,'2024-03-01',1);

--- ACTUALIZACION DE REGISTROS DE STOCK ---- 
UPDATE inventario SET stock_actual = stock_actual - 3 
WHERE id_producto = 1;

UPDATE inventario SET stock_actual = stock_actual-12
WHERE id_producto = 2;

UPDATE inventario SET stock_actual = stock_actual-5
WHERE id_producto = 6;

-- ACTUALIZACION POR DESCONTINAR EL PRODUCTO ID=8 ---- 
UPDATE inventario SET activo = 0 
WHERE id_producto=8;

-- VALIDACION DE CODIGO --- 
select * from inventario;
