CREATE VIEW VistaGasolinerasTopTen AS
SELECT top 10 
    gs.IdGasolinera,
    gs.Nombre,
    dp.Departamento,
    zn.Zona,
    gs.EspecialSC,
    gs.RegularSC,
    gs.DieselSC,
    gs.IonDieselSC,
    gs.DieselLSSC,
    gs.EspecialAuto,
    gs.RegularAuto,
    gs.DieselAuto,
    gs.IonDieselAuto,
    gs.DieselLSAuto,
    gs.Latitud,
    gs.Longitud,
    gs.CalificacionPromedio
FROM Gasolineras gs
INNER JOIN Zonas zn ON gs.IdZona = zn.IdZona
INNER JOIN Departamentos dp ON dp.IdDepartamento = gs.IdDepartamento
Order by CalificacionPromedio desc;
