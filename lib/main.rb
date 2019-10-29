require_relative 'game'

game = Game.new

score = 0;
playlist = game.select_playlist

4.times do 
  song_list = game.create_song_list(playlist)
  result = game.play_with_song_list(song_list)
  if result
    puts 'correct'
    score += 1
  end
  puts "Your current score is #{score} \n press ENTER to play the next round"
  gets
end


puts "you finished with a score of #{score}"





##stages a song to be played on the users account by the song id. The second parameter is the start time this will stage the song to be at 30.31 seconds in
#user.stage_song('4iV5W9uYEdYUVa79Axb7Rh', 30.31)
#
##start playback of a song
#user.play
#
##pause playback of a song
#user.pause
#
#puts user.account.username
#
#puts RSpotify::Artist.search('Arctic Monkeys').first.name
#
#include HelpBox
#print HelpBox.printHelpBox
#
#
#
#
#
