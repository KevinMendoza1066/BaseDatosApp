CREATE VIEW VistaPreciosActuales AS
select zn.Zona,tg.TipoGasolina,pa.Precio as Valor FROM PrecioActual pa
INNER JOIN Zonas zn ON pa.IdZona = zn.IdZona
INNER JOIN TipoGasolinas tg ON pa.IdTipoGasolina = tg.IdTipoGasolina

