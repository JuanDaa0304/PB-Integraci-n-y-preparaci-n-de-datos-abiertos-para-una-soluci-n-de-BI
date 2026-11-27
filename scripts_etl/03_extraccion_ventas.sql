USE proyecto_bi;

LOAD DATA LOCAL INFILE
'C:/Users/david/Downloads/Proyecto Inteligencia de Negocios/Proyecto Inteligencia de Negocios/Datos/supermarket_sales - Sheet1.csv'
INTO TABLE ventas_origen
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;


SELECT COUNT(*) AS total_ventas
FROM ventas_origen;

SELECT * FROM ventas_origen
LIMIT 10;