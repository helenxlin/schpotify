require 'json'
require 'httparty'

module Highscores
  BASE_URL='http://159.203.178.244'

  def new_score(score, playlist_id)
    headers = {'Content-Type' => 'application/x-www-form-urlencoded'}
    body = { 'score' => score, 'playlist' => playlist_id, 'username' => player.account['id']}
    result = HTTParty.post(BASE_URL + '/new_score', :headers => @headers, :body => body)
  end

  def player_highscore(playlist_id)
    headers = {'Content-Type' => 'application/x-www-form-urlencoded'}
    body = { 'playlist' => playlist_id, 'username' => player.account['id']}
    begin
      result = JSON.parse(HTTParty.get(BASE_URL + '/user_highscore', :headers => @headers, :body => body).response.body)
      result
    rescue
      nil
    end
  end

  def playlist_highscore(playlist_id)
    headers = {'Content-Type' => 'application/x-www-form-urlencoded'}
    body = { 'playlist' => playlist_id}
    begin
      result = JSON.parse(HTTParty.get(BASE_URL + '/playlist_highscore', :headers => @headers, :body => body).response.body)
      result 
    rescue
      nil
    end
  end
end
