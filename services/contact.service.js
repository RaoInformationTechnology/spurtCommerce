// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var contact = require('../models/contact.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.addResponse = (body)=> {
	console.log("body in contact===>",body);
    return new Promise((resolve, reject) => {
        contact.create(body, (responseError, response) => {
            if (responseError) {
                console.log('usererror: ', responseError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Your mail send to admin..!', data: response });
            }
        });
    })
}
