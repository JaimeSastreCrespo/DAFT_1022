import streamlit as st
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials
from pathlib import Path
import spotipy.util as util

scope = "user-library-read user-read-recently-played user-top-read playlist-modify-public playlist-read-private playlist-read-collaborative"

path = Path("/Users/jaimesastrecrespo/DAFT_1022/Final_project_Spotify/Notebooks")

with open(path / "client_s.txt") as f:
    content = f.readlines()
content = [x.strip() for x in content]


# Set up Spotify API client
client_id = content[0]
client_secret = content[1]
redirect_uri = 'http://127.0.0.1:8080/spotyp'


client_credentials_manager = SpotifyClientCredentials(client_id=client_id, client_secret=client_secret)
sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)

# Ask user for their username and playlist name
username = st.text_input("Enter your Spotify username:")
playlist_name = st.text_input("Enter a name for your playlist:")


from spotifuncs2 import create_df_top_songs, append_audio_features , authenticate, create_df_recommendations
import pandas as pd

# Get user's short term loved songs
top_tracks_short = sp.current_user_top_tracks(limit = 50,offset=0,time_range='short_term')
top_tracks_short_df = append_audio_features(create_df_top_songs(top_tracks_short),sp)
seed_tracks = top_tracks_short_df["track_id"].tolist()
sp_m = authenticate(redirect_uri, client_credentials_manager, username, scope, client_id, client_secret)

recomm_dfs = []
for i in range(5,len(seed_tracks)+1,5):
    recomms = sp_m.recommendations(seed_tracks = seed_tracks[i-5:i],limit = 10)
    recomms_df = append_audio_features(create_df_recommendations(recomms),sp_m)
    recomm_dfs.append(recomms_df)
recomms_df = pd.concat(recomm_dfs)
recomms_df.reset_index(drop = True, inplace = True)

# Create a new playlist for the user
playlist = sp.user_playlist_create(username, playlist_name)

# Add the user's loved songs to the playlist
sp.user_playlist_add_tracks(username, playlist["id"], tracks = recomms_df["track_id"].tolist()[:100])
    
# Confirm that the playlist has been created and songs added
st.header("Success! Your playlist has been created and songs added.")
