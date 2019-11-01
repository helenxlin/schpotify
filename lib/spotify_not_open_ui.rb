require 'rspotify'
require 'tty-box'
require 'tty-screen'

module SpotifyNotOpenBox

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
end 

