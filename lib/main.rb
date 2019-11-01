require_relative 'game'
puts "Authorizing with Spotify..."

game = Game.new
puts "🚀  Awesome, you're authenticated! ✅"
sleep(1)

system "clear" 

<<<<<<< HEAD
puts "\n\nWelcome #{game.player.account['display_name']} to SCHPOTIFY📻 the best song guessing game in the Shopify office 🏢"
while true
  @score = 0

  playlist = game.select_playlist
  highscores = game.playlist_highscore(playlist.id)
  player_highscore = game.player_highscore(playlist.id)
  unless highscores == []
    puts "\n\n#{playlist.name.upcase} HIGHSCORES:"
    highscores.each_with_index {|score_object, idx| puts "\t #{idx + 1}. #{score_object['score']} - #{score_object['username']}"}
  end

  puts "\tYour highscore is: #{player_highscore['score']}" unless player_highscore == nil 

  4.times do |round_num| 
    song_list = game.create_song_list(playlist)
    result = game.play_with_song_list(song_list)
    unless result === 0
      puts "Correct! ✅ You get #{result} points! 🏆"
      @score += result
    end
    puts "Your current score is #{@score} 💥"
    unless round_num === 3
      puts "Next round?" 
      gets
    end
  end

  puts "Great game! You played 4 rounds and finished with a score of #{@score}! 🥳 🎉"
  game.new_score(@score, playlist.id)
  puts "do you want to play again?"
  unless (gets.chomp.upcase == 'YES')
    break
  end
end

=======
printWelcomeBox()
playlist = game.select_playlist
highscores = game.playlist_highscore(playlist.id)
player_highscore = game.player_highscore(playlist.id)
unless highscores == []
  puts "\n\n#{playlist.name.upcase} HIGHSCORES:"
  highscores.each_with_index {|score_object, idx| puts "\t #{idx + 1}. #{score_object['score']} - #{score_object['username']}"}
end

puts "Your highscore is: #{player_highscore['score']}" unless player_highscore == nil 

4.times do 
  song_list = game.create_song_list(playlist)
  @result = game.play_with_song_list(song_list)
  unless @result === 0
    puts "Correct! ✅ You get #{@result} points! 🏆"
    @score += @result
  end
  puts "Your current score is #{@score} 💥 \nNext round?"
  gets
end

puts "Great game! You played 4 rounds and finished with a score of #{score}! 🥳 🎉"
game.new_score(@score, @playlist.id)
>>>>>>> f46e3535839a295f65e8212cffb79fdf179f9aa6
