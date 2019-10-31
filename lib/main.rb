require_relative 'game'


game = Game.new

score = 0
game.printNowPlayingBox()

playlist = game.select_playlist
highscores = game.playlist_highscore(playlist.id)
player_highscore = game.player_highscore(playlist.id)
unless highscores == []
  puts "#{playlist.name.upcase} HIGHSCORES:"
  highscores.each_with_index {|score_object, idx| puts "\t #{idx + 1}. #{score_object['score']} - #{score_object['username']}"}
end

puts "\tyour highscore is: #{player_highscore['score']}" unless player_highscore == nil 

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
game.new_score(score, playlist.id)
