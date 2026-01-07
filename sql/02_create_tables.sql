-- TABLA LOCALIDAD --
CREATE TABLE Localidad (
	ID_localidad INT PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL
);

-- TABLA PROVEEDOR --
CREATE TABLE Proveedor (
	ID_proveedor INT PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Direccion VARCHAR(50) NOT NULL,
	ID_localidad INT NOT NULL,
	CONSTRAINT FK_Proveedor_Localidad
		FOREIGN KEY (ID_localidad)
		REFERENCES Localidad (ID_localidad)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

-- TABLA CLIENTE --
CREATE TABLE Cliente (
	ID_cliente INT PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	Direccion VARCHAR(50) NOT NULL,
	ID_localidad INT NOT NULL,
	CONSTRAINT FK_Cliente_Localidad
		FOREIGN KEY (ID_localidad)
		REFERENCES Localidad (ID_localidad)
		ON DELETE NO ACTION
		ON UPDATE CASCADE
);

-- TABLA PRODUCTO --
CREATE TABLE Producto (
	ID_producto INT PRIMARY KEY,
	Nombre VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(50)
);

-- TABLA COMPRA --
CREATE TABLE Compra (
	ID_compra INT PRIMARY KEY,
	ID_proveedor INT NOT NULL,
	ID_producto INT NOT NULL,
	Cantidad INT NOT NULL,
	Precio_unitario DECIMAL(10,2) NOT NULL,
	Fecha DATE NOT NULL,

	CONSTRAINT FK_Compra_Proveedor
		FOREIGN KEY (ID_proveedor)
		REFERENCES Proveedor (ID_proveedor)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,

	CONSTRAINT FK_Compra_Producto
		FOREIGN KEY (ID_producto)
		REFERENCES Producto (ID_producto)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,

	CONSTRAINT Validacion_Cantidad_Compra
		CHECK (Cantidad > 0),

	CONSTRAINT Validacion_Precio_Compra
		CHECK (Precio_unitario > 0)
);

-- TABLA VENTA --
CREATE TABLE Venta (
	ID_venta INT PRIMARY KEY,
	ID_cliente INT NOT NULL,
	ID_producto INT NOT NULL,
	Cantidad INT NOT NULL,
	Precio_unitario DECIMAL(10,2) NOT NULL,
	Fecha DATE NOT NULL,

	CONSTRAINT FK_Venta_Cliente
		FOREIGN KEY (ID_cliente)
		REFERENCES Cliente (ID_cliente)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,

	CONSTRAINT FK_Venta_Producto
		FOREIGN KEY (ID_producto)
		REFERENCES Producto (ID_producto)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,

	CONSTRAINT Validacion_Cantidad_Venta
		CHECK (Cantidad > 0),

	CONSTRAINT Validacion_Precio_Venta
		CHECK (Precio_unitario > 0)
);

-- TABLA FACTURA --
CREATE TABLE Factura (
	Nro_factura INT PRIMARY KEY,
	ID_venta INT NOT NULL,
	Fecha DATE NOT NULL,
	Monto DECIMAL(10,2) NOT NULL,

	CONSTRAINT FK_Factura_Venta
		FOREIGN KEY (ID_venta)
		REFERENCES Venta (ID_venta)
		ON DELETE NO ACTION
		ON UPDATE CASCADE,

	CONSTRAINT Validacion_Monto
		CHECK (Monto > 0)
);