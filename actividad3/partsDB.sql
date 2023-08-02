--PROBLEMA:
--Un negocio quiere llevar el control de piezas que emplean en el día a día y los proveedores que suministran estas. De cada proveedor conocemos su nombre, dirección, ciudad, provincia y un código de proveedor que será único para cada uno de ellos. Nos interesa llevar un control de las piezas que nos suministra cada proveedor. Es importante conocer la cantidad de las diferentes piezas que nos suministra y en qué fecha lo hace. Tenga en cuenta que un mismo proveedor nos puede suministrar una pieza con el mismo código en diferentes fechas. El diseño de la base de datos debe permitir almacenar un histórico con todas las fechas y las cantidades que nos ha proporcionado un proveedor. Una misma pieza puede ser suministrada por diferentes proveedores. De cada pieza conocemos un código que será único, nombre, color, precio y categoría. Pueden existir varias categorías y para cada categoría hay un nombre y un código de categoría único. Una pieza solo puede pertenecer a una categoría.


-- CREACION TABLA PROVEEDORES NO TIENE FK
CREATE TABLE IF NOT EXISTS proveiders (
	proveiderId SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	address VARCHAR(150) NOT NULL,
	city VARCHAR(50) NOT NULL,
	province VARCHAR(50) NOT NULL
);

-- CREACION TABLA CATEGORIAS NO TIENE FK
CREATE TABLE IF NOT EXISTS categories (
	categorieId SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

-- CREACION TABLA REPUESTOS, TENEMOS UNA FK(CATEGORIES)
CREATE TABLE IF NOT EXISTS parts (
	partId SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	color VARCHAR(20) NOT NULL,
	price INT NOT NULL,
	
	categoriaId INT,
	FOREIGN KEY (categoriaId)
	REFERENCES categories(categorieId)
);


-- CREACION TABLA COMPRAS TIENE DOS FK(PIEZAS)(PROVEEDORES)
CREATE TABLE IF NOT EXISTS shoppings (
	shoppingId SERIAL PRIMARY KEY,
	amount INT NOT NULL,
	date DATE NOT NULL DEFAULT CURRENT_DATE,
	
	proveiderId INT,
	partId INT,
	
	FOREIGN KEY (proveiderId)
	REFERENCES proveiders(proveiderId),

	FOREIGN KEY (partId)
	REFERENCES parts(partId)
);




-- INSERCION DE LOS DATOS A LAS TABLAS


--INSERCION EN TABLA PROVEEDORES
INSERT INTO proveiders
(name, address, city, province)
VALUES
('Lubricantes el porvenir', 'Calle 97 No. 2 - 80', 'Colombia', 'Bogota'),
('Soletanche bachy cimas', 'Carerra 52 No. 21 - 50', 'Mexico', 'Cancun'),
('Repuestos el mago', 'Diagonal 26 No. 10 - 20', 'España', 'Caracas');


--INSERCION EN TABLA CATEGORIAS
INSERT INTO categories
(name)
VALUES
('motores'),
('carroceria'),
('transmision'),
('cabina'),
('llantas'),
('hidraulicos'),
('neumaticos');


--INSERCION EN TABLA PIEZAS
INSERT INTO parts
(name, color, price, categoriaId)
VALUES
('piston', 'negro', 200000, 1),
('sello', 'negro', 5000, 6),
('rodamiento', 'negro', 50000, 3),
('sticker', 'blanco', 1000, 2);


--INSERCION EN TABLA COMPRAS
INSERT INTO shoppings
(amount, proveiderId, partId)
VALUES
(30, 1, 1),
(20, 2, 2),
(10, 3, 1),
(100, 2, 4),
(300, 3, 3);
