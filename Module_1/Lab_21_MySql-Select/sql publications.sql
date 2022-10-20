USE exc_sql2;

Select pubs.pub_name, COUNT(titles.title_id) AS Titles
From publishers pubs
LEFT JOIN titles titles
ON pubs.pub_id = titles.pub_id
GROUP BY pubs.pub_name;

Select *
From employee emp
LEFT JOIN jobs job
ON emp.job_id = job.job_id
UNION 
Select *
From employee emp
RIGHT JOIN jobs job
ON emp.job_id = job.job_id;

Select pubs.pub_name, COUNT(titles.title_id) AS Titles
From publishers pubs
INNER JOIN titles titles
ON pubs.pub_id = titles.pub_id
GROUP BY pubs.pub_name;
