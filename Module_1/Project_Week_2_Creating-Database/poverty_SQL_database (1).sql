 -- create database Proj_Poverty2;
use Proj_Poverty2;

 -- Here we have uploaded 4 databases
 -- After, we have modified 4 Average colum names to unique ones

 ALTER TABLE gdp_data
 RENAME COLUMN Average TO Average_GDP;

 ALTER TABLE health_data
 RENAME COLUMN Average TO Average_health;

 ALTER TABLE unemploy_data
 RENAME COLUMN Average TO Average_unemploy;

 ALTER TABLE violence_data
 RENAME COLUMN Average TO Average_violence;

select gd.Country, gd.Average_GDP, hd.Average_health, ud.Average_unemploy, vd.Average_violence
from gdp_data gd
left join health_data hd
on gd.Country = hd.Country
left join unemploy_data ud
on hd.Country = ud.Country
left join violence_data vd
on ud.Country = vd.Country;

-- We have exported to .csv output of Join Left to create internal_poverty_join -> our data frame table for creation of indicator

-- We have created indicator in Excel and uploaded it into proj_poverty2 as internal_poverty_indicator to return some VERY useful insights -> Min and Max of our indicator

SELECT Country, `Internal Poverty Indicator`
FROM internal_poverty_indicator
WHERE `Internal Poverty Indicator` = ( SELECT MIN(`Internal Poverty Indicator`) FROM internal_poverty_indicator);

SELECT Country, `Internal Poverty Indicator`
FROM internal_poverty_indicator
WHERE `Internal Poverty Indicator` = ( SELECT max(`Internal Poverty Indicator`) FROM internal_poverty_indicator);

-- We are uploading into SQL external indicator from OECD about poverty and altering name of last column with indicator itself

 ALTER TABLE oecd_data_poverty_percentage_population
 RENAME COLUMN Average TO External_Poverty_Indicator;

-- Using Join Left we are presenting both - internal and external indicators next to each other

ALTER TABLE oecd_data_poverty_percentage_population
RENAME COLUMN `ď»żCountry` TO Country;

select id.Country, id.`Internal Poverty Indicator`, ed.External_Poverty_Indicator
from internal_poverty_indicator id
left join oecd_data_poverty_percentage_population ed
on id.Country = ed.Country;

-- After exporting data we create graph in Excel to show corelation between the data



