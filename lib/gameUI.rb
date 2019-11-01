require 'rspotify'
require 'tty-box'
require 'tty-screen'
require "tty-prompt"
require 'tty-progressbar'

module UI

    def searchingBox()
      value = @prompt.select("🔍  Search through... \n") do |menu|
        menu.choice "\u{2B21} Your own playlists 🙋‍♀️", 1
        menu.choice "\u{2B21} Genre or name of any public playlists 👨‍👩‍👧‍👦", 2
        menu.choice "\u{2B21} Top trending songs playlists 🔥", 3
      end

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
        @prompt.select("", options) 
    end

    def printHelpBox()
      :green #1DB954
      :black #000000

      helpBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 11, title: {top_left: '  🔎 HELP   '}, border: :thick, padding: 1, style: {
          fg: :green,
          border: {
            fg: :black,
            bg: :green
          }
        }) do 
          "SPACE - pause the song to guess\nR - rewind 5 seconds\nF - fast forward 5 seconds\nENTER - go through the game\nS - Shuffle the playlist\nESC - quit the game\n\nHit Enter to start!"
      end
      puts helpBox
    end
    
    def printNowPlayingBox()
      bar = TTY::ProgressBar.new("Song time elapsed [:bar]", total: 30)
      30.times do
        sleep(1)
        bar.advance(1)
      end
    end 

    def printCorrectBox(result, score)
      :green #1DB954
      :black #000000
  
          correctBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 5, title: {top_left: ' 🤨 That is... '}, border: :thick, padding: 1, style: {
              fg: :green,
              border: {
              fg: :black,
              bg: :green
              }
          }) do
              "Correct! You get #{result} points! 🏆\nPoints so far: #{score}" 
          end
          puts correctBox
      end

      def printWelcomeBox()
        :green #1DB954
        :black #000000
    
        welcomeBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 13, title: {top_left: ' 👋WELCOME👋 '}, border: :thick, padding: 1, style: {
            fg: :green,
            border: {
              fg: :black,
              bg: :green
            }
          }) do
            "SCHPOTIFY INSTRUCTIONS\nObjective: Guess the song!\n1. Make sure Spotify is open on your device.\n2. You can choose which playlist that the program will retrieve songs from.\n3. A random song from that playlist will start playing.\n4. The timer starts when the song starts playing! Using the four options given, guess the song!
            \nIf you need help along the way, hit the H key.
            \nOtherwise, hit ENTER to move through the game."
          end
        puts welcomeBox
      end

      def printSpotifyNotOpenBox()
        :green #1DB954
        :black #000000
    
        spotifyNotOpenBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 5, title: {top_left: ' Quick Note: '}, border: :thick, padding: 1, style: {
            fg: :green,
            border: {
              fg: :black,
              bg: :green
            }
          }) do
            "Uh oh! Your Spotify isn't open. Open that bad boy up and play any song to start." 
          end
        puts spotifyNotOpenBox
      end

      def printSetupBox()
        :green #1DB954
        :black #000000
    
        setupBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 5, title: {top_left: ' ⚙️ Setup '}, border: :thick, padding: 1, style: {
            fg: :green,
            border: {
              fg: :black,
              bg: :green
            }
          }) do
            "First, we'll need to set up Schpotify by connecting your Spotify account. You are now being redirected to a login on the web..." 
          end
        puts setupBox
      end

      def printPlaylistBox()
        :green #1DB954
        :black #000000
    
        playlistBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 5, title: {top_left: ' 💿 Playlist:  '}, border: :thick, padding: 1, style: {
            fg: :green,
            border: {
              fg: :black,
              bg: :green
            }
          }) do
            "🔎 ... searching for all results with that name!"
          end
        puts playlistBox
      end

      def printIncorrectBox(score)
        :green #1DB954
        :black #000000
    
            incorrectBox = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 5, title: {top_left: ' 🤨 That is... '}, border: :thick, padding: 1, style: {
                fg: :green,
                border: {
                fg: :black,
                bg: :green
                }
            }) do
                "Incorrect! \nPoints so far: #{score}" 
            end
            puts incorrectBox
        end
end 