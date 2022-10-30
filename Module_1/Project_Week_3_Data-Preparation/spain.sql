CREATE DATABASE IF NOT EXISTS project_3_Spain;

USE project_3_Spain;

-- Let's find where is the most expensive Provincia (area) in Spain, based in the avg of the price

SELECT spr.provincia, AVG(PRECIO) AS avg_precio
FROM spanishrenting spr
GROUP BY provincia
ORDER BY avg_precio DESC;

SELECT spr.ciudad, max(PRECIO) AS max_precio
FROM spanishrenting spr
GROUP BY ciudad
ORDER BY max_precio DESC;

-- I'm looking for which region has the most number of houses to rent available and if makes sense with the avg of the price

SELECT spr.comunidad_autonoma, AVG(PRECIO) AS avg_precio, MAX(total_inmuebles) AS max_inm
FROM spanishrenting spr
GROUP BY comunidad_autonoma
ORDER BY max_inm DESC
;

SELECT spr.provincia, AVG(PRECIO) AS avg_precio, MAX(total_inmuebles) AS max_inm
FROM spanishrenting spr
GROUP BY provincia
ORDER BY avg_precio DESC
LIMIT 10
;
SELECT spr.provincia, AVG(PRECIO) AS avg_precio, MAX(total_inmuebles) AS max_inm, spr.descripcion_direccion
FROM spanishrenting spr
GROUP BY provincia , descripcion_direccion
ORDER BY avg_precio DESC
LIMIT 10
;



-- Let's look which city has the max in terms of meters 

SELECT descripcion_direccion, ciudad, (metros) AS max_metros, comunidad_autonoma, precio
FROM spanishrenting spr
GROUP BY descripcion_direccion
ORDER BY max_metros DESC
LIMIT 10
;

-- Let's look which city has the max in terms of rooms 

SELECT descripcion_direccion, ciudad, (habitaciones) AS max_habitaciones, comunidad_autonoma, precio
FROM spanishrenting spr
GROUP BY descripcion_direccion
ORDER BY max_habitaciones DESC
LIMIT 10
;

















