DROP PROCEDURE  ActualizarPrecioActual
go
CREATE PROCEDURE ActualizarPrecioActual
(
    @Zona nvarchar(100)= NULL,
    @TipoGasolina NVARCHAR(100) = NULL,
    @Valor nvarchar(100) = NULL
)
AS
BEGIN
declare @IdZona int ,
 @IdTipoGasolina int ,
 @IdPrecioActual int

select @Zona = 'ZONA ' + UPPER(@Zona);

select @IdZona = IdZona from Zonas where Zona like rtrim(ltrim(@Zona));
select @IdTipoGasolina = IdTipoGasolina from TipoGasolinas where TipoGasolina like UPPER(rtrim(ltrim(@TipoGasolina))) 
	
select @IdPrecioActual = IdPrecioActual from  PrecioActual WHERE IdZona = @IdZona and IdTipoGasolina = @IdPrecioActual;

    UPDATE PrecioActual
    SET
        Precio =@Valor
    WHERE IdPrecioActual = @IdPrecioActual;
END