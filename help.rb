require 'rspotify'
require 'tty-box'
require 'tty-screen'

:green #1DB954
:black #000000

box2 = TTY::Box.frame(align: :center, width: TTY::Screen.width - 5, height: 11, title: {top_left: '   HELP   '}, border: :thick, padding: 1, style: {
    fg: :green,
    border: {
      fg: :black,
      bg: :green
    }
  }) do 
    "SCHPOTIFY INSTRUCTIONS\nObjective: Guess the song that is playing from a random selection of four song names.\n1. Choose a playlist you would like to guess from.\n2. The command line will play a song.\n3. Press Space to pause the song at any moment.\n4. Guess the song name from the four choices."
end

print box2
