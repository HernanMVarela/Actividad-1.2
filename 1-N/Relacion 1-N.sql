-- Laboratorio 3 Actividad 1.2 Relaci�n 1:N

-- En esta DB simulamos la operatoria de un local de venta de neum�ticos (gomer�a), relacionando dos tablas
-- Articulo y Marca, utilizando como PK un codigo de serie �nico de cada Art�culo y relacionando la tabla Marca a trav�s
-- de un c�digo de ID.

-- Creaci�n de DB
create database UnoAMuchos
go

-- Puesta en uso de DB
use UnoAMuchos
go

-- Creaci�n de tabla Marca
create table Marca(
ID tinyint not null primary key,
Nombre varchar(30) not null,
Origen varchar(15)
)
go

-- Creaci�n de tabla Articulo
create table Articulo(
Serial varchar(15) not null primary key,
IDMarca tinyint not null foreign key references Marca(ID),
Rodado tinyint not null,
Perfil tinyint not null,
Fecha date not null
)
go

-- Se a�aden restricciones a la DB
alter table Articulo
add constraint Rodado check (Rodado >= 10 and Rodado <= 22)
go
alter table Articulo
add constraint Perfil check (Perfil >= 40 and Perfil <= 95)
go
alter table Articulo
add constraint Fecha check (Fecha < getdate())
go

-- Fin