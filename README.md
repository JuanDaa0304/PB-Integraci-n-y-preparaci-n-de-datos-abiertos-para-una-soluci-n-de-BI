# Integración de datos comerciales y demográficos mediante un proceso ETL

Proyecto de la asignatura Introducción a la Inteligencia de Negocios (UTPL).

**Integrantes:** Raúl Andino, David Merino y Juan Vargas

## De qué trata

Unimos las ventas de tres sucursales de un supermercado en Myanmar con datos de población y ubicación de las ciudades donde están esas sucursales. La idea es responder cómo se distribuyen las ventas según las características demográficas de cada ciudad.

## Fuentes de datos

| Dataset | Origen | Registros | Licencia |
|---|---|---|---|
| Supermarket sales | [Kaggle](https://www.kaggle.com/datasets/markmedhat/supermarket-sales) | 1.000 | Apache 2.0 |
| World Cities Datasets | [Kaggle](https://www.kaggle.com/datasets/viswanathanc/world-cities-datasets) | 15.493 | CC BY 4.0 |

## Contenido del repositorio

- `Datos/` tiene los dos CSV originales tal como se descargaron
- `scripts_etl/` tiene los scripts SQL del proceso
- `datos_resultantes/` tiene el archivo final `ventas_integradas.csv` (1.000 registros y 25 columnas)
- `Evidencias/` tiene las capturas de MySQL Workbench de cada paso

## Cómo ejecutar el proceso

Todo se hizo en MySQL Workbench. Los scripts se corren en orden:

1. `00_base_datos.sql` crea la base `proyecto_bi`
2. `01_tabla_ventas.sql` y `02_tabla_ciudades.sql` crean las tablas de origen
3. `03_extraccion_ventas.sql` y `04_extraccion_ciudades.sql` importan los CSV
4. `05_diagnostico_calidad.sql` revisa duplicados, faltantes y diferencias
5. `06_transformacion_ventas.sql` y `07_transformacion_ciudades.sql` crean las vistas limpias
6. `08_integracion_datos.sql` une las dos fuentes con un LEFT JOIN por ciudad
7. `09_carga_datos.sql` crea la tabla final `ventas_integradas` y la valida
8. `10_exportacion_datos.sql` consulta la tabla final para exportarla a CSV
