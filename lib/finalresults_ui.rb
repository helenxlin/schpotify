require 'rspotify'
require 'tty-box'
require 'tty-screen'

module FinalResults

  def printFinalResults(score)
    :green #1DB954
    :black #000000

    finalResults = TTY::Box.frame(align: :left, width: TTY::Screen.width - 5, height: 10, title: {top_left: ' 👑 Final Results  '}, border: :thick, padding: 1, style: {
        fg: :green,
        border: {
          fg: :black,
          bg: :green
        }
      }) do
        "Great Game! You scored #{score} points.
        \nLEADERBOARD:             TOTAL SCORES:              GAMES:            ROUNDS:
        \n-----------------------------------------------------------------------------
        \n" 
      end
    puts finalResults
  end
end 
