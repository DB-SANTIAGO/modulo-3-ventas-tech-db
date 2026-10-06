--PROYECTO INTEGRADOR
--VENTAS_TECH_DB v2
--Autor: Santiago Gabriel Fraser
 
USE master;
GO

-- ELIMINAR BASE SI EXISTE
 
IF DB_ID('Ventas_Tech_DB') IS NOT NULL
BEGIN
    ALTER DATABASE Ventas_Tech_DB
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE Ventas_Tech_DB;
END
GO


-- CREAR BASE DE DATOS

CREATE DATABASE Ventas_Tech_DB;
GO

USE Ventas_Tech_DB;
GO

-- TABLA CATEGORIAS

CREATE TABLE categorias
(
    id_categoria INT IDENTITY(1,1),

    nombre_categoria VARCHAR(50) NOT NULL,

    descripcion VARCHAR(200),

    CONSTRAINT PK_categorias
        PRIMARY KEY (id_categoria),

    CONSTRAINT UQ_categorias_nombre
        UNIQUE (nombre_categoria)
);
GO

-- TABLA CLIENTES

CREATE TABLE clientes
(
    id_cliente INT IDENTITY(1,1),

    nombre VARCHAR(100) NOT NULL,

    email VARCHAR(100) NOT NULL,

    ciudad VARCHAR(50) NOT NULL,

    fecha_registro DATE NOT NULL
        DEFAULT (CAST(GETDATE() AS DATE)),

    CONSTRAINT PK_clientes
        PRIMARY KEY (id_cliente),

    CONSTRAINT UQ_clientes_email
        UNIQUE (email)
);
GO


-- TABLA PRODUCTOS

CREATE TABLE productos
(
    id_producto INT IDENTITY(1,1),

    nombre_producto VARCHAR(100) NOT NULL,

    precio DECIMAL(10,2) NOT NULL,

    stock INT NOT NULL
        DEFAULT 0,

    activo BIT NOT NULL
        DEFAULT 1,

    id_categoria INT NOT NULL,

    CONSTRAINT PK_productos
        PRIMARY KEY (id_producto),

    CONSTRAINT FK_productos_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);
GO

-- TABLA VENTAS

CREATE TABLE ventas
(
    id_venta INT IDENTITY(1,1),

    id_cliente INT NOT NULL,

    id_producto INT NOT NULL,

    cantidad INT NOT NULL,

    precio_unitario DECIMAL(10,2) NOT NULL,

    fecha_venta DATE NOT NULL,

    CONSTRAINT PK_ventas
        PRIMARY KEY (id_venta),

    CONSTRAINT FK_ventas_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT FK_ventas_producto
        FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
);
GO

-- INSERTAR CATEGORIAS

INSERT INTO categorias
(
    nombre_categoria,
    descripcion
)
VALUES
    ('Computación', 'Laptops, PCs y monitores'),
    ('Accesorios', 'Periféricos y complementos'),
    ('Audio', 'Auriculares y parlantes'),
    ('Almacenamiento', 'Discos y memorias');
GO

-- INSERTAR CLIENTES

INSERT INTO clientes
(
    nombre,
    email,
    ciudad,
    fecha_registro
)
VALUES
    ('María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
    ('Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
    ('Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
    ('Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
    ('Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');
GO

-- INSERTAR PRODUCTOS

INSERT INTO productos
(
    nombre_producto,
    id_categoria,
    precio,
    stock,
    activo
)
VALUES
    ('Laptop Pro 15',      1, 1200.00, 15, 1),
    ('Mouse Inalámbrico',  2,   28.00, 80, 1),
    ('Monitor 4K 27',      1,  450.00, 12, 1),
    ('Auriculares BT Pro', 3,  120.00, 35, 1),
    ('SSD Externo 1TB',    4,  130.00, 18, 1),
    ('Teclado Mecánico',   2,   95.00, 40, 1);
GO

-- INSERTAR VENTAS

INSERT INTO ventas
(
    id_cliente,
    id_producto,
    cantidad,
    precio_unitario,
    fecha_venta
)
VALUES
    (1, 1, 2, 1200.00, '2024-03-05'),
    (2, 2, 5,   28.00, '2024-03-06'),
    (3, 3, 1,  450.00, '2024-03-07'),
    (1, 4, 2,  120.00, '2024-03-08'),
    (4, 5, 3,  130.00, '2024-03-10'),
    (2, 6, 4,   95.00, '2024-03-11'),
    (5, 1, 1, 1200.00, '2024-03-12'),
    (3, 2, 8,   28.00, '2024-03-13'),
    (4, 4, 1,  120.00, '2024-03-14'),
    (5, 3, 2,  450.00, '2024-03-15');
GO
 
-- VALIDACIONES
 
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
 
-- CONSULTAS DE CONTROL
 
SELECT * FROM categorias;
GO
 
SELECT * FROM clientes;
GO
 
SELECT * FROM productos;
GO
 
SELECT * FROM ventas;
GO
