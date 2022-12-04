import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import pytube
import os
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
from google.oauth2 import service_account
import gspread
import textwrap, random
from spotifuncs import create_df_top_songs, append_audio_features , authenticate, create_df_recommendations
from pathlib import Path
import spotipy.util as util


st.set_page_config(page_title="Your spotify history",page_icon="🎵",initial_sidebar_state="expanded")



# Setup Spotify
path = Path("/Users/jaimesastrecrespo/DAFT_1022/Final_project/spotify_App")

with open(path / "client_s.txt") as f:
    content = f.readlines()
content = [x.strip() for x in content]

client_id = content[0]
client_secret = content[1]
redirect_uri = 'http://127.0.0.1:8080/yep'
username = content[3]
scope = "user-library-read user-read-recently-played user-top-read playlist-modify-public playlist-read-private playlist-read-collaborative"

client_credentials_manager = SpotifyClientCredentials(client_id=client_id, 
                                                      client_secret=client_secret)

sp = spotipy.Spotify(client_credentials_manager = client_credentials_manager)

sp_m = authenticate(redirect_uri, client_credentials_manager, username, scope, client_id, client_secret)

token = util.prompt_for_user_token(username, scope, client_id, client_secret, redirect_uri)

if token:
    sp = spotipy.Spotify(auth=token)
else:
    print("Can't get token for", username)



results_fav_songs = sp.current_user_top_tracks(limit = 50,offset=0,time_range='short_term')

top_tracks_short = sp.current_user_top_tracks(limit = 50,offset=0,time_range='short_term')
top_tracks_med = sp.current_user_top_tracks(limit = 50,offset=0,time_range='medium_term')
top_tracks_long = sp.current_user_top_tracks(limit = 50,offset=0,time_range='long_term')

#combine the top_tracks
top_tracks_short_df = append_audio_features(create_df_top_songs(top_tracks_short),sp)
top_tracks_med_df = append_audio_features(create_df_top_songs(top_tracks_med),sp)
top_tracks_long_df = append_audio_features(create_df_top_songs(top_tracks_long),sp)

top_tracks_short_df["Timeframe"] = "short term"
top_tracks_med_df["Timeframe"] = "medium term"
top_tracks_long_df["Timeframe"] = "long term"

top_tracks = pd.concat([top_tracks_short_df, top_tracks_med_df, top_tracks_long_df])
top_tracks = top_tracks.reset_index(drop = True)

st.write('---')

st.markdown("# YOur spotify history ")   ## Main Title
expander_bar = st.expander("About this project")
expander_bar.markdown("""
* This is a sales analysis from the supermarkets in Naypyitaw, Yangon and Mandalay (from Myanmar).
    * We will see:
        * Correlation matrix of our dataset.
        * Where are our target cities of this dashboard.
        * How are the ratings and what can affect the ratings of the customers.
        * Differences between sales accross City, payment methods, and gender.
        * Customer behaviour showing per days.
        * Differences in product line by Male/Female.
        * Finding the product line which generates more income.
        * Looking for the hour of the day when is the busiest moment.
        * Monthly trend.
        * Full dynamic chart.
* **Python libraries:** pandas, streamlit, numpy, matplotlib, seaborn, warnings, altair and Image.
""")


st.write('---')