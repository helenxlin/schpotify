require 'rspotify'
require 'tty-box'
require 'tty-screen'

module WelcomeBox

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

end 