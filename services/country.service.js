// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var country = require('../models/country.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;


module.exports.countryList = () => {
    return new Promise((resolve, reject) => {
        country.aggregate([
            {
                $project: {
                    countryId: '$_id',
                    name: '$name',
                    isoCode2: '$iso_code_2',
                    isoCode3: '$iso_code_3',
                    addressFormat: '$address_format',
                    postcodeRequired: '$postcode_required',
                    status: '$is_active'
                }
            }
        ]).exec(function (error, productDetail) {
            if (error) {
                return reject(error);
            } else {
                return resolve({ status: 200, message: 'Successfully got country list', data: productDetail });
            }
        })
    })
}


module.exports.addCountry = (body) => {
    console.log("body in country===>", body);
    return new Promise((resolve, reject) => {
        country.create(body, (countryError, countryResponse) => {
            if (countryError) {
                console.log('countryError: ', countryError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'New country is created successfully', data: countryResponse });
            }
        });
    })
}

module.exports.deleteCountry = (countryid) => {
    console.log("body in country===>", countryid);
    return new Promise((resolve, reject) => {
        country.findOneAndRemove({ _id: countryid }, (countryError, deletedCountry) => {
            if (countryError) {
                console.log('countryError: ', countryError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted country.', data: deletedCountry });
            }
        });
    })
}

module.exports.updateCountry = (countryid, countryData) => {
    console.log("body in country===>", countryid);
    console.log("country Data in service=====>", countryData);
    return new Promise((resolve, reject) => {
        country.findOneAndUpdate({ _id: countryid }, countryData, { upsert: true }, (countryError, updatedCountry) => {
            if (countryError) {
                console.log('countryError: ', countryError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated country.', data: updatedCountry });
            }
        });
    })
}



