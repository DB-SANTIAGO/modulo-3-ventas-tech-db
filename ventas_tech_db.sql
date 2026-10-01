-- SECCIÓN 1: DROP
 
USE master;
GO
 
IF DB_ID('Ventas_Tech_DB') IS NOT NULL
BEGIN
DROP DATABASE Ventas_Tech_DB;
END
GO
 
-- SECCIÓN 2: CREATE DATABASE
 
CREATE DATABASE Ventas_Tech_DB;
GO
 
USE Ventas_Tech_DB;
GO
 
-- TABLA: CATEGORIAS
 
CREATE TABLE categorias (
id_categoria INT IDENTITY(1,1) PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
descripcion VARCHAR(200)
);
GO
 
-- TABLA: CLIENTES
 
CREATE TABLE clientes (
id_cliente INT IDENTITY(1,1) PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
telefono VARCHAR(20),
fecha_registro DATE DEFAULT CAST(GETDATE() AS DATE)
);
GO
 
-- TABLA: PRODUCTOS
 
CREATE TABLE productos (
id_producto INT IDENTITY(1,1) PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
stock INT NOT NULL DEFAULT 0,
id_categoria INT NOT NULL,
 
CONSTRAINT FK_productos_categorias
FOREIGN KEY (id_categoria)
REFERENCES categorias(id_categoria)
);
GO
 
-- TABLA: VENTAS
 
CREATE TABLE ventas (
id_venta INT IDENTITY(1,1) PRIMARY KEY,
id_cliente INT NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL,
fecha_venta DATE DEFAULT CAST(GETDATE() AS DATE),
 
CONSTRAINT FK_ventas_clientes
FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente),
 
CONSTRAINT FK_ventas_productos
FOREIGN KEY (id_producto)
REFERENCES productos(id_producto)
);
GO
 
-- SECCIÓN 3: INSERT
 
-- CATEGORÍAS (4 REGISTROS)
 
INSERT INTO categorias (nombre_categoria, descripcion)
VALUES
('Laptops', 'Computadoras portatiles para uso personal y profesional'),
('Componentes', 'Componentes internos para computadoras'),
('Perifericos', 'Dispositivos de entrada y salida'),
('Monitores', 'Pantallas y monitores para escritorio');
GO
 
-- CLIENTES (5 REGISTROS)
 
INSERT INTO clientes (nombre, email, telefono)
VALUES
('Juan Perez', 'juan.perez@email.com', '2966123456'),
('Maria Gomez', 'maria.gomez@email.com', '2966234567'),
('Carlos Lopez', 'carlos.lopez@email.com', '2966345678'),
('Ana Rodriguez', 'ana.rodriguez@email.com', '2966456789'),
('Lucia Fernandez', 'lucia.fernandez@email.com', '2966567890');
GO
 
-- PRODUCTOS (6 REGISTROS)
 
INSERT INTO productos
(nombre_producto, precio, stock, id_categoria)
VALUES
('Notebook Lenovo IdeaPad', 850000.00, 10, 1),
('Notebook HP 15', 920000.00, 8, 1),
('SSD Kingston 1TB', 120000.00, 20, 2),
('Mouse Logitech M280', 30000.00, 25, 3),
('Teclado Redragon Kumara', 55000.00, 15, 3),
('Monitor Samsung 24 Pulgadas', 210000.00, 12, 4);
GO
 
-- VENTAS (10 REGISTROS)
 
INSERT INTO ventas (id_cliente, id_producto, cantidad)
VALUES
(1, 1, 1),
(2, 4, 2),
(3, 3, 1),
(4, 6, 1),
(5, 5, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(4, 5, 2),
(5, 6, 1);
GO
 
-- SECCIÓN 4: VALIDACIÓN
 
SELECT COUNT(*) AS total_categorias
FROM categorias;
GO
 
SELECT COUNT(*) AS total_clientes
FROM clientes;
GO
 
SELECT COUNT(*) AS total_productos
FROM productos;
GO
 
SELECT COUNT(*) AS total_ventas
FROM ventas;
GO

-- CONSULTAS DE VERIFICACIÓN ADICIONALES
 
SELECT * FROM categorias;
GO
 
SELECT * FROM clientes;
GO
 
SELECT * FROM productos;
GO
 
SELECT * FROM ventas;
GO
