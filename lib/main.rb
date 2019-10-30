require_relative 'game'

game = Game.new

score = 0;
playlist = game.select_playlist

4.times do 
  song_list = game.create_song_list(playlist)
  result = game.play_with_song_list(song_list)
  unless result === 0
    puts 'correct'
    puts "You gained #{result} points"
    score += result
  end
  puts "Your current score is #{score} \n press ENTER to play the next round"
  gets
end


puts "you finished with a score of #{score}"
