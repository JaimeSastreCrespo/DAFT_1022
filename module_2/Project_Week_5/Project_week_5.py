import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import warnings
import seaborn as sns
warnings.filterwarnings("ignore")
from PIL import Image


image = Image.open('market.jpg')

st.image(image, caption='Market by google images')

supermar = pd.read_csv(r'/Users/jaimesastrecrespo/DAFT_1022/module_2/Project_Week_5/supermar_clean.csv')
supermar.head()

#cleaning done in script try_project.ipynb, imported the clean data

########################################################

######### STREAMLIT #######



#st.set_page_config(layout="wide")



st.markdown("# Supermarket Sales Analysis ")   ## Main Title
st.markdown("This is a sales analysis from the supermarkets in Naypyitaw, Yangon and Mandalay.")


### Fig 1: Distribution of Rating with button

st.markdown('Press the button to see the distribution of rating')

result = st.button("Click here ")

st.write(result)

if result: 

    fig = plt.figure()
    sns.distplot(supermar['Rating'])
    plt.axvline(x=np.mean(supermar['Rating']), c='red', ls='--', label='mean')
    plt.axvline(x=np.percentile(supermar['Rating'],25),c='green', ls='--', label = '25th percentile:Q1')
    plt.axvline(x=np.percentile(supermar['Rating'],75),c='orange', ls='--',label = '75th percentile:Q3' )
    plt.legend()
    st.pyplot(fig)
    flag = True

else:
    st.write("Come on, click please")
    flag = False

    ### Fig 2: Does Total and quantity affect the ratings that the customers provide? with slectbox and if statement

st.markdown("### Does Total and quantity affect the ratings that the customers provide?")   ## Main Title

option = st.selectbox(
    'Choose what you want to see',
    ('total', 'quantity'))

if option == 'total':
    fig2 = plt.figure()
    sns.regplot(x="Rating",
            y="total", 
            data=supermar)
    st.pyplot(fig2)

elif option == 'quantity':
    fig2 = plt.figure()
    sns.regplot(x="Rating",
            y="quantity", 
            data=supermar)
    st.pyplot(fig2)

### Fig 3 : Is there any difference in aggregate sales across City, etc? with slectbox and if statement

st.markdown("### Differences in aggregate sales accross City, Payment method and gender ")   ## Main Title

option = st.selectbox(
    'Choose what you want to see',
    ('city', 'payment', 'gender'))

if option == 'city':
    fig3 = plt.figure()
    sns.countplot(supermar['city'])
    supermar['city'].value_counts()
    st.pyplot(fig3)
    

elif option == 'payment':
    fig3 = plt.figure()
    sns.countplot(supermar['payment'])
    supermar['payment'].value_counts()
    st.pyplot(fig3)
    
elif option == 'gender':
    fig3 = plt.figure()
    sns.countplot(supermar['gender'])
    supermar['gender'].value_counts()
    st.pyplot(fig3)


st.write('You selected:', option)

  

    

######### 

st.sidebar.write("### Hello 😀!")
st.sidebar.write("You can set up different display options here below")
st.sidebar.write("")
st.sidebar.write("##### Please, first go through the main screen. You'll be asked to use the side bar at some point.")  



### Sidedbar days selection
unique_day = supermar.day_name.unique()
selected_day = st.sidebar.multiselect("Select one or more options:",unique_day,unique_day)

all_options1 = st.sidebar.checkbox("Select all days")

if all_options1:
    selected_day = unique_day



### Sidedbar month selection
unique_month = supermar.month.unique()
selected_month = st.sidebar.multiselect('month', unique_month,unique_month)

all_options2 = st.sidebar.checkbox("Select all months ")

if all_options2:
    selected_month = unique_month

# Sidebar - gender selection
unique_gen = supermar.gender.unique()
selected_gen = st.sidebar.multiselect('gender', unique_gen,unique_gen)

all_options3 = st.sidebar.checkbox("Select both genders ")

if all_options3:
    selected_gen = unique_gen


# Sidebar - product line selection
unique_prod = supermar.product_line.unique()
select_line = st.sidebar.multiselect('product_line', unique_prod,unique_prod)

all_options4 = st.sidebar.checkbox("Select all lines of product ")

if all_options4:
    select_line = unique_prod


# Sidebar - city selection
unique_city = supermar.city.unique()
selected_city = st.sidebar.multiselect('city', unique_city,unique_city)

all_options5 = st.sidebar.checkbox("Select all cities ")

if all_options5:
    selected_city = unique_city


df2 = supermar.loc[(supermar['day_name'].isin(selected_day)) &(supermar['gender'].isin(selected_gen)) &(supermar['product_line'].isin(select_line))& (supermar['city'].isin(selected_city)) & (supermar['month'].isin(selected_month))]
# df2= df2.loc[df2['gender'].isin(selected_gen)]
# df2=df2.loc[df2['product_line'].isin(product_line)]
# df2=df2.loc[df2['city'].isin(selected_city)]
# df2=df2.loc[df2['month'].isin(selected_month)]

st.markdown("### Customers behaviour showing the total amount of money spent per day,product line and gender")   ## Main Title
st.markdown("##### Please, select options in your sidebar to display what you want")   

st.bar_chart(df2, x="day_name", y="total")

if len(df2) >0:
    fig4 = plt.figure()
    plt.title('Total Monthly transaction by Gender')
    sns.countplot(df2['product_line'], hue = df2.gender)
    plt.xticks(rotation = 45)
    st.pyplot(fig4)



## Which product line generates most income?
cat=df2[["product_line", "gross_income"]].groupby(['product_line'], as_index=False).sum().sort_values(by='gross_income', ascending=False)
if len(cat) >0:

    fig5 = plt.figure(figsize=(25,10))
    plt.title('Which product line generates more income?')
    sns.barplot(x='product_line', y='gross_income', data=cat)
    st.pyplot(fig5)


 ## Which hour of the day is the busiest?
if len(cat) >0:
    fig6 = plt.figure()
    plt.title('Which hour of the day is the busiest?')
    sns.lineplot(x="Hour",  y = 'quantity',data =df2).set_title("Product Sales per Hour")
    st.pyplot(fig6)

