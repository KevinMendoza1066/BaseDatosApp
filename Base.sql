 
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

