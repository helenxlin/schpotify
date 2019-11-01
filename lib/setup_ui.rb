require 'rspotify'
require 'tty-box'
require 'tty-screen'

module SetupBox

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
end 
