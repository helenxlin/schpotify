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
    "SCHPOTIFY INSTRUCTIONS\nObjective: Guess the song!\n1. Search for any playlist that is on Spotify.\n2. A random song from that playlist will start playing.\n3. 
    The timer starts now! Using the four options given, guess the song!"
end

print box2
