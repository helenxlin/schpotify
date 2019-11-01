const mongoose = require('mongoose');
const Score = require("./score");

//connect to mongodb database
const DB_URL = 'mongodb://localhost:27017/schpotify';
mongoose.connect(
  DB_URL,
  { useNewUrlParser: true, keepAlive: true},
  () => console.log ('Connected to the database')
);


//Bind connection to error event (to get notification of connection errors)
mongoose.connection.on('error', console.error.bind(console, 'MongoDB connection error:'));
module.exports.score = Score
