require 'rspotify'

RSpotify.authenticate("c8f6f96e5c804f51bcc45f9786612a5c", "a793c119ddb54663a98b67b892cdf716")
artists = RSpotify::Artist.search('Arctic Monkeys').first.name

puts artists

puts 'Enter the name of the playlist you would like to run through: '
userPlaylist = gets.chomp

playlist = RSpotify::Playlist.search(userPlaylist)
puts playlist

