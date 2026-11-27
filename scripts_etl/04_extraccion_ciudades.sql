USE proyecto_bi;

LOAD DATA LOCAL INFILE
'C:/Users/david/Downloads/Proyecto Inteligencia de Negocios/Proyecto Inteligencia de Negocios/Datos/worldcities.csv'
INTO TABLE ciudades_origen
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT COUNT(*) AS total_ciudades
FROM ciudades_origen;


SELECT * FROM ciudades_origen
LIMIT 10;
