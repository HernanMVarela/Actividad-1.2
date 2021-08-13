--Referencia 1:1 para para actividad 1.2
--Tenemos 2 tablas relacionas por el campo patente que en ambas tablas es la clave primaria.
-- y en la tabla patente es una clave foranea de patente de la tabla auto.
--Esto mantiene la relacion de 1:1 ya que para cada auto solo va a haber una patente
--y lo mismo a la inversa.

--Creo Base para la actividad
Create database Actividad1_2
go

--Creamos la tabla Autos
create table Actividad1_2.dbo.Autos(
Patente  varchar(8) not null primary key,
VIN char(17) not null,
NroChasis  char(17) not null unique,
FechaSalidaFabrica  date not null check(FechaSalidaFabrica < getdate())
)
go

--Creamos la tabla Patentes
create table Actividad1_2.dbo.Patentes(
Patente varchar(8) not null primary key foreign key references Autos(Patente),
fechaInicioVigencia date not null check(fechaInicioVigencia < getdate()),
DeudaPatente money null check(deudaPatente < 0)
)
go

