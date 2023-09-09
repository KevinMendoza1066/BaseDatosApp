DROP PROCEDURE  ActualizarGasolinera
go
CREATE PROCEDURE ActualizarGasolinera
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
    @DieselLSAuto FLOAT = NULL
)
AS
BEGIN
declare @IdGasolinera int 
	
	select @IdGasolinera = IdGasolinera from Gasolineras where Nombre like rtrim(ltrim(@Nombre)) --and IdDepartamento = @IdDepartamento and IdZona = @IdZona
	
	
    UPDATE Gasolineras
    SET
        EspecialSC = @EspecialSC,
        RegularSC = @RegularSC,
        DieselSC = @DieselSC,
        IonDieselSC = @IonDieselSC,
        DieselLSSC = @DieselLSSC,
        EspecialAuto = @EspecialAuto,
        RegularAuto = @RegularAuto,
        DieselAuto = @DieselAuto,
        IonDieselAuto = @IonDieselAuto,
        DieselLSAuto = @DieselLSAuto
    WHERE IdGasolinera = @IdGasolinera;
END