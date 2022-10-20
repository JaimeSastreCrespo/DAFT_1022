USE exc_sql2;

-- Challenge 1 - Most Profiting Authors
-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication

SELECT a.au_id, t.title_id, (t.advance * ta.royaltyper / 100) AS advance, 
		(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id;

-- Step 2: Aggregate the total royalties for each title and author

SELECT a.au_id, t.title_id, SUM(t.advance * ta.royaltyper / 100) AS sum_advance, 
		SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sum_sales_royalty
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, t.title_id
ORDER BY a.au_id;

-- Step 3: Calculate the total profits of each author

SELECT a2.au_id, SUM(a2.totalprof) as profit
FROM 
(SELECT a.au_id, t.title_id, (SUM((t.advance * ta.royaltyper / 100)) + 
SUM((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100))) AS totalprof
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, t.title_id
ORDER BY a.au_id) AS a2
GROUP BY a2.au_id
ORDER BY profit DESC
LIMIT 3;

-- Challenge 2 - Alternative Solution.
-- We'd like you to try the other way:
-- Creating MySQL temporary tables and query the temporary tables in the subsequent steps.
CREATE TEMPORARY TABLE  IF NOT EXISTS temptabl2
SELECT a.au_id, t.title_id, (SUM((t.advance * ta.royaltyper / 100)) + 
SUM((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100))) AS total
FROM authors a
INNER JOIN titleauthor ta
ON a.au_id = ta.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, t.title_id
ORDER BY a.au_id;

SELECT temptabl2.au_id, SUM(temptabl2.total) as profit
FROM temptabl2
GROUP BY temptabl2.au_id
ORDER BY profit DESC
LIMIT 3;

-- Challenge 3
-- Elevating from your solution in Challenge 1 & 2, create a permanent table 
-- named most_profiting_authors to hold the data about the most profiting authors. 
-- The table should have 2 columns:
-- au_id - Author ID
-- profits - The profits of the author aggregating the advances and royalties
CREATE TABLE most_profiting_authors2
SELECT temptabl2.au_id, SUM(temptabl2.total) as profits2
FROM temptabl2
GROUP BY temptabl2.au_id
ORDER BY profits2 DESC
LIMIT 3;