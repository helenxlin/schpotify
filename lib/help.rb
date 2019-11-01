require 'rspotify'
require 'tty-box'
require 'tty-screen'

module HelpBox

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

end 