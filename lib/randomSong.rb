# Obtains the rspotify and authenticates user (temporary)
require 'rspotify'
RSpotify.authenticate("c8f6f96e5c804f51bcc45f9786612a5c", "a793c119ddb54663a98b67b892cdf716")

# Obtains the user's playlists; 
# NOTE: they are stored in the array as IDs and require the name function to be called to display their "names"

# First, checks if the user playlist is empty (array is empty)

# Asks the user for input and obtains the playlist name they want to pick the song from

# A new array, which will contain all of the user's playlist, but instead of being in ID form, it will be converted to name string

# Goes into the array (contains playlist by ID) and converts each playlist ID array into an array of names

# If the user does not enter a playlist name with at least 12 songs, it asks them to enter again
# Finding the playlist index in the array of playlists (organized by name) given the user's correct input

# Array of the Selected Playlist Songs (by ID)

# Array of the Selected Playlist Songs (by Name)
selected_playListName = Array.new()

# Converts each song (ID format) in array of array of names
selected_playListID.each { |i| selected_playListName << i.name }

# Getting a random song
# Random_Song Array
random_songArr = Array.new()

# Gets four random songs (by index) from selected_playList
4.times {
}

# Selects a random index from 0 to 4, which will be the "correct" song from the random_songArr
correctSongIndex = rand(4)

# ------ This is where the song will be played -----

# Displays options to the user
for i in 0...random_songArr.length()
    random = random_songArr[i]
    puts "#{i+1}. #{selected_playListName[random]}"
end



