require 'rspotify'
require 'tty-box'
require 'tty-screen'

module PlaylistBox

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
end 
