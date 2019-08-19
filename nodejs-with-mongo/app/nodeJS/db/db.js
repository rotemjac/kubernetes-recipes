var mongoose = require('mongoose');
var config      = require('./config.js');
var credentials = require('./models/credentials.js');

//Connect to our database
var dbConnection = mongoose.connect(
    config.url, { useNewUrlParser: true }
);


module.exports.saveCredentials = (application, req, res) => {
    application.Credentials();
};