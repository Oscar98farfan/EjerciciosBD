--PROBLEMA:
--Se desea diseñar una base de datos que sea de utilidad para concesionarios de automóviles. Un concesionario puede vender automóviles de varias marcas (por ejemplo, Audi y Volkswagen). Sobre los automóviles se desea mantener la siguiente información: marca, modelo, precio, descuento (si es que lo tiene) y los datos técnicos (potencia fiscal, cilindrada, etc.). Para cada modelo de automóvil se quiere conocer las características de su equipamiento de serie (por ejemplo: airbag conductor y cierre centralizado), así como los extras que se pueden incluir (aire acondicionado, airbag acompañante, pintura metalizada, etc.) y el precio de cada uno de ellos. Notar que, lo que son características del equipamiento de serie de algunos modelos, son extras para otros modelos. Por ejemplo, hay modelos que llevan el airbag de serie mientras que otros lo tienen como un posible extra.
--El concesionario tiene siempre automóviles de varios modelos en stock (cada uno se identifica por su número de bastidor). Éstos se pueden encontrar en su mismo local, o bien, en cualquiera de los servicios oficiales que dependen de él. Un servicio oficial es también una tienda de automóviles, pero depende de un concesionario que es el que le presta los automóviles para su exposición, y también se los vende. De cada servicio oficial se conoce el nombre, domicilio e INE.
--Cuando se vende un automóvil se quiere saber quién lo ha vendido: puede ser uno de los vendedores del concesionario o bien un servicio oficial. También se desea saber el precio que se ha cobrado por él y el modo de pago: al contado o mediante financiera. También se guardará información sobre los extras que se han incluido, precio de cada uno, la fecha de entrega, matrícula y si era de stock o se ha tenido que encargar a fábrica. De los vendedores se almacenarán los datos personales (nombre, INE, domicilio, etc.) y las ventas realizadas.
--Realizar el modelo entidad-relación, documentar las querys para crear las tablas en PostgreSQL y ejecutarlas.


