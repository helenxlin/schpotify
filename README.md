# Schpotify 

Schpotify is a CLI game using the Spotify API designed for Shopifolk teams who want to take a quick break and blow off steam with some friendly song-guessing competition. Choose a playlist from your Spotify, a song will start playing, after 5 seconds a list of 5 songs to guess the correct option. The faster you guess [correctly], the higher your score. 


### User Authorization

In order to use any of the user specific functions for spotify users must be instantiated
```ruby
user = SpotifyAccount.new
```

A multitude of functions can be applied on the user such as:
- `user.pause` pauses the current song
- `user.play` plays the current song
- `user.account` an object with account info for the spotify user _display name, email, etc_
- `user.player_information` returns information about the current spotify player _isplaying, songname_
- `user.test_valid_spotify(mode)` tests the status of the current spotify player, if the `"silent"` is passed as a parameter the function will run without outputing anything to the terminal if everything is working properly. This function should be used frequently to check that the users spotify player is stil working
### Testing

In order to write tests, add a test file to the tests folder. To run all tests type `rake` into the base directory of the project.

### Game

#### RSpotify 
Once logged in and authorized, the program uses RSpotify. RSpotify is a ruby wrapper for Spotify Web API which enables access to public Spotify playlists (including user's own playlists) and song data. In order to gain access, ```ruby gem 'rspotify' ``` must be added in the application's Gemfile. A multitude of functions can be applied using RSpotify, which can be found here: [RSpotify Usage](https://github.com/guilhermesad/rspotify)

The game class is responsible for the entire game procedure and implements a variety of functions:
- `select_playlist_list` asks the user to select a playlist: users can select between their own playlist, popular playlists, or search for a playlist.
- `select_playlist` displays all playlists with over 15 songs for the user and their difficulty level
- `create_song_list` creates a list of 4 random songs from the playlist and stores the correct song for each round.
- `calculate_points` scoring algorithm for the number of points, which is dependent on the number of seconds user takes to identify song
- `play_with_song_list` plays the song from the user's Spotify account and determines if the user selected the correct song from the list printed of all the songs. This function also times the user from the moment the song plays and until the user selects an option, and displays the score using the calculate_points function
