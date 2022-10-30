CREATE DATABASE IF NOT EXISTS project_3_Spain;

USE project_3_Spain;

-- Let's find where is the most expensive Provincia (area) in Spain, based in the avg of the price

SELECT spr.provincia,spr.descripcion_direccion, AVG(PRECIO) AS avg_precio
FROM spanishrenting spr
GROUP BY provincia
ORDER BY avg_precio DESC;

SELECT spr.ciudad, max(PRECIO) AS max_precio
FROM spanishrenting spr
GROUP BY ciudad
ORDER BY max_precio DESC;

-- I'm looking for which region has the most number of houses to rent available and if makes sense with the avg of the price
SELECT spr.comunidad_autonoma, AVG(PRECIO) AS avg_precio
FROM spanishrenting spr
GROUP BY comunidad_autonoma
ORDER BY avg_precio DESC;


SELECT spr.comunidad_autonoma, MAX(total_inmuebles)
FROM spanishrenting spr
GROUP BY comunidad_autonoma
ORDER BY comunidad_autonoma;

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

SELECT spr.provincia, AVG(PRECIO) AS avg_precio, MAX(total_inmuebles) AS max_inm
FROM spanishrenting spr
GROUP BY provincia
ORDER BY max_inm DESC
LIMIT 10
;


-- Let's look which city has the max in terms of meters 

SELECT spr.ciudad , MAX(metros) AS max_metros
FROM spanishrenting spr
GROUP BY ciudad
ORDER BY max_metros DESC
LIMIT 10
;

















SELECT country, SUM(fraudulent) as total_fake, CAST((AVG(fraudulent)*100) AS DECIMAL(5,2)) as per_fake, COUNT(*) as total_jobs
FROM postings
GROUP BY country
ORDER BY total_fake DESC
LIMIT 10;

SELECT state, SUM(fraudulent) as total_fake, CAST((AVG(fraudulent)*100) AS DECIMAL(5,2)) as per_fake, COUNT(*) as total_jobs
FROM postings
GROUP BY state
ORDER BY total_fake DESC
LIMIT 50;

SELECT has_reqs, SUM(fraudulent) as total_fake, CAST((AVG(fraudulent)*100) AS DECIMAL(5,2)) as per_fake, COUNT(*) as total_jobs
FROM postings
GROUP BY has_reqs
ORDER BY total_fake DESC;

SELECT has_company_logo, SUM(fraudulent) as total_fake, CAST((AVG(fraudulent)*100) AS DECIMAL(5,2)) as per_fake, COUNT(*) as total_jobs
FROM postings
GROUP BY has_company_logo
ORDER BY total_fake DESC;

SELECT has_reqs, has_company_logo, SUM(fraudulent) as total_fake, CAST((AVG(fraudulent)*100) AS DECIMAL(5,2)) as per_fake, COUNT(*) as total_jobs
FROM postings
GROUP BY has_company_logo, has_reqs
ORDER BY per_fake DESC;