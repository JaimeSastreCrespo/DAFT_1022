use exc_sql2; -- it's my publications database


SELECT Store, ord_num AS OrderNumber, ord_date AS OrderDate, title AS Title, sales.qty AS Qty, price AS Price, type as Type
FROM (
	SELECT stores.stor_id AS StoreID, stores.stor_name AS Store, COUNT(DISTINCT(ord_num)) AS Orders, COUNT(title_id) AS Items, SUM(qty) AS Qty
	FROM exc_sql2.sales sales
	INNER JOIN exc_sql2.stores stores ON stores.stor_id = sales.stor_id
	GROUP BY StoreID, Store
) summary
INNER JOIN exc_sql2.sales sales ON summary.StoreID = sales.stor_id
INNER JOIN exc_sql2.titles ON sales.title_id = titles.title_id
WHERE Items / Orders > 1;