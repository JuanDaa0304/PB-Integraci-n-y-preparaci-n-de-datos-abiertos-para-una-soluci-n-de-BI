USE proyecto_bi;

CREATE TABLE ventas_integradas AS
SELECT * FROM vista_ventas_integradas;


SELECT * FROM ventas_integradas
LIMIT 10;


DESCRIBE ventas_integradas;



SELECT
    COUNT(*) AS total_registros,
    COUNT(DISTINCT id_factura) AS facturas_unicas,
    SUM(id_ciudad IS NULL) AS ciudades_faltantes
FROM ventas_integradas;



SELECT
    (SELECT SUM(CAST(total AS DECIMAL(12,4)))
     FROM ventas_origen) AS importe_original,

    (SELECT SUM(total)
     FROM ventas_integradas) AS importe_integrado;