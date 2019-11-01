require 'tty-progressbar'
require 'rspotify'
require 'tty-box'

module UI
    def printNowPlayingBox()
          puts "\nPause when you think you know the name.\nThe faster you guess, the higher your points!\nRemember you can use any of the command prompts. Hit H to see them! "
          bar = TTY::ProgressBar.new("Song time elapsed [:bar]", total: 30)
          30.times do
            sleep(1)
            bar.advance(1)
          end
    end
  end


