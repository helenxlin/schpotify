# Schpotify 

A little game for the CLI to guess songs


### User authorization

In order to use any of the user specific functions for spotify users must be instantiated
```ruby
user = SpotifyAccount.new
```

at this point a multitude of functions can be used on the user such as 
- `user.pause` pauses the current song
- `user.play` plays the current song
- `user.account` an object with account info for the spotify user _display name, email, etc_
- `user.player_information` returns information about the current spotify player _isplaying, songname_
- `user.test_valid_spotify(mode)` tests the status of the current spotify player, if the `"silent"` is passed as a parameter the function will run without outputing anything to the terminal if everything is working properly. This function should be used frequently to check that the users spotify player is stil working
### Testing

In order to write tests, add a test file to the tests folder. To run all tests type `rake` into the base directory of the project.

[Spotify Static Interactions Library Docs](https://github.com/guilhermesad/rspotify)
