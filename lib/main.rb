require 'rspotify'
require_relative 'auth'

user = SpotifyAccount.new()

#make sure that a spotify device is open for playing
user.test_valid_spotify('loud')

#stages a song to be played on the users account by the song id. The second parameter is the start time this will stage the song to be at 30.31 seconds in
user.stage_song('4iV5W9uYEdYUVa79Axb7Rh', 30.31)

#start playback of a song
user.play

#pause playback of a song








