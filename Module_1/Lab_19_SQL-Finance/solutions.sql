-- 1. From the order_items table, find the price of the highest priced order and lowest price order.
select max(price) from order_items;
select min(price) from order_items;

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?
 ## to find the range we can use the min and max functions to find the range.
select min(shipping_limit_date) from order_items; 
select max(shipping_limit_date) from order_items;

-- 3. From the customers table, find the states with the greatest number of customers.alter
select customer_state, count(*) from customers
group by customer_state
order by count(customer_state) desc;

-- 4. From the customers table, within the state with the greatest number of customers,
-- find the cities with the greatest number of customers.
select customer_city, count(*) from customers
where customer_state = 'SP'
group by customer_city
order by count(*) desc
Limit 10;

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?
select count(DISTINCT business_segment) from closed_deals
where business_segment is not null;

-- 6.. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment
-- and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).

SELECT business_segment, SUM(declared_monthly_revenue) AS declared_monthly_revenue
FROM closed_deals
GROUP BY business_segment
ORDER BY declared_monthly_revenue DESC
LIMIT 3;

-- 7. From the order_reviews table, find the total number of distinct review score values.
select count(DISTINCT review_score) from order_reviews
where review_score is not null;

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number 
-- category for each review score from 1 - 5, then find the review score and category occurring most
-- frequently in the table.

select review_score, count(review_score), 
(CASE review_score
	when 1 then 'Very poor'
    when 2 then 'poor'
    when 3 then 'neutral'
    when 4 then 'Good'
	when 5 then 'Amazing'
    else 'NOT FOUND'
end) As reviews_ordered
from order_reviews 
group by review_score
order by count(review_score) DESC;


-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.

SELECT review_score, COUNT(review_score) AS value_occurrence 
FROM order_reviews
GROUP BY review_score
ORDER BY value_occurrence DESC
LIMIT 1;


