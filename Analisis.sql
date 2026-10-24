/*
El objetivo de este análisis es estudiar el comportamiento de compra
de las clientas de un e-commerce de ropa femenina mediante consultas SQL.

Se realizarán procesos de validación y limpieza de datos utilizando COALESCE,
integración de información mediante JOINs, análisis de ventas con GROUP BY
y aplicación de funciones avanzadas como RANK() para generar información útil
para la toma de decisiones comerciales.

Los resultados permitirán identificar las clientas con mayor gasto,
analizar la evolución de las ventas, detectar productos con bajo rendimiento
y evaluar el desempeño de los productos dentro de cada categoría.
*/

-- Verificar precios nulos
SELECT *
FROM productos
WHERE precio IS NULL;

-- Verificar fechas nulas
SELECT *
FROM pedidos
WHERE fecha_pedido IS NULL;


/*
Control de calidad de datos.
Si existieran precios nulos, se reemplazarían por 0.
*/

SELECT
    nombre_producto,
    COALESCE(precio,0) AS precio_limpio
FROM productos;

/*
Control de calidad de fechas.
Si una fecha fuera nula, se utiliza la fecha actual.
*/

SELECT
    id_pedido,
    COALESCE(fecha_pedido,CURRENT_DATE) AS fecha_corregida
FROM pedidos;


/*
Identificamos las clientas más valiosas para enfocar
acciones de fidelización.
*/

SELECT
    c.nombre,
    SUM(p.total) AS gasto_total
FROM pedidos p
INNER JOIN clientes c
ON p.id_cliente = c.id_cliente
GROUP BY c.nombre
ORDER BY gasto_total DESC
LIMIT 5;

/*
Ventas totales x mes:Este análisis permite identificar tendencias de compra
y detectar períodos de mayor actividad comercial, filtrando para que no muestre NULOS.
*/

SELECT
    DATE_TRUNC('month', fecha_pedido) AS mes,
    SUM(total) AS ventas_totales
FROM pedidos
WHERE fecha_pedido is not null 
GROUP BY mes
ORDER BY mes;


/*
Porductos menos vendidos: Buscamos productos con bajo rendimiento
para evaluar promociones o cambios.
*/

SELECT
    pr.nombre_producto,
    SUM(pe.cantidad) AS unidades_vendidas
FROM pedidos pe
INNER JOIN productos pr
ON pe.id_producto = pr.id_producto
GROUP BY pr.nombre_producto
ORDER BY unidades_vendidas ASC
LIMIT 3;


/*
Consulta Ranking de productos x categoría: Nos permite identificar 
los productos mas vendidos x categoría.
*/

SELECT
    pr.categoria,
    pr.nombre_producto,
    SUM(pe.cantidad) AS cantidad_vendida,

    RANK() OVER(
        PARTITION BY pr.categoria
        ORDER BY SUM(pe.cantidad) DESC
    ) AS ranking_categoria

FROM pedidos pe
INNER JOIN productos pr
ON pe.id_producto = pr.id_producto

GROUP BY
    pr.categoria,
    pr.nombre_producto;

