USE proyecto_bi;

CREATE OR REPLACE VIEW vista_ventas_integradas AS
SELECT
    v.*,
    c.id_ciudad,
    c.pais,
    c.iso2,
    c.iso3,
    c.latitud,
    c.longitud,
    c.division_administrativa,
    c.poblacion
FROM ventas_limpias v
LEFT JOIN ciudades_limpias c
    ON v.ciudad = c.ciudad;
    
    SELECT * FROM vista_ventas_integradas
LIMIT 10;



SELECT
    ciudad,
    pais,
    poblacion,
    COUNT(*) AS cantidad_ventas
FROM vista_ventas_integradas
GROUP BY ciudad, pais, poblacion;




SELECT
    COUNT(*) AS registros_integrados,
    COUNT(DISTINCT id_factura) AS facturas_unicas,
    SUM(id_ciudad IS NULL) AS ventas_sin_ciudad,
    SUM(poblacion IS NULL) AS ventas_sin_poblacion
FROM vista_ventas_integradas;