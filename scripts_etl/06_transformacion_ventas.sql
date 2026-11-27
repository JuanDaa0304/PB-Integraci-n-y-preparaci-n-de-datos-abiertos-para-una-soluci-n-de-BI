USE proyecto_bi;

CREATE OR REPLACE VIEW ventas_limpias AS
SELECT
    TRIM(id_factura) AS id_factura,
    UPPER(TRIM(sucursal)) AS sucursal,
    UPPER(TRIM(ciudad)) AS ciudad,
    TRIM(tipo_cliente) AS tipo_cliente,
    TRIM(genero) AS genero,
    TRIM(categoria) AS categoria,
    CAST(precio_unitario AS DECIMAL(10,2)) AS precio_unitario,
    CAST(cantidad AS UNSIGNED) AS cantidad,
    CAST(impuesto AS DECIMAL(12,4)) AS impuesto,
    CAST(total AS DECIMAL(12,4)) AS total,
    STR_TO_DATE(fecha, '%m/%d/%Y') AS fecha,
    CAST(hora AS TIME) AS hora,
    TRIM(metodo_pago) AS metodo_pago,
    CAST(costo AS DECIMAL(12,4)) AS costo,
    CAST(porcentaje_margen AS DECIMAL(12,9)) AS porcentaje_margen,
    CAST(ingreso_bruto AS DECIMAL(12,4)) AS ingreso_bruto,
    CAST(calificacion AS DECIMAL(4,1)) AS calificacion
FROM ventas_origen;

SELECT * FROM ventas_limpias
LIMIT 10;


DESCRIBE ventas_limpias;


SELECT
    COUNT(*) AS total_registros,
    MIN(fecha) AS primera_fecha,
    MAX(fecha) AS ultima_fecha,
    SUM(fecha IS NULL) AS fechas_invalidas
FROM ventas_limpias;