USE proyecto_bi;

SELECT COUNT(*) AS total_ventas
FROM ventas_origen;

SELECT COUNT(*) AS total_ciudades
FROM ciudades_origen;


SELECT id_factura, COUNT(*) AS cantidad
FROM ventas_origen
GROUP BY id_factura
HAVING COUNT(*) > 1;


SELECT
    SUM(CASE WHEN poblacion IS NULL
        OR TRIM(poblacion) = '' THEN 1 ELSE 0 END)
        AS poblacion_faltante,

    SUM(CASE WHEN division_administrativa IS NULL
        OR TRIM(division_administrativa) = '' THEN 1 ELSE 0 END)
        AS division_faltante,

    SUM(CASE WHEN iso2 IS NULL
        OR TRIM(iso2) = '' THEN 1 ELSE 0 END)
        AS iso2_faltante

FROM ciudades_origen;


SELECT ciudad, COUNT(*) AS cantidad_ventas
FROM ventas_origen
GROUP BY ciudad;



SELECT ciudad, pais, iso3, poblacion
FROM ciudades_origen
WHERE iso3 = 'MMR';