DROP PROCEDURE InsertarGasolinera
go
CREATE PROCEDURE InsertarGasolinera
(
    @Departamento nvarchar(550)= NULL,
    @Zona nvarchar(550)= NULL,
    @Nombre NVARCHAR(300) = NULL,
    @EspecialSC FLOAT = NULL,
    @RegularSC FLOAT = NULL,
    @DieselSC FLOAT = NULL,
    @IonDieselSC FLOAT = NULL,
    @DieselLSSC FLOAT = NULL,
    @EspecialAuto FLOAT = NULL,
    @RegularAuto FLOAT = NULL,
    @DieselAuto FLOAT = NULL,
    @IonDieselAuto FLOAT = NULL,
    @DieselLSAuto FLOAT = NULL,
    @Latitud DECIMAL(18, 14),
    @Longitud DECIMAL(18, 14),
    @CalificacionPromedio DECIMAL(5, 2) = NULL
)
AS
BEGIN
	declare @IdDepartamento int ,@IdZona int 
	select @IdDepartamento = IdDepartamento from Departamentos where Departamento like @Departamento
	select @IdZona = IdZona from Zonas where Zona like @Zona
    
	INSERT INTO Gasolineras (IdDepartamento, IdZona, Nombre, EspecialSC, RegularSC, DieselSC, IonDieselSC, DieselLSSC, EspecialAuto, RegularAuto, DieselAuto, IonDieselAuto, DieselLSAuto, Latitud, Longitud, CalificacionPromedio, Fecha_Creacion)
    VALUES (@IdDepartamento, @IdZona, @Nombre, @EspecialSC, @RegularSC, @DieselSC, @IonDieselSC, @DieselLSSC, @EspecialAuto, @RegularAuto, @DieselAuto, @IonDieselAuto, @DieselLSAuto, @Latitud, @Longitud, @CalificacionPromedio, GETDATE());
END