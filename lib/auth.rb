require 'launchy'
require 'json'
require 'httparty'

CLIENT_ID="c8f6f96e5c804f51bcc45f9786612a5c"
CLIENT_SECRET="a793c119ddb54663a98b67b892cdf716"
BASE_URL='http://159.203.178.244'

class SpotifyAccount
  attr_reader :USER_NUMBER, :user_token
  @headers
  USER_NUMBER = rand(999999999).to_s
  REDIRECT_URI = BASE_URL + '/callback'
  SCOPE = 'user-modify-playback-state user-read-currently-playing user-read-playback-state user-read-email streaming user-library-read user-top-read playlist-modify-private'
  OAUTH_URL = 'https://accounts.spotify.com/authorize' + '?client_id=' + CLIENT_ID + '&response_type=token' + '&scope=' + SCOPE + '&state=' + USER_NUMBER + '&redirect_uri=' + REDIRECT_URI 

  def initialize 
    Launchy.open OAUTH_URL
    begin 
      @user_token = HTTParty.get(BASE_URL+'/get_token/' + USER_NUMBER)
    rescue StandardError
      raise(" It seems as though the development server is down \u{1F623} Contact Cam to turn on the development server to make it work again")
    end
    @headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json', 'Authorization' => "Bearer #{@user_token}"}
  end

  def get_devices
    url='https://api.spotify.com/v1/me/player/devices'
    HTTParty.get(url, :headers => @headers)
  end

  def stage_song(id, position_seconds=0)
    raise("position_seconds must be an number") unless position_seconds.is_a?(Numeric)
    position_ms = position_seconds*1000.round()
    url = 'https://api.spotify.com/v1/me/player/play'
    body = {:uris => ['spotify:track:' + id], :position_ms => position_ms}.to_json
    HTTParty.put(url, :headers => @headers, :body => body)
  end

  def play
    url = 'https://api.spotify.com/v1/me/player/play'
    HTTParty.put(url, :headers => @headers)
  end

  def pause
    url = 'https://api.spotify.com/v1/me/player/pause'
    HTTParty.put(url, :headers => @headers)
  end

  def test_valid_spotify(mode ='silent')
    while (JSON.parse(self.get_devices.body)['devices'] === [])
      puts "Uh Oh, it seems like you don't have any devices open \u{1F635} Open up spotify and test playing a song to start, (press enter when ready)"
      mode = 'loud'
      gets
    end
    while (JSON.parse(self.get_devices.body)['devices'].select {|device| device["is_active"] == true} === [])
      puts "Uh Oh, it seems like you don't have any active devices \u{1F3A7} Open up spotify and test playing a song to start, (press enter when ready)"
      gets
    end
    self.pause
    puts "\u{1f60e} You are good to go! \u{1f60e}\nTo play fair, minimzie your spotify client so you don't cheat!\u{1F64F}" unless mode === 'silent'
  end
end
