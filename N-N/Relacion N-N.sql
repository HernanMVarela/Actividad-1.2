create database MuchosAMuchos
go
use MuchosAMuchos
go
create table Fabrica (
	ID tinyint not null primary key,
	Pais varchar(20) not null,
	Linea_Ens int not null,
	Telefono varchar(20) not null,
	Direccion varchar(50) not null
)
go
create table Chasis (
	VIN varchar(30) not null primary key,
	Tipo varchar(15) not null,
	Modelo varchar(15) not null,
	Combustible varchar(15) not null,
	Variante varchar(15),
)
go
create table Vehiculo (
	VIN varchar(30) not null unique foreign key references Chasis(VIN),
	FabricaID tinyint not null foreign key references Fabrica(ID),
	Fecha_Fab date not null,
	primary key (VIN, FabricaID)
)
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