var express = require('express')
const axios = require('axios').default;
var app = express()
var SpotifyWebApi = require('spotify-web-api-node');

// credentials are optional
const port = 3000
app.listen(port, () => console.log(`listening on port ${port}`))
clientId = 'fcecfc72172e4cd267473117a17cbd4d'
clientSecret = 'a6338157c9bb5ac9c71924cb2940e1a7'
redirectUri = '/success'
// respond with "hello world" when a GET request is made to the homepage
app.get('/', async (req, res) => {
  var spotifyApi = await new SpotifyWebApi({
  });
  console.log(spotifyApi)
  res.send("good")
})

app.get('/success', async (req, res) => {
  console.log('success')
  res.send('good')
})
app.get('/auth', function (req, res) {
  res.send('hello world')
})
