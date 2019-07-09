var path = require('path');

var mongoose = require('mongoose');

// var config = {
// 	url: '127.0.0.1',
// 	port: '27017',
// 	name: 'spurtcommerce'
// }

// let options = {
// 	socketTimeoutMS: 30000,
// 	keepAlive: true,
// 	reconnectTries: 30,
// 	autoIndex: false, // Don't build indexes
// 	reconnectInterval: 500, // Reconnect every 500ms
// 	poolSize: 10, // Maintain up to 10 socket connections
// 	// If not connected, return errors immediately rather than waiting for reconnect
// 	bufferMaxEntries: 0,
// 	useNewUrlParser: true
// }

// Main application models
require(path.join(__dirname, '..', 'models', 'customer.model'));
require(path.join(__dirname, '..', 'models', 'banner.model'));
require(path.join(__dirname, '..', 'models', 'country.model'));
require(path.join(__dirname, '..', 'models', 'category.model'));


// console.log(config);
// const connectionString = "mongodb://prismanote:prismanote@127.0.0.1:27017/prismanote";
// const connectionString = "mongodb://user:user123@localhost:27017/test1";
// console.log(`mongodb://prismanote:prismanote@${config.url}:${config.port}/${config.name}`, options);
// mongoose.connect('mongodb://' + config.url + ':' + config.port + '/' + config.name, options);
// // mongoose.connect(`mongodb://prismanote:prismanote@localhost:${config.port}/${config.name}`, options);
// // mongoose.createConnection(connectionString);

// mongoose.connection.on('connected', function () {
// 	console.log('Mongoose connected to database [' + config.name + '] on ' + config.url + ":" + config.port + ".");
// });

// mongoose.connection.on('disconnected', function () {
// 	console.log('Mongoose disconnected from database [' + config.name + '] on ' + config.url + ":" + config.port + ".");
// });

// mongoose.connection.on('error', function (err) {
// 	// console.log('Mongoose error on connection ' + config.url + ":" + config.port + " [" + config.name + "]. " + err);
// 	console.log("Connection error: " + err);
// });

module.exports = config;