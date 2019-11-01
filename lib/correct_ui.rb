require 'rspotify'
require 'tty-box'
require 'tty-screen'

module CorrectBox
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
end 