-- CREACION TABLA MARCAS
CREATE TABLE IF NOT EXISTS brands (
    brandId SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

--CREACION TABLA MODELOS, TENEMOS UN FK(MARCAS)
CREATE TABLE IF NOT EXISTS models (
    modelId SERIAL PRIMARY KEY,
    brandId INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price NUMERIC(4, 2) NOT NULL,
    discount NUMERIC(4, 2) NOT NULL,
    cylinderCapacity VARCHAR(20) NOT NULL,
    hp VARCHAR(20) NOT NULL,
	fuel VARCHAR(20) NOT NULL,
	
	FOREIGN KEY (brandId)
	REFERENCES brands(brandId)
);

--CREACION TABLA EQUIPAMIENTO, TENEMOS UN FK(MODELO)
CREATE TABLE IF NOT EXISTS equipments (
    equipmentId SERIAL PRIMARY KEY,
	modelId INT NOT NULL,
    name VARCHAR(150) NOT NULL,
	
	FOREIGN KEY (modelId)
	REFERENCES models(modelId)
);

--CREACION TABLA ADICIONALES, TENEMOS UN FK(MODELO)
CREATE TABLE IF NOT EXISTS additionals (
    additionalId SERIAL PRIMARY KEY,
	modelId INT NOT NULL,
    name VARCHAR(150) NOT NULL,
	price NUMERIC(6,2), 
	
	FOREIGN KEY (modelId)
	REFERENCES models(modelId)
);

--CREACION TABLA VEHICULOS, TENEMOS UN FK(MODELO)
CREATE TABLE IF NOT EXISTS cars (
    carId SERIAL PRIMARY KEY,
	modelId INT NOT NULL,
    location VARCHAR(150) NOT NULL,
	
	FOREIGN KEY (modelId)
	REFERENCES models(modelId)
);

--CREACION TABLA CONSECIONARIOS
CREATE TABLE IF NOT EXISTS stores (
    storeId SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
    address VARCHAR(150) NOT NULL,
	INE VARCHAR(150) NOT NULL
);

--CREACION TABLA VENDEDORES, TENEMOS UN FK(TIENDAS)
CREATE TABLE IF NOT EXISTS sellers (
    sellerId SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	storeId INT NOT NULL,
    address VARCHAR(150) NOT NULL,
	INE VARCHAR(150) NOT NULL,
	
	FOREIGN KEY (storeId)
	REFERENCES stores(storeId)
);

--CREACION TABLA SURCURSALES, TENEMOS UN FK(TIENDAS)
CREATE TABLE IF NOT EXISTS branchOffices (
    branchOfficesId SERIAL PRIMARY KEY,
	storeId INT NOT NULL,
	name VARCHAR(150) NOT NULL,
    address VARCHAR(150) NOT NULL,
	INE VARCHAR(150) NOT NULL,
	
	
	FOREIGN KEY (storeId)
	REFERENCES stores(storeId)
);

--CREACION TABLA VENTAS, TENEMOS DOS FK(CARROS Y VENDEDORES)
CREATE TABLE IF NOT EXISTS sales (
    saleId SERIAL PRIMARY KEY,
    carId INT NOT NULL,
    sellerId INT NOT NULL,
    price NUMERIC(8, 2) NOT NULL,
    paymentType VARCHAR(20) NOT NULL,
    deadline DATE NOT NULL,
    tuition VARCHAR(20) NOT NULL,
	
	
	FOREIGN KEY (carId)
	REFERENCES cars(carId),
	
	FOREIGN KEY (sellerId)
	REFERENCES sellers(sellerId)
);

--CREACION TABLA VENTAS EXTRA, TENEMOS DOS FK(VENTAS Y EXTRAS)
CREATE TABLE IF NOT EXISTS salesExtras (
    PRIMARY KEY(saleId, additionalId),
	saleId INT NOT NULL,
	additionalId INT NOT NULL,
	amount INT NOT NULL,
	priceExtra NUMERIC(8, 2) NOT NULL,

	
	FOREIGN KEY (saleId)
	REFERENCES sales(saleId),
	
	FOREIGN KEY (additionalId)
	REFERENCES additionals(additionalId)
);



-- INSERCION DE LOS DATOS A LAS TABLAS

--INSERCION EN TABLA MARCAS
INSERT INTO brands
(name)
VALUES
('MAZDA'),
('BMW'),
('CHEVROLET'),
('FIAT'),
('AUDI'),
('VOLKSWAGEN'),
('Kia');

--INSERCION EN TABLA MODELOS
INSERT INTO models
(brandId, name, price, discount, cylinderCapacity, hp, fuel)
VALUES
(15, 'SANDERO', 40, 20, 9000, 300, 'GASOLINA'),
(16, 'BT50', 40, 10, 3000, 400, 'DIESEL'),
(17, 'RIO', 80, 30, 2000, 50, 'GASOLINA'),
(18, 'SAIL', 30, 5, 1000, 250, 'GASOLINA');

--INSERCION EN TABLA EQUIPAMIENTOS
INSERT INTO equipments
(modelId, name)
VALUES
(9, 'LUZ LED'),
(10, 'AIRBAG CONDUCTOR - SILLA NEUMATICA'),
(11, 'RINES DE LUJO - VOLANTE AJUSTABLE - LUZ ALOGENOS'),
(12, 'SIN LLANTA DE REPUESTO - AIRBAG PARA PILOTO Y COPILOTO');

--INSERCION EN TABLA ADICIONALES
INSERT INTO additionals
(modelId, name, price)
VALUES
(9, 'COMPRESOR', 5000),
(10, 'VIDRIOS ELECTRICOS', 1500),
(11, 'VIDRIOS POLARIZADOS', 2500),
(12, 'ALARMA', 3500);

--INSERCION EN TABLA CARROS
INSERT INTO cars
(modelId, location)
VALUES
(9, 'MEDELLIN'),
(10, 'BOGOTA'),
(11, 'CALI'),
(12, 'BUCARAMANGA');

--INSERCION EN TABLA TIENDAS
INSERT INTO stores
(name, address, INE)
VALUES
('AUTOYA', 'CALLE 97 No. 25 - 80', '1234'),
('CARROYA', 'CARRERA 7 No. 25 - 80', '5678'),
('AUTOUNAL', 'CALLE 26 No. 80 - 10', '9876'),
('CONRUEDAS', 'KM 97 VIA MEDELLIN - BOGOTA', '5432');

--INSERCION EN TABLA VENDEDORES
INSERT INTO sellers
(name, storeId, address, INE)
VALUES
('CAMILO SANCHEZ', 1, 'CALLE 1 No. 25 - 80', '741'),
('OSCAR FARFAN', 2, 'CARRERA 6 No. 25 - 80', '852'),
('LORENA PEREZ', 3, 'CALLE 25 No. 80 - 10', '963'),
('MARLON CARDENAS', 4, 'CALLE 150 No. 1 - 10', '159');


--INSERCION EN TABLA SURCURSALES
INSERT INTO branchOffices
(storeId, name, address, INE)
VALUES
(1, 'AUTOS VENTAYA', 'CALLE 116 No. 25 - 80', '357'),
(2, 'CARROS VIVE', 'CARRERA 6 No. 52 - 80', '684'),
(3, 'VEHICULOS UNAL', 'CALLE 270 No. 80 - 10', '486'),
(4, 'RUEDAS PAN', 'CALLE 150 No. 25 - 10', '624');

--INSERCION EN TABLA VENTAS
INSERT INTO sales
(carId, sellerId, price, paymentType, deadline, tuition)
VALUES
(1, 4, 50000, 'CREDITO', '2023-08-01', 'MEDELLIN'),
(2, 3, 80000, 'CONSIGNACION', '2022-10-01', 'CALI'),
(3, 2, 90000, 'EFECTIVO', '2021-01-20', 'BOGOTA'),
(4, 1, 70000, 'CHEQUE', '2023-02-15', 'NEIVA');


--INSERCION EN TABLA COSTOS EXTRA
INSERT INTO salesExtras
(saleId, additionalId, amount, priceExtra)
VALUES
(1, 4, 2, 150000),
(2, 3, 5, 250000),
(3, 2, 6, 350000),
(4, 1, 1, 500000);
