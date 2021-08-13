-- Laboratorio 3 | Actividad 1.2
-- Relaci�n N:N
-- Existen dos tablas donde se relaciona el VIN de cada vehiculo fabricado con la f�brica de la que sale.
-- Cualquier veh�culo puede salir de cualquier f�brica y cualquier f�brica puede manufacturar cualquier veh�culo.

-- Se crea DB
create database MuchosAMuchos
go

-- Se pone en uso
use MuchosAMuchos
go

-- Se crea tabla Fabrica con ID como llave primaria
create table Fabrica (
	ID tinyint not null primary key,
	Pais varchar(20) not null,
	Linea_Ens int not null,
	Telefono varchar(20) not null,
	Direccion varchar(50) not null
)
go

-- Se crea tabla Chasis con VIN como llave primaria
create table Chasis (
	VIN varchar(30) not null primary key,
	Tipo varchar(15) not null,
	Modelo varchar(15) not null,
	Combustible varchar(15) not null,
	Variante varchar(15),
)
go

-- Se crea tabla Vehiculo con VIN y FabricaID como llaves, referenciadas a las tablas anteriores
-- VIN es llave �nica, no puede repetirse, cada veh�culo tiene su VIN �nico.
create table Vehiculo (
	VIN varchar(30) not null unique foreign key references Chasis(VIN),
	FabricaID tinyint not null foreign key references Fabrica(ID),
	Fecha_Fab date not null,
	primary key (VIN, FabricaID)
)

-- Se agregan las restricciones en las tablas creadas.
go
alter table Vehiculo
add constraint Fecha_Fab check (Fecha_Fab < getdate())
go
alter table Fabrica
add constraint ID check (ID>0 and ID<100)
go 
alter table Fabrica
add constraint Linea_Ens check (Linea_Ens > 0)
go
alter table Chasis
add constraint Tipo check (Tipo = 'Sedan' or Tipo = 'Pickup' or Tipo = 'Hatchback' or Tipo = 'SUV')
go
alter table Chasis
add constraint Combustible check (Combustible = 'Nafta' or Combustible = 'Diesel' or Combustible = 'GNC')
go