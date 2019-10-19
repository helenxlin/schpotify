require 'io/console'
require 'rspotify'
require 'httparty'
require 'launchy'

CLIENT_ID="c8f6f96e5c804f51bcc45f9786612a5c"
CLIENT_SECRET="a793c119ddb54663a98b67b892cdf716"
USER_NUMBER = rand(999999999).to_s
REDIRECT_URI = 'http://localhost:4815/callback'
SCOPE = 'playlist-modify-private'
puts USER_NUMBER


URL = 'https://accounts.spotify.com/authorize' + '?client_id=' + CLIENT_ID + '&response_type=token' + '&scope=' + SCOPE + '&state=' + USER_NUMBER + '&redirect_uri=' + REDIRECT_URI 


pause = 'https://api.spotify.com/v1/me/player/pause'
play = 'https://api.spotify.com/v1/me/player/play'


Launchy.open URL


user_token = HTTParty.get('http://localhost:4815/get_token/' + USER_NUMBER)
puts user_token
headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{user_token}"}

response = HTTParty.put(pause, :headers => headers)

puts response.body


RSpotify.authenticate(CLIENT_ID, CLIENT_SECRET)
artist = RSpotify::Artist.search('Arctic Monkeys').first.name
puts artist
