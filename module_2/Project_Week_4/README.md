![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Project | Project 4: Data visualization of French salaries (aka number of companies in France and their size)


In this project we processed, cleaned and explored data from a database which contains the number of companies per french cities. After explored the data, we found that we didn't have missing values, 0 duplicates... that was great news, but the tough part of our project was to find some logical insights to show in our charts, because we didn't have too much information to show: just the number of companies per town, the size of the companies and nothing else. That's why we had a high correlation between our columns, because each one depends on each one, as most of them where showing the number of employees per companies.

We created three more columns, grouping the sizes of the companies because we had too much columns to classify the size and we consider the following:

- From 1 to 19 employees : small
- From 20 to 199: medium
- Over 200 : big

We focus our charts on showing how centralised is France in terms of economy. We can say that Paris is the center of the economy in terms of number of companies. In fact, Paris is the number one also in terms of size, as it's logical to think that. 

We also displayed a map to show the top 10 cities where you can find the highest number of companies in France. We can affirm if you are looking a job in France, the highest probability of finding one is going to be in Paris, even if you want in a samll, medium or big company. 

Another tough part of our data is data the size of the companies is unknown in almost the 50% of the cities. So, we just checked if the top 10 cities in terms of numbers of firms is being affected because of this, but no. It's the same list even if we take into account all the cities or we only take into account the number of cities with more than 75% info of the size of the company.

List of charts:
- Correlation heat map
- Scatter plot (to explain that we have a huge difference between Paris and the rest of the cities)
-  Histogram(How many cities have the same number of companies (aprox)?)
- Map location by folium (to show the top ten cities in France with the highest number of companies// and top 50)
- Density mapbox by plotly.express (to display how it's distributed the number of companies of the top 10 cities // and top 50)
- Pie chart (to show how the size of the company it's distributed in the top 5 cities and also how it's distributed the big companies in that 10 cities, medium companies and small companies)
- bar chart (to show the difference between Paris and the rest of the cities)
- Bar plot (of the top 20 cities in terms of total firms)
- Bubble scatter plot



This has been a good lesson to deal with the creation of charts, but also to think and struggle with the database and find logical information that we can extract from a database.




* 




