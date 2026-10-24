-- =====================================
-- Base de Datos: ventas_ecommerce
-- Proyecto Final - PostgreSQL
-- =====================================

/*
Proyecto Final - Análisis Exploratorio de Datos (EDA) en PostgreSQL
Empresa: Moda Urbana Femme

Este archivo contiene la estructura de la base de datos del proyecto.
Incluye la creación de las tablas clientes, productos y pedidos, sus respectivas
relaciones mediante claves foráneas (Foreign Keys) y la carga inicial de datos.

El objetivo es modelar un escenario de e-commerce de indumentaria femenina
que permita realizar consultas y análisis de negocio utilizando PostgreSQL.
*/

-- Base de datos
CREATE DATABASE ventas_ecommerce;

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Tabla de productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio NUMERIC(10,2)
);

-- Tabla de pedidos
CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,

    id_cliente INTEGER NOT NULL,
    id_producto INTEGER NOT NULL,

    fecha_pedido DATE,
    cantidad INTEGER NOT NULL,
    total NUMERIC(10,2),

    CONSTRAINT fk_pedidos_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_pedidos_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);

-- Insertamos datos tabla clientes
INSERT INTO clientes (nombre,email) VALUES
('Lucia Fernandez','lucia@gmail.com'),
('Martina Lopez','martina@gmail.com'),
('Camila Rodriguez','camila@gmail.com'),
('Sofia Gutierrez','sofia@gmail.com'),
('Valentina Perez','valentina@gmail.com'),
('Micaela Torres','micaela@gmail.com'),
('Agustina Ruiz','agustina@gmail.com'),
('Florencia Diaz','florencia@gmail.com'),
('Julieta Castro','julieta@gmail.com'),
('Candela Romero','candela@gmail.com'),
('Victoria Molina','victoria@gmail.com'),
('Paula Silva','paula@gmail.com'),
('Melina Acosta','melina@gmail.com'),
('Noelia Vega','noelia@gmail.com'),
('Carolina Benitez','carolina@gmail.com'),
('Daniela Ortiz','daniela@gmail.com'),
('Brenda Gimenez','brenda@gmail.com'),
('Natalia Sosa','natalia@gmail.com'),
('Rocio Ibarra','rocio@gmail.com'),
('Milagros Suarez','milagros@gmail.com'),
('Constanza Arias','constanza@gmail.com'),
('Belen Gomez','belen@gmail.com'),
('Ailen Farias','ailen@gmail.com'),
('Tamara Luna','tamara@gmail.com'),
('Sol Martinez','sol@gmail.com'),
('Karen Rojas','karen@gmail.com'),
('Daiana Cabrera','daiana@gmail.com'),
('Lorena Varela','lorena@gmail.com'),
('Nadia Peralta','nadia@gmail.com'),
('Marina Quiroga','marina@gmail.com'),
('Cecilia Navarro','cecilia@gmail.com'),
('Antonella Fernández','antonella@gmail.com'),
('Mariela Sanchez','mariela@gmail.com'),
('Gabriela Rivero','gabriela@gmail.com'),
('Silvina Costa','silvina@gmail.com'),
('Ariana Lopez','ariana@gmail.com'),
('Bianca Gomez','bianca@gmail.com'),
('Eugenia Perez','eugenia@gmail.com'),
('Josefina Aguirre','josefina@gmail.com'),
('Mora Benitez','mora@gmail.com'),
('Emma Ruiz','emma@gmail.com'),
('Renata Silva','renata@gmail.com'),
('Olivia Torres','olivia@gmail.com'),
('Isabella Castro','isabella@gmail.com'),
('Catalina Diaz','catalina@gmail.com');

-- Insertamos datos tabla productos
INSERT INTO productos
(nombre_producto,categoria,precio)
values

('Vestido Floral','Vestidos',85000),
('Vestido Midi','Vestidos',92000),
('Vestido Negro Clásico','Vestidos',98000),

('Blazer Oversize','Blazers',120000),
('Blazer Beige','Blazers',115000),
('Blazer Negro','Blazers',NULL),

('Jean Wide Leg','Pantalones',78000),
('Pantalon Sastrero','Pantalones',83000),

('Camisa Satinada','Camisas',65000),
('Camisa Oxford','Camisas',62000),

('Top Básico','Remeras',28000),
('Remera Premium','Remeras',35000),

('Pollera Plisada','Polleras',55000),

('Tapado Largo','Abrigos',150000),
('Trench Beige','Abrigos',170000),

('Body Escote V','Bodies',45000);

-- Insertamos datos tabla pedidos
INSERT INTO pedidos
(id_cliente,id_producto,fecha_pedido,cantidad,total)
values
(1,1,'2026-01-05',1,85000),
(2,4,'2026-01-08',1,120000),
(3,6,'2026-01-10',2,156000),
(4,10,'2026-01-12',3,84000),
(5,13,'2026-01-15',1,150000),
(6,2,'2026-01-18',1,92000),
(7,7,'2026-01-20',2,166000),
(8,8,'2026-01-22',1,65000),
(9,15,'2026-01-25',2,90000),
(10,11,'2026-01-28',1,35000),

(11,1,'2026-02-02',1,85000),
(12,5,'2026-02-05',1,115000),
(13,3,'2026-02-06',1,98000),
(14,6,'2026-02-08',2,156000),
(15,14,'2026-02-10',1,170000),
(16,9,'2026-02-12',1,62000),
(17,10,'2026-02-15',2,56000),
(18,12,'2026-02-18',1,55000),
(19,4,'2026-02-20',1,120000),
(20,1,'2026-02-24',1,85000),

(21,13,'2026-03-03',1,150000),
(22,2,'2026-03-05',1,92000),
(23,7,'2026-03-08',1,83000),
(24,8,'2026-03-10',2,130000),
(25,5,'2026-03-12',1,115000),
(26,3,'2026-03-15',1,98000),
(27,10,'2026-03-18',3,84000),
(28,15,'2026-03-20',1,45000),
(29,6,'2026-03-23',2,156000),
(30,11,'2026-03-26',1,35000),

(31,1,'2026-04-02',1,85000),
(32,4,'2026-04-04',1,120000),
(33,13,'2026-04-08',1,150000),
(34,2,'2026-04-10',1,92000),
(35,9,'2026-04-14',2,124000),
(36,7,'2026-04-16',1,83000),
(37,14,'2026-04-18',1,170000),
(38,5,'2026-04-20',1,115000),
(39,10,'2026-04-23',2,56000),
(40,12,'2026-04-25',1,55000),

(41,1,'2026-05-03',2,170000),
(42,6,'2026-05-05',1,78000),
(43,3,'2026-05-08',1,98000),
(44,15,'2026-05-10',2,90000),
(45,13,'2026-05-14',1,150000),
(1,4,'2026-05-18',1,120000),
(2,2,'2026-05-20',2,184000),
(3,11,'2026-05-24',3,105000),
(4,7,'2026-05-27',1,83000),
(5,14,'2026-05-30',1,170000),
(1,1,NULL,1,85000);

--Validación de datos ingresados en las tablas
SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM pedidos;