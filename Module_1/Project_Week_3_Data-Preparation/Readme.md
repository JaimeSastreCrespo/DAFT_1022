<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Cleaning-Data-with-pandas!
## Exploring data of renting houses in Spain, cleaning and building queries to answer relevant questions.

I processed, cleaned, explored and understood data from several offers to rent houses in Spain in this project. After precessing and cleaning the data, trying to drop the less number of rows possibles (just dropped 5.3% of the data), I realized that the column with the whole description about the place which is in renting, was so difficult to 'clean' or 'split' in any way because it has a wide range of variety in terms of values . 

One of the reasons why I wanted to keep this column is the whole information given on it. That is highly appreciated so I didn't want to drop that column in terms of know which type of house we are talking about. The second reason I couldn't split it in a proper way was the differents forms of text I found on it. So I decided to leave it that way and try to build another column to know the city where is the house. It worked in most of the rows, but in some of them it wasn't the perfect approach. I try to find solutions as convert the address in longitude and latitude and after convert non-numerical variables using a target encoder but I didn't find this very useful as I had values on that column with no option to implement this solution.


When I got my clean data, I exported to CSV to save it in my laptop and connecting my Python with MySQL to export clean data into MySQL using Pandas. In MySQL I implemented queries to find answers to questions such as which is the most expensive city or province (ciudad o provincia), which is the area (comunidad autonoma) with the highest number of houses availables to rent and same for provinces, most expensive place to rent with the description of it to see if it makes sense, which is the city with the house with max metres... 

I found most of my results logicals and they make sense, but other ones no because of the data... i.e. a house of 32 rooms by 53o euros in Cantabria (good place and kind of expensive in Spain)... not really accurate. This project was really useful to face data with a lot of variety and looking for logical solutions depending on the field you are treating that concrete data. 


---



