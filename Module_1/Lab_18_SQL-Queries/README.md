![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | My first queries

Please, download the file applestore.csv.
Install MySQL/Postgresql on your computer.
Create a database
Upload the file as a new table of your database

Use the *data* table to query the data about Apple Store Apps and answer the following questions: 

**1. What are the different genres?**
select prime_genre from applestore
group by prime_genre;  
'Games'
'Productivity'
'Weather'
'Shopping'
'Reference'
'Finance'
'Music'
'Utilities'
'Travel'
'Social Networking'
'Sports'
'Business'
'Photo & Video'
'Navigation'
'Entertainment'

**2. Which is the genre with the most apps rated?**
select prime_genre from applestore
group by prime_genre
order by sum(rating_count_tot) desc
LIMIT 1; #max rated genre apps

Social Networking
**3. Which is the genre with most apps?**
select prime_genre from applestore
group by prime_genre
order by count(id) desc
LIMIT 1; #max apps genre apps

Games
**4. Which is the one with least?**
select prime_genre from applestore
group by prime_genre
order by count(id) asc
LIMIT 1; -- min apps genre apps

Entertainment
**5. Find the top 10 apps most rated.**
select track_name from applestore
order by rating_count_tot desc
LIMIT 10; -- most 10 apps genre apps

'Facebook'
'Pandora - Music & Radio'
'Bible'
'PAC-MAN'
'Google Earth'
'Shazam - Discover music, artists, videos & lyrics'
'eBay: Best App to Buy, Sell, Save! Online Shopping'
'Yelp - Nearby Restaurants, Shopping & Services'
'WeatherBug - Local Weather, Radar, Maps, Alerts'
'Evernote - stay organized'

**6. Find the top 10 apps best rated by users.**
select track_name from applestore
order by user_rating desc
LIMIT 10; -- most 10 apps best rated genre apps

':) Sudoku +'
'iQuran'
'Sonos Controller'
'Juxtaposer'
'Hurricane Pro'
'Bible'
'Mileage Log | Fahrtenbuch'
'Solitaire by MobilityWare'
'PCalc - The Best Calculator'
'Ms. PAC-MAN'

**7. Take a look at the data you retrieved in question 5. Give some insights.**

-- The most rated app is Facebook. Makes sense because I'm assuming 
-- that nowadays we are super connected and we want to be connected every hour.

**8. Take a look at the data you retrieved in question 6. Give some insights.**
-- The most best rated app s Sudoko, maybe because it's a complicated game and the players
-- really appreciate to have an app that works well and efficiently.

**9. Now compare the data from questions 5 and 6. What do you see?**
-- maybe the apps most used are not the best rated and the users don't take the time to rate the apps. 
-- As they are also the most used, maybe people don't think it's necessary to rate the app becasue it's well known.

**10. How could you take the top 3 regarding both user ratings and number of votes?**
-- I could do the product of user rating and number of votes.

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
select track_name from applestore
order by rating_count_tot desc
LIMIT 10; -- most 10 apps genre apps --looking for the most used apps and (next query)

'Facebook'
'Pandora - Music & Radio'
'Bible'
'PAC-MAN'
'Google Earth'
'Shazam - Discover music, artists, videos & lyrics'
'eBay: Best App to Buy, Sell, Save! Online Shopping'
'Yelp - Nearby Restaurants, Shopping & Services'
'WeatherBug - Local Weather, Radar, Maps, Alerts'
'Evernote - stay organized'

select track_name, price from applestore
where price < 0.5
order by track_name desc; -- the apps with price lower than 0.5, this means for free, we can see a relation between the free apps and the most used apps.

'Yelp - Nearby Restaurants, Shopping & Services','0'
'Yahoo Sports - Teams, Scores, News & Highlights','0'
'WeatherBug - Local Weather, Radar, Maps, Alerts','0'
'TripAdvisor Hotels Flights Restaurants','0'
'Sonos Controller','0'
'Shazam - Discover music, artists, videos & lyrics','0'
'PayPal - Send and request money safely','0'
'Pandora - Music & Radio','0'
'PAC-MAN','0'
'Google Earth','0'
'FOX Sports Mobile','0'
'Facebook','0'
'Evernote - stay organized','0'
'eBay: Best App to Buy, Sell, Save! Online Shopping','0'
'Deezer - Listen to your Favorite Music & Playlists','0'
'Bible','0'


-- we can affirm that the most 10 apps genre apps, are for free. So yes, users care about prices of apps
--

## Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
