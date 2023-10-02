
create table Zonas (
IdZona int primary key  identity ,
Zona nvarchar(50) not null
);

INSERT INTO Zonas (Zona) VALUES ('ZONA CENTRAL'),('ZONA OCCIDENTAL'),('ZONA ORIENTAL');

create table Departamentos (
IdDepartamento int primary key  identity ,
Departamento nvarchar(550) not null
);
INSERT INTO Departamentos (Departamento) VALUES ('AHUACHAPÁN'),('CABAÑAS'),('CHALATENANGO'),('CUSCATLÁN'),('LA LIBERTAD'),('LA PAZ')
,('LA UNIÓN'),('MORAZÁN'),('SAN MIGUEL'),('SAN SALVADOR'),('SAN VICENTE'),('SANTA ANA')
,('SONSONATE'),('USULUTÁN')

create table Gasolineras (
IdGasolinera int primary key  identity ,
IdDepartamento  int not null,
Foreign key  (IdDepartamento) references Departamentos(IdDepartamento),
IdZona int not null,
Foreign key  (IdZona) references Zonas(IdZona),
Nombre nvarchar(300) default null,
EspecialSC	float default null,
RegularSC	float default null,
DieselSC	float default null,
IonDieselSC	float default null,
DieselLSSC	float default null,
EspecialAuto	float default null,
RegularAuto	float default null,
DieselAuto	float default null,
IonDieselAuto	float default null,
DieselLSAuto float default null,
Latitud DECIMAL(18, 14),
Longitud DECIMAL(18, 14),
CalificacionPromedio DECIMAL(5,2),
Fecha_Creacion Datetime Default GETDATE() 
);


create table Calificaciones (
IdCalificacion int primary key  identity ,
IdGasolinera  int not null,
Foreign key  (IdGasolinera) references Gasolineras(IdGasolinera),
UID NVARCHAR(128),
Calificacion DECIMAL(5,2)
);
-- Cambio en la base para mostrar precios actuales en el API 
create table TipoGasolinas (
IdTipoGasolina int primary key  identity ,
TipoGasolina nvarchar(100) not null
);
INSERT INTO TipoGasolinas (TipoGasolina) VALUES ('GASOLINA ESPECIAL'),
('GASOLINA REGULAR'),('DIESEL BAJO EN AZUFRE');

create table PrecioActual(
IdPrecioActual int primary key  identity ,
IdZona int not null,
Foreign key  (IdZona) references Zonas(IdZona),
IdTipoGasolina int not null,
Foreign key  (IdTipoGasolina) references TipoGasolinas(IdTipoGasolina),
Precio varchar(100) default null, 
Fecha_Creacion Datetime Default GETDATE() ,
Fecha_Actualizacion Datetime Default GETDATE() 
)
insert INTO PrecioActual (IdZona,IdTipoGasolina,Precio) 
VALUES (1,1,0.00),(1,2,0.00),(1,3,0.00),
(2,1,0.00),(2,2,0.00),(2,3,0.00),
(3,1,0.00),(3,2,0.00),(3,3,0.00)


/*


-- Eliminar datos de tablas relacionadas
TRUNCATE TABLE Calificaciones;
TRUNCATE TABLE PrecioActual;

-- Eliminar tablas en orden inverso de creación para evitar conflictos de clave foránea
DROP TABLE PrecioActual;
DROP TABLE TipoGasolinas;
DROP TABLE Calificaciones;
DROP TABLE Gasolineras;
DROP TABLE Departamentos;
DROP TABLE Zonas;

*/