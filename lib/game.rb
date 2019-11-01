require 'rspotify'
require 'stop_watch'
require_relative 'auth'
require_relative 'help'
require_relative 'nowplaying-ui'
require_relative 'welcome_ui.rb'
require './highscores'
require_relative 'spotify_not_open_ui'
require_relative 'setup_ui'
require_relative 'playlist_ui'
require_relative 'correct_ui'
require_relative 'incorrect_ui'

class Game
  attr_reader :player 

  include HelpBox
  include Highscores
  include UI
  include WelcomeBox
  include SpotifyNotOpenBox
  include SetupBox
  include PlaylistBox
  include CorrectBox
  include IncorrectBox

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

  def select_playlist_list
    puts "Would you like to play with \n 1. a profile playlist \n 2. search playlists \n 3. popular playlists"
    input = gets.chomp.to_i
    if (input === 1)
      return user_playlist
    elsif (input === 2)
      print "search query: "
      input = gets.chomp
      return search_playlist(input)
    elsif (input === 3)
      return featured_playlists
    end
  end

  #raise "Please create a playlist. You must have at least one \n" if (playlist_list.empty?)
  def playlist_difficulty(song_number)
    return ((-5000/(song_number + 50)) + 100).round
  end

  def select_playlist
    playlist_list = select_playlist_list
    puts "Select a playlist to play the game with\n"
    playlist_list.select! {|p| p.tracks.length() > 12}
    playlist_list.each_with_index {|p,idx| puts "\t#{idx + 1}. - #{p.name} (Difficulty: #{playlist_difficulty(p.tracks.length())})"}

    print 'Playlist num: ' 
    playlist = playlist_list[gets.chomp.to_i - 1]
    @played_songs = []

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
    @points = (1108.8 * (2.71 ** (-0.103 * seconds))).ceil 
    return @points
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

    print "\nThe song was: "

    guess_index = gets.chomp.to_i - 1
    @seconds = watch.mark[0].round(2)
    puts "\n#{@seconds} seconds"
    if (guess_index === @correctSongIndex)
      return calculate_points(@seconds)

    else
      puts "Incorrect. " + song_list[@correctSongIndex].name + " is the correct song"
      return 0
    end
  end
end
