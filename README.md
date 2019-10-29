#Schpotify 

A little game for the CLI to guess songs


### User authorization

In order to use any of the user specific functions for spotify users must be instantiated
```ruby
user = SpotifyAccount.new
```

at this point a multitude of functions can be used on the user such as 
- `user.pause`
- `user.play`
- `user.account_info`

### Testing

in order to write tests, add a test file to the tests folder. To run all tests type `rake` into the base directory of the project.
https://github.com/guilhermesad/rspotify
