# Obtains the rspotify and authenticates user (temporary)
require 'rspotify'
RSpotify.authenticate("c8f6f96e5c804f51bcc45f9786612a5c", "a793c119ddb54663a98b67b892cdf716")

# Finds the username
username = RSpotify::User.find('guilhermesad')

# Other usernames below (test purposes)
#guilheremsad
#camteasdale143
#commet357

# Obtains the user's playlists; 
# NOTE: they are stored in the array as IDs and require the name function to be called to display their "names"
user_playListsID = username.playlists

# First, checks if the user playlist is empty (array is empty)
raise 'Please create a playlist. You must have at least one' if (user_playListsID.empty?)

# Asks the user for input and obtains the playlist name they want to pick the song from
puts 'Enter a playlist you want to pick a song from (MUST BE EXACT): '
chosen_playlist = gets.chomp

# A new array, which will contain all of the user's playlist, but instead of being in ID form, it will be converted to name string
user_playListsName = Array.new()

# Goes into the array (contains playlist by ID) and converts each playlist ID array into an array of names
user_playListsID.each { |i| user_playListsName << i.name }

# If the user does not enter a playlist name with at least 12 songs, it asks them to enter again
while ((user_playListsName.include? chosen_playlist) == false) && (chosen_playlist.length() < 12)
    puts "Your playlist isn't valid. Please enter a valid playlist name WITH at least 12 songs: "
    chosen_playlist = gets.chomp
end

# Finding the playlist index in the array of playlists (organized by name) given the user's correct input
playlist_index = user_playListsName.find_index(chosen_playlist)

# Array of the Selected Playlist Songs (by ID)
selected_playListID = user_playListsID[playlist_index].tracks

# Array of the Selected Playlist Songs (by Name)
selected_playListName = Array.new()

# Converts each song (ID format) in array of array of names
selected_playListID.each { |i| selected_playListName << i.name }

# Getting a random song
# Random_Song Array
random_songArr = Array.new()

# Gets four random songs (by index) from selected_playList
4.times {
    randNum = rand(0..selected_playListID.length)
    random_songArr << randNum
}

# Selects a random index from 0 to 4, which will be the "correct" song from the random_songArr
correctSongIndex = rand(4)

# ------ This is where the song will be played -----

# Displays options to the user
puts "Please pick a song from the list below:"
for i in 0...random_songArr.length()
    random = random_songArr[i]
    puts "#{i+1}. #{selected_playListName[random]}"
end



