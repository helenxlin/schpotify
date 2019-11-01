require 'rspotify'
require 'tty-box'
require 'tty-screen'
require "tty-prompt"
require 'tty-progressbar'

module UI

    def printHelpBox()
        :green #1DB954
        :black #000000
    
        helpBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 8, title: {top_left: '   HELP   '}, border: :thick, padding: 1, style: {
            fg: :green,
            border: {
              fg: :black,
              bg: :green
            }
        }) do 
            "SCHPOTIFY INSTRUCTIONS\nObjective: Guess the song!\n1. Search for any playlist that is on Spotify.\n2. A random song from that playlist will start playing.\n3. The timer starts now! Using the four options given, guess the song!"
        end
        
        print helpBox

    end

    def searchingBox()
      value = @prompt.select('Search through...') do |menu|
        menu.choice '(U+2B21) Your own playlists', 1
        menu.choice '/u2B21} Genre or name of any public playlists', 2
        menu.choice '/u{2B21} Top Trending songs playlists', 3
      end
      puts value

      if (value === 1)
        return user_playlist
      elsif (value === 2)
        print "search query: "
        input = gets.chomp
        return search_playlist(input)
      elsif (value === 3)
        return featured_playlists
      end
    end 


    def playlistBox(options)
      @prompt.select("\nSelect a playlist to play the game with\nWhich one?", options)
    end 


    def guessBox(options)
        @prompt.select("My guess is...", options) 
    end

    def printNowPlayingBox()
        :green #1DB954
        :black #000000
        nowPlayingBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 11, title: {top_left: '   :cd:Now Playing...  ', }, border: :thick, padding: 1, style: {
            fg: :green,
            border: {
              fg: :black,
              bg: :green
            }
          }) do
            "\nPause when you think you know the name.\nThe faster you guess, the higher your points!\n1st Minute:  "
            bar = TTY::ProgressBar.new("downloading [:bar]", total: 30)
            30.times do
                sleep(1)
                bar.advance(1)
            end
        end
        
      end
end 