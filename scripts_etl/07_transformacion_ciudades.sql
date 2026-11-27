USE proyecto_bi;

CREATE OR REPLACE VIEW ciudades_limpias AS
SELECT
    CAST(id_ciudad AS UNSIGNED) AS id_ciudad,

    CASE UPPER(TRIM(ciudad))
        WHEN 'RANGOON' THEN 'YANGON'
        WHEN 'NAY PYI TAW' THEN 'NAYPYITAW'
        ELSE UPPER(TRIM(ciudad))
    END AS ciudad,

    'MYANMAR' AS pais,
    UPPER(TRIM(iso2)) AS iso2,
    UPPER(TRIM(iso3)) AS iso3,
    CAST(latitud AS DECIMAL(10,4)) AS latitud,
    CAST(longitud AS DECIMAL(10,4)) AS longitud,
    NULLIF(TRIM(division_administrativa), '') 
        AS division_administrativa,
    CAST(NULLIF(TRIM(poblacion), '') AS UNSIGNED)
        AS poblacion

FROM ciudades_origen
WHERE UPPER(TRIM(iso3)) = 'MMR';

SELECT * FROM ciudades_limpias;


SELECT ciudad, pais, poblacion
FROM ciudades_limpias
WHERE ciudad IN (
    'YANGON',
    'MANDALAY',
    'NAYPYITAW'
);


SELECT
    COUNT(*) AS total_ciudades,
    SUM(poblacion IS NULL) AS poblacion_faltante
FROM ciudades_limpias;


SELECT ciudad, COUNT(*) AS cantidad
FROM ciudades_limpias
WHERE ciudad IN (
    'YANGON',
    'MANDALAY',
    'NAYPYITAW'
)
GROUP BY ciudad
HAVING COUNT(*) > 1;