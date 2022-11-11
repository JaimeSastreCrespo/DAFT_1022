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

### Fig 2 : Is there any difference in aggregate sales across City, etc? with slectbox and if statement

st.markdown("### Differences in aggregate sales accross City, Payment method and gender ")   ## Main Title

option = st.selectbox(
    'Choose what you want to see',
    ('city', 'payment', 'gender'))

if option == 'city':
    fig2 = plt.figure()
    sns.countplot(supermar['city'])
    supermar['city'].value_counts()
    st.pyplot(fig2)

elif option == 'payment':
    fig2 = plt.figure()
    sns.countplot(supermar['payment'])
    supermar['payment'].value_counts()
    st.pyplot(fig2)
    
elif option == 'gender':
    fig2 = plt.figure()
    sns.countplot(supermar['gender'])
    supermar['gender'].value_counts()
    st.pyplot(fig2)


st.write('You selected:', option)

  
### Fig 3: Does Total and quantity affect the ratings that the customers provide? with slectbox and if statement

st.markdown("### Does Total and quantity affect the ratings that the customers provide?")   ## Main Title

option = st.selectbox(
    'Choose what you want to see',
    ('total', 'quantity'))

if option == 'total':
    fig3 = plt.figure()
    sns.regplot(x="Rating",
            y="total", 
            data=supermar)
    st.pyplot(fig3)

elif option == 'quantity':
    fig3 = plt.figure()
    sns.regplot(x="Rating",
            y="quantity", 
            data=supermar)
    st.pyplot(fig3)
    

######### 


### Sidedbar days selection
unique_day = supermar.day_name.unique()
selected_day = st.sidebar.multiselect('days', unique_day)


# Sidebar - gender selection
unique_gen = supermar.gender.unique()
selected_gen = st.sidebar.multiselect('gender', unique_gen)



# Sidebar - gender selection
unique_prod = supermar.product_line.unique()
product_line = st.sidebar.multiselect('product_line', unique_prod)


df2 = supermar.loc[supermar['day_name'].isin(selected_day)]
df2= df2.loc[df2['gender'].isin(selected_gen)]
df2=df2.loc[df2['product_line'].isin(product_line)]

st.markdown("### Customers behaviour showing the total amount of money spent per day,product line and gender")   ## Main Title
st.markdown("##### Please, select options in your sidebar to display what you want")   

st.bar_chart(df2, x="day_name", y="total")

if len(df2) >0:
    fig4 = plt.figure()
    plt.title('Total Monthly transaction by Gender')
    sns.countplot(df2['product_line'], hue = df2.gender)
    plt.xticks(rotation = 45)
    st.pyplot(fig4)




