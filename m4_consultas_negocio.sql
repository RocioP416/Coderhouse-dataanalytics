USE Ventas_Tech_DB_1
SELECT * FROM ventas

--- Consulta 1- RESUMEN EJECUTIVO MENSUAL
---Total Facturado
SELECT 
MONTH (fecha_venta) AS Mes,
SUM (precio_unitario * cantidad) AS "Total Facturado" 
FROM ventas
GROUP BY MONTH (fecha_venta)
ORDER BY Mes

---Cantidad de Pedidos
SELECT
MONTH (fecha_venta) AS Mes,
COUNT (id_venta) AS "Cantidad_de_pedidos"
FROM ventas
GROUP by MONTH (fecha_venta)
ORDER BY Mes

---Ticket promedio de venta
SELECT 
MONTH (fecha_venta) AS Mes,
AVG (cantidad * precio_unitario) AS "Ticket promedio)"
FROM ventas
GROUP BY MONTH (fecha_venta)
ORDER BY Mes

---Consulta 2- Ranking de productos
SELECT
TOP 5 (id_producto),
SUM(cantidad) AS "cantidad_vendida",
SUM(cantidad * precio_unitario) AS "Total_generado"
FROM ventas
GROUP BY id_producto
ORDER BY Total_generado DESC

---Consulta 3- Clientes recurrentes
SELECT 
id_cliente,
COUNT (id_venta) AS "Cantidad_pedidos",
SUM (cantidad*precio_unitario) AS "Total_gastado"
FROM VENTAS
GROUP BY id_cliente
HAVING COUNT (id_venta) >1
ORDER BY "Total_gastado" DESC

---Consulta 4 — Meses por encima/por debajo del promedio
SELECT 
    Mes,
    Total_facturado,
    CASE 
        WHEN Total_facturado > AVG(Total_facturado) OVER() THEN 'Por encima'
        WHEN Total_facturado < AVG(Total_facturado) OVER() THEN 'Por debajo'
        ELSE 'En el promedio'
    END AS Estado
FROM (
    SELECT 
        MONTH(fecha_venta) AS Mes,
        SUM(cantidad * precio_unitario) AS Total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
) AS SubconsultaMensual
ORDER BY Mes;

---COMENTARIOS FINALES
---Los productos 1, 3 y 5 concentran más del 80% de los ingresos por ventas registrados
---El producto 2 es el maás vendido en cantidad pero representa solo el 5% de las ventas registradas.
---Los pedidos de los clientes 1 y 5 representaron cerca del 70% de las ventas registradas
