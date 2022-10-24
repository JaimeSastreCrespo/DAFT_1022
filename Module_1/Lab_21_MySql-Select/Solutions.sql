USE exc_sql2;



-- Challenge 1 :In this challenge you will write a MySQL SELECT query that joins various 
-- tables to figure out what titles each author has published at which pubtitleauthortitlespublisherslishers. 

SELECT a.au_id , CONCAT(a.au_lname, " ", a.au_fname) AS Fullname, t.title_id, tit.title_id, p.pub_id
from authors a
LEFT JOIN titleauthor t
ON a.au_id = t.au_id
LEFT JOIN titles tit
ON t.title_id = tit.title_id
LEFT JOIN publishers p
ON tit.pub_id = p.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?
-- Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher.

SELECT CONCAT(a.au_lname, " ", a.au_fname) AS Fullname, p.pub_name, COUNT(*) as Totaltitles
FROM authors a
INNER JOIN titleauthor t
ON a.au_id = t.au_id
LEFT JOIN titles tit
ON t.title_id = tit.title_id
LEFT JOIN publishers p
ON tit.pub_id = p.pub_id
GROUP BY Fullname, p.pub_name
;

-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.
SELECT a.au_id , CONCAT(a.au_lname, " ", a.au_fname) AS Fullname, SUM(s.qty) AS highsold
FROM titleauthor t
INNER JOIN authors a
ON t.au_id = a.au_id
INNER JOIN titles tit
ON t.title_id = tit.title_id
INNER JOIN sales s
ON tit.title_id = s.title_id
GROUP BY a.au_id
ORDER BY highsold DESC 
LIMIT 3;


-- Challenge 4 - Best Selling Authors Ranking
-- Now modify your solution in Challenge 3 so that the output will display all 23 
-- authors instead of the top 3. Note that the authors who have sold 0 titles should 
-- also appear in your output (ideally display 0 instead of NULL as the TOTAL).
-- Also order your results based on TOTAL from high to low.
SELECT a.au_id , CONCAT(a.au_lname, " ", a.au_fname) AS Fullname, IFNULL (SUM(s.qty), 0) AS highsold
FROM authors a 
LEFT JOIN titleauthor t
ON a.au_id = t.au_id
LEFT JOIN titles tit
ON t.title_id = tit.title_id
LEFT JOIN sales s
ON tit.title_id = s.title_id
GROUP BY a.au_id
ORDER BY highsold DESC ;


