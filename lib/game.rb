require 'rspotify'
require 'stop_watch'
require_relative 'auth'
require_relative 'help'
require './highscores'

class Game
  attr_reader :player 

  include Highscores 

  def initialize
    RSpotify.authenticate(CLIENT_ID, CLIENT_SECRET)
    @player = SpotifyAccount.new()
  end

  def featured_playlists
     RSpotify::Playlist.browse_featured(country: 'US')
  end
  def search_playlist(query)
     RSpotify::Playlist.search(query)
  end
  def user_playlist(userid=player.account['id'])
     RSpotify::User.find(userid).playlists
  end

  def is_integer_between_bounds?(input, upperBound)
    !!Integer(input) && ((input.to_i >= 1) && (input.to_i <= upperBound))
    rescue then false
  end

  def select_playlist_list
    incorrectInput = true

    puts "would you like to play with \n 1. a profile playlist \n 2. search playlists \n 3. popular playlists"
    userInput = gets.chomp

    while(incorrectInput) do
      if (is_integer_between_bounds?(userInput, 3))
        if (userInput.to_i === 1)
          return user_playlist
        elsif (userInput.to_i === 2)
          print "search query: "
          input = gets.chomp
          return search_playlist(input)
        elsif (userInput.to_i === 3)
          return featured_playlists
        end
      else
        puts "would you like to play with \n 1. a profile playlist \n 2. search playlists \n 3. popular playlists"
        userInput = gets.chomp
      end
    end
  end

  #raise "Please create a playlist. You must have at least one \n" if (playlist_list.empty?)
  def playlist_difficulty(song_number)
    return ((-5000/(song_number + 50)) + 100).round
  end

  def select_playlist
    playlist_list = select_playlist_list
    playlist_list.select! {|p| p.tracks.length() > 15}

    while (playlist_list.length() == 0) 
      puts "Sorry. There are no matches for what you searched up."
      playlist_list = select_playlist_list()
      playlist_list.select! {|p| p.tracks.length() > 15}
    end

    puts "Select a playlist to play the game with\n"
    playlist_list.each_with_index {|p,idx| puts "\t#{idx + 1}. - #{p.name} (Difficulty: #{playlist_difficulty(p.tracks.length())})"}

    invalidInput = true
    print 'Enter the playlist number: ' 
    userNum = gets.chomp

    while (invalidInput) do
      if (is_integer_between_bounds?(userNum, playlist_list.length))
        playlist = playlist_list[userNum.to_i - 1]
        @played_songs = []
        invalidInput = false
      else
        print 'Enter the playlist number: ' 
        userNum = gets.chomp
      end
    end

    return playlist
    
  end

  # creates a lis of 4 songs to choose from, chooses one of them to be the correct song
  def create_song_list(playlist)
    songs = []
    random_numbers =[]
    4.times {
      randNum = rand(0..playlist.tracks.length - 1)
      while (random_numbers.include?(randNum) || @played_songs.include?(playlist.tracks[randNum]))
        randNum = rand(0..playlist.tracks.length - 1)

        while (random_numbers.include? randNum) do
          randNum = rand(0..playlist.tracks.length - 1)
        end
        
      end
      random_numbers.push(randNum)
      songs.push(playlist.tracks[randNum])
    }
    @correctSongIndex = rand(4)
    @played_songs << songs[@correctSongIndex]
    songs
  end

  #prints out a of the songs, their index, and their artist name
  def print_song_list(song_list)
    song_list.each_with_index {|s, idx| puts "\t #{idx + 1}. #{s.name} - #{s.artists.reduce("") {|accumulator, artist| accumulator + artist.name + "  "}}"}
  end
  
  def calculate_points(seconds)
    points = (1108.8 * (2.71 ** (-0.103 * seconds))).ceil 
    return points
  end 

  # the user guesses the song, returns true or false if they got it correct on not
  def play_with_song_list(song_list)
    player.test_valid_spotify('silent')
    player.stage_song(song_list[@correctSongIndex].id)

    player.play
    watch = StopWatch::Timer.new
    watch.mark

    puts "Press enter when you are ready to guess"
    gets

    player.pause
    print_song_list(song_list)

    # User Validation
    incorrectInput = true
    print "The song was: "
    userInput = gets.chomp

    while (incorrectInput) do
     if(is_integer_between_bounds?(userInput, 4))
        incorrectInput = false
     else
        print "The song was: "
        userInput = gets.chomp
     end
    end
    

    guess_index = userInput.to_i - 1
    seconds = watch.mark[0].round(2)
    puts "\n#{seconds} seconds"
    if (guess_index === @correctSongIndex)
      return calculate_points(seconds)

    else
      puts song_list[@correctSongIndex].name + " is the correct song"
      return 0
    end
  end
end
