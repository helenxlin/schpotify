require 'rspotify'
require_relative 'auth'
require_relative 'help'

class Game
  attr_reader :player 
  def initialize
    RSpotify.authenticate(CLIENT_ID, CLIENT_SECRET)
    @player = SpotifyAccount.new()
  end

  def featured_playlists
     RSpotify::Playlist.browse_featured(country: 'US')
  end
  def user_playlist(userid=player.account['id'])
     RSpotify::User.find(userid).playlists
  end

  def select_playlist_list
    puts "would you like to play with \n 1. a profile playlist \n 2. popular playlists"
    input = gets.chomp.to_i
    if (input === 1)
      return user_playlist
    else (input === 2)
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
      while (random_numbers.include?(randNum) || @played_songs.include?(randNum))
        randNum = rand(0..playlist.tracks.length - 1)
      end
      random_numbers.push(randNum)
      songs.push(playlist.tracks[randNum])
    }
    @correctSongIndex = rand(4)
    @played_songs << @correctSongIndex
    songs
  end

  #prints out a of the songs, their index, and their artist name
  def print_song_list(song_list)
    song_list.each_with_index {|s, idx| puts "\t #{idx + 1}. #{s.name} - #{s.artists.reduce("") {|accumulator, artist| accumulator + artist.name + "  "}}"}
  end
  # the user guesses the song, returns true or false if they got it correct on not
  def play_with_song_list(song_list)
    player.test_valid_spotify('silent')
    player.stage_song(song_list[@correctSongIndex].id)

    player.play

    puts "Press enter when you are ready to guess"
    gets

    player.pause
    print_song_list(song_list)

    print "The song was: "

    guess_index = gets.chomp.to_i - 1

    if (guess_index === @correctSongIndex)
      return true
    else
      puts song_list[@correctSongIndex].name + " is the correct song"
      return false
    end
  end
end
