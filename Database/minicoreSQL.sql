---------Base de datos Minicore1-------
---------Kevin Fajardo-------
--Creacion de Base de datos
CREATE DATABASE minicore1
USE master
Go
if exists(
    Select name
    from sys.sysdatabases
    where name = 'minicore1')
        drop database minicore1
create database minicore1
go
USE minicore1
Go

--/Creacion tabla Usuarios/
--/Fecha última modificación: 07/03/2023/
	if exists(
		select * from sys.sysobjects
		where type = 'U' and name = 'Usuario')
			drop table Usuario 
	else
		
		create table Usuario
		(
		idUsuario int identity(1,1) primary key not null,
		nombre varchar(60) not null
		)
		go

--/Creacion tabla Ventas/
--/Fecha última modificación: 07/03/2023/
	if exists(
		select * from sys.sysobjects
		where type = 'U' and name = 'Venta')
			drop table Venta 
	else
		
		create table Venta
		(
		idVenta int identity(1,1) primary key not null,
		idUsuarioVenta int not null,
		producto varchar(60) not null,
		monto float not null,
		fecha date,
		CONSTRAINT fkusuario_venta FOREIGN KEY (idUsuarioVenta) REFERENCES Usuario(idUsuario)
		)
		go


insert into Usuario(nombre) values ('Alberto Caza')
insert into Usuario(nombre) values ('Pedro Montenegro')
insert into Usuario(nombre) values ('Gabriela Mendez')
insert into Usuario(nombre) values ('Nahomi Rodriguez')

insert into Venta(idUsuarioVenta,producto,monto,fecha) values (1,'Laptop HP', 1200.99, '12-12-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (1,'Mouse', 13.99, '05-10-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (1,'Macbook Air', 1599.99, '02-01-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (2,'Iphone 13 Pro Max', 1499.99, '06-07-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (2,'Parlante Sony', 100.98, '08-09-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (3,'Monitor MSI', 400.50, '11-04-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (3,'TV LG', 2300.40, '02-02-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (4,'Alexa Home', 45.99, '08-12-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (4,'Camara', 3000.99, '07-03-2023')
insert into Venta(idUsuarioVenta,producto,monto,fecha) values (4,'Impresora Epson', 600.99, '10-04-2023')


select * from Usuario u inner join Venta v on u.idUsuario = v.idUsuarioVenta


SELECT * FROM Usuario u INNER JOIN Venta v ON u.idUsuario = v.idUsuarioVenta
WHERE v.fecha >= '11-11-2023' AND v.fecha <= '12-12-2023'