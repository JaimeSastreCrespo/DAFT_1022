use apple_test;
select * from applestore;
select prime_genre from applestore
group by prime_genre;  -- genres

select prime_genre from applestore
group by prime_genre
order by sum(rating_count_tot) desc
LIMIT 1; -- max rated genre apps

select prime_genre from applestore
group by prime_genre
order by count(id) desc
LIMIT 1; -- max apps genre apps


select prime_genre from applestore
group by prime_genre
order by count(id) asc
LIMIT 1; -- min apps genre apps

select track_name from applestore
order by rating_count_tot desc
LIMIT 10; -- most 10 apps genre apps

select track_name from applestore
order by user_rating desc
LIMIT 10; -- most 10 apps best rated genre apps


-- The most rated app is Facebook. Makes sense because I'm assuming 
-- that nowadays we are super connected and we want to be connected every hour.

-- The most best rated app s Sudoko, maybe because it's a complicated game and the players
-- really appreciate to have an app that works well and efficiently.

-- maybe the apps most used are not the best rated and the users don't take the time to rate the apps. 
-- As they are also the most used, maybe people don't think it's necessary to rate the app becasue it's well known.

-- I could do the product of user rating and number of votes.

select track_name from applestore
order by rating_count_tot desc
LIMIT 10; -- most 10 apps genre apps --looking for the most used apps and (next query)

select track_name, price from applestore
where price < 0.5
order by track_name desc; -- the apps with price lower than 0.5, this means for free, we can see a relation between the free apps and the most used apps.

-- we can affirm that the most 10 apps genre apps, are for free. So yes, users care about prices of apps

