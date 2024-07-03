
CREATE DATABASE BAKE_BLISS;
GO

USE BAKE_BLISS;
GO

CREATE TABLE CATEGORIAS (
    CATEGORIA_ID INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(50) NOT NULL
);

CREATE TABLE PRODUCTOS (
    PRODUCTO_ID INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(100) NOT NULL,
    DESCRIPCION TEXT,
    PRECIO DECIMAL(10, 2) NOT NULL,
    STOCK INT NOT NULL,
    CATEGORIA_ID INT,
    FOREIGN KEY (CATEGORIA_ID) REFERENCES CATEGORIAS(CATEGORIA_ID)
);

CREATE TABLE USUARIOS (
    USUARIO_ID INT PRIMARY KEY IDENTITY(1,1),
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL UNIQUE,
    PASSWORD VARCHAR(255) NOT NULL
);

CREATE TABLE VENTAS (
    VENTA_ID INT PRIMARY KEY IDENTITY(1,1),
    USUARIO_ID INT,
    FECHA_VENTA DATETIME DEFAULT CURRENT_TIMESTAMP,
    TOTAL DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (USUARIO_ID) REFERENCES USUARIOS(USUARIO_ID)
);

CREATE TABLE DETALLES_VENTAS (
    DETALLE_VENTA_ID INT PRIMARY KEY IDENTITY(1,1),
    VENTA_ID INT,
    PRODUCTO_ID INT,
    CANTIDAD INT NOT NULL,
    PRECIO_UNITARIO DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VENTA_ID) REFERENCES VENTAS(VENTA_ID),
    FOREIGN KEY (PRODUCTO_ID) REFERENCES PRODUCTOS(PRODUCTO_ID)
);

INSERT INTO CATEGORIAS (NOMBRE) VALUES
('Tartas'),
('Panader�a'),
('Galletas'),
('Pasteles'),
('Boller�a'),
('Postres sin gluten');

INSERT INTO PRODUCTOS (NOMBRE, DESCRIPCION, PRECIO, STOCK, CATEGORIA_ID) VALUES
('Tarta de Chocolate', 'Deliciosa tarta de chocolate con cobertura de ganache', 15.99, 10, 1),
('Pan de Centeno', 'Pan de centeno integral, ideal para desayunos', 3.50, 20, 2),
('Galletas de Avena', 'Galletas crujientes de avena y pasas', 2.00, 30, 3),
('Pastel de Zanahoria', 'Pastel suave de zanahoria con crema de queso', 12.50, 15, 4),
('Croissant', 'Croissant de mantequilla reci�n horneado', 1.50, 50, 5),
('Brownie sin gluten', 'Brownie de chocolate sin gluten', 3.00, 25, 6),
('Tarta de Lim�n', 'Tarta con una base crujiente y relleno de crema de lim�n', 14.99, 12, 1),
('Pan de Espelta', 'Pan de espelta, ideal para dietas especiales', 4.00, 18, 2),
('Galletas de Chocolate', 'Galletas con trozos de chocolate negro', 2.50, 35, 3),
('Pastel de Fresas', 'Pastel de fresas frescas con crema chantilly', 13.00, 10, 4),
('Danish', 'Danish con relleno de manzana y canela', 2.00, 40, 5),
('Muffin sin gluten', 'Muffin de ar�ndanos sin gluten', 2.50, 22, 6),
('Tarta de Queso', 'Tarta de queso con base de galleta', 16.00, 14, 1),
('Pan de Maiz', 'Pan de ma�z, perfecto para acompa�ar comidas', 3.75, 25, 2),
('Galletas de Jengibre', 'Galletas especiadas de jengibre', 2.20, 28, 3),
('Pastel de Chocolate', 'Pastel de chocolate con capas de ganache', 14.00, 8, 4),
('Brioche', 'Brioche esponjoso y suave', 1.75, 45, 5),
('Tarta de Almendra sin gluten', 'Tarta de almendra apta para cel�acos', 15.00, 20, 6),
('Tarta de Manzana', 'Tarta con relleno de manzana caramelizada', 13.50, 11, 1),
('Pan de Molde', 'Pan de molde casero para sandwiches', 3.25, 30, 2),
('Galletas de Mantequilla', 'Galletas tradicionales de mantequilla', 1.80, 40, 3),
('Pastel Red Velvet', 'Pastel de terciopelo rojo con glaseado de queso', 15.00, 12, 4),
('Churros', 'Churros reci�n hechos con az�car y canela', 1.00, 50, 5),
('Cupcakes sin gluten', 'Cupcakes variados sin gluten', 3.00, 25, 6),
('Tarta de Frutas', 'Tarta de frutas frescas de temporada', 17.00, 13, 1),
('Pan de Platano', 'Pan dulce de pl�tano y nueces', 4.50, 20, 2),
('Galletas de Nuez', 'Galletas con trozos de nuez', 2.00, 30, 3),
('Pastel de Coco', 'Pastel esponjoso de coco', 14.50, 10, 4),
('Baguette', 'Baguette francesa crujiente', 1.20, 40, 5),
('Brownie de Nueces sin gluten', 'Brownie de chocolate con nueces sin gluten', 3.50, 18, 6);

-- INSERTAR DATOS INICIALES EN LA TABLA DE USUARIOS
INSERT INTO USUARIOS (NOMBRE, APELLIDO, EMAIL, PASSWORD) VALUES
('Yheremi', 'Ramos', 'yheremi@gmail.com', 'yheremi123'),
('Zarela', 'Manrique', 'zarela@gmail.com',  'zarela123'),
('Leslie', 'Marlo', 'leslie@gmail.com','leslie123'),
('Astrid', 'Yovera', 'astrid@gmail.com','astrid123');

INSERT INTO VENTAS (USUARIO_ID, TOTAL) VALUES
(1, 18.99),
(2, 3.50),
(3, 6.00),
(4, 30.50),
(1, 22.75),
(3, 15.25),
(2, 12.75),
(4, 8.50),
(1, 17.50),
(3, 9.00),
(2, 25.75),
(4, 11.25),
(1, 14.75),
(3, 19.00),
(2, 7.50),
(4, 6.25),
(1, 12.00),
(3, 5.50),
(2, 9.75),
(4, 20.25);

INSERT INTO DETALLES_VENTAS (VENTA_ID, PRODUCTO_ID, CANTIDAD, PRECIO_UNITARIO) VALUES
(1, 2, 2, 7.00),
(2, 1, 2, 31.98),
(3, 1, 1, 15.99),
(4, 3, 2, 4.00),
(4, 2, 1, 3.50),
(5, 2, 3, 10.50),
(5, 3, 1, 2.00),
(6, 1, 1, 15.99),
(6, 2, 2, 7.00),
(6, 3, 2, 4.00),
(7, 1, 3, 47.97),
(7, 3, 1, 2.00),
(8, 2, 1, 3.50),
(8, 3, 2, 4.00),
(8, 1, 2, 31.98);


SELECT * FROM CATEGORIAS
SELECT * FROM PRODUCTOS
SELECT * FROM USUARIOS
SELECT * FROM VENTAS
SELECT * FROM DETALLES_VENTAS
