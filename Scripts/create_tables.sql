CREATE TABLE Foodtruck (
	ID_Foodtruck INT PRIMARY KEY IDENTITY (1,1),
	Nombre NVARCHAR (50) NOT NULL,
	Cocina_tipo NVARCHAR (50) NOT NULL,
	Ciudad NVARCHAR (50) NOT NULL
	);

CREATE TABLE Productos (
	ID_Producto INT PRIMARY KEY IDENTITY(101,1),
	ID_Foodtruck INT NOT NULL,
	Nombre NVARCHAR (50) NOT NULL, 
	Precio INT NOT NULL,
	Stock INT NOT NULL,
	CONSTRAINT FK_Foodtruck_Producto  
		FOREIGN KEY (ID_Foodtruck) REFERENCES Foodtruck(ID_Foodtruck)
);

CREATE TABLE Locacion (
	ID_Locacion INT PRIMARY KEY IDENTITY(1,1),
	ID_Foodtruck INT NOT NULL,
	Locacion_fecha DATE NOT NULL,
	Zona NVARCHAR (50) NOT NULL,
	CONSTRAINT FK_Foodtruck_Locacion  
		FOREIGN KEY (ID_Foodtruck) REFERENCES Foodtruck(ID_Foodtruck)
);

CREATE TABLE Ordenes (
	ID_Ordenes INT PRIMARY KEY IDENTITY (1001,1),
	ID_Foodtruck INT NOT NULL,
	Fecha_orden DATE NOT NULL,
	Estado NVARCHAR (15) NOT NULL,
	Total INT NOT NULL,
	CONSTRAINT FK_Foodtruck_Ordenes  
		FOREIGN KEY (ID_Foodtruck) REFERENCES Foodtruck(ID_Foodtruck),
);

CREATE TABLE Detalle_Ordenes (
	ID_Detalle_Ordenes INT PRIMARY KEY IDENTITY (1,1),
	ID_Ordenes INT NOT NULL,
	ID_Producto INT NOT NULL,
	Cantidad INT NOT NULL,
	CONSTRAINT FK_DetalleOrdenes_Ordenes  
		FOREIGN KEY (ID_Ordenes) REFERENCES Ordenes(ID_Ordenes),
	CONSTRAINT FK_DetalleOrdenes_Productos  
		FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);