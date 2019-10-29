require 'minitest/autorun'
require_relative '../lib/auth'

class TestWeapons < Minitest::Test
  @@user = SpotifyAccount.new
  def test_user_instatiation_and_oauth_flow
    refute_nil(@@user.user_token, "instances of user don't seem to have a token associated with their account. Something is wrong with oauth token flow")
  end

  def test_user_play_ability
    @@user.play
    expected = true
    actual = @@user.player_information['is_playing'] === true 
    assert_equal(actual, expected, 'play function is not changing spotify webplayer state')
  end
  def test_user_pause_ability
    @@user.pause
    expected = true
    actual = @@user.player_information['is_playing'] === false
    assert_equal(actual, expected, 'pause function is not changing spotify webplayer state')
  end
  def test_stage_song
    @@user.stage_song('4iV5W9uYEdYUVa79Axb7Rh')
    expected = true
    actual = @@user.player_information['item']['name'] === "Prelude for Piano No. 11 in F-Sharp Minor"
    assert_equal(expected, actual, 'Songs are not currently being staged correctly. Song Id does not matched hardcoded spotify song name (could be internal spotify problem)')
  end
end
