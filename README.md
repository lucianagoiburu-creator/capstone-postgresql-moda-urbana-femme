# Proyecto Capstone - Análisis Exploratorio de Datos con PostgreSQL

# Moda Urbana Femme

## ¿De qué trata este proyecto?

Moda Urbana Femme es un e-commerce ficticio de indumentaria femenina que busca comprender mejor el comportamiento de sus clientas para tomar decisiones comerciales basadas en datos.

A partir de información sobre clientes, productos y pedidos, se construyó una base de datos en PostgreSQL con el objetivo de responder preguntas que suelen surgir en cualquier negocio digital: quiénes son las mejores clientas, qué productos tienen menor rotación, cómo evolucionan las ventas a lo largo del tiempo y cuáles son las categorías con mejor desempeño.

Más allá de generar consultas SQL, el foco del proyecto estuvo en transformar datos en información útil para la toma de decisiones.

---

## El desafío de negocio

Todo e-commerce genera grandes volúmenes de información, pero disponer de datos no garantiza obtener conocimiento.

El desafío consiste en convertir registros de ventas en información que permita entender mejor a las clientas y detectar oportunidades de crecimiento.

Para este análisis se trabajó sobre tres dimensiones principales:

- Clientes que generan mayor valor para el negocio.
- Comportamiento de las ventas a lo largo del tiempo.
- Desempeño de los productos dentro del catálogo.

---

## Estructura de la base de datos

El modelo fue diseñado a partir de tres tablas relacionadas entre sí:

### Clientes

Contiene la información de las clientas registradas en la tienda.

### Productos

Representa el catálogo de prendas disponibles para la venta, incluyendo categoría y precio.

### Pedidos

Registra cada compra realizada y funciona como punto de conexión entre clientes y productos.

La relación entre las tablas se implementó mediante claves foráneas para garantizar la integridad de los datos y asegurar la consistencia de la información analizada.

---

## Preparación y calidad de los datos

Antes de comenzar cualquier análisis se realizó una validación básica de calidad de datos.

Se verificó la existencia de valores nulos en campos críticos como precios y fechas de compra y se aplicó la función `COALESCE()` para asegurar que dichos valores no afectaran los resultados del análisis.

Aunque se trata de un conjunto de datos de práctica, esta etapa refleja una tarea habitual dentro del trabajo de un analista: asegurar que la información sea confiable antes de extraer conclusiones.

---

## Análisis realizados

### Top 5 clientas por gasto total

El primer análisis estuvo orientado a identificar cuáles son las clientas que más ingresos generan para el negocio.

Este tipo de información permite diseñar estrategias de fidelización, programas de beneficios y campañas segmentadas dirigidas a los perfiles de mayor valor.

### Evolución mensual de las ventas

Se analizaron las ventas agrupadas por mes para observar posibles patrones de crecimiento o variaciones en la demanda.

Comprender cómo evoluciona la facturación en el tiempo ayuda a planificar acciones comerciales, gestionar inventario y anticipar necesidades futuras.

### Productos con menor nivel de ventas

También se identificaron los productos con menor cantidad de unidades vendidas.

Este análisis resulta especialmente útil para detectar artículos con baja rotación y evaluar posibles acciones como promociones, descuentos o ajustes en la estrategia comercial.

### Ranking de productos por categoría

Finalmente se utilizó la función de ventana `RANK()` para comparar el desempeño de los productos dentro de cada categoría.

Este enfoque permite entender no solo qué productos venden más, sino también cómo se posicionan frente a otros artículos similares dentro del catálogo.

---

## Tecnologías utilizadas

- PostgreSQL
- pgAdmin
- SQL
- GitHub

---

## Archivos incluidos

### Estructura.sql

Contiene la creación de la base de datos, las tablas, las relaciones entre ellas y la carga inicial de datos.

### Analisis.sql

Incluye las tareas de validación y limpieza de datos, junto con las consultas utilizadas para responder las preguntas de negocio planteadas.

---

## Cómo ejecutar el proyecto

1. Crear la base de datos en PostgreSQL.
2. Ejecutar el archivo `Estructura.sql`.
3. Ejecutar el archivo `Analisis.sql`.
4. Analizar los resultados obtenidos por cada consulta.

---

## Conclusiones

Este proyecto permitió recorrer el flujo completo de un análisis exploratorio de datos utilizando PostgreSQL: desde el modelado de la base de datos hasta la interpretación de resultados.

Los análisis desarrollados muestran cómo consultas relativamente simples pueden transformarse en información valiosa para comprender mejor a las clientas, evaluar el desempeño de los productos y acompañar la toma de decisiones comerciales.

En definitiva, el mayor valor de los datos no está en almacenarlos, sino en convertirlos en conocimiento que ayude al negocio a crecer.

---
