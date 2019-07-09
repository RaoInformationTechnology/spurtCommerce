// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var currency = require('../models/currency.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.currencyList = () => {
    return new Promise((resolve, reject) => {


        currency.aggregate([
            {
                $project: {
                    currencyId: '$_id',
                    name: '$name',
                    isActive: '$is_active',
                    symbolLeft: '$symbol_left',
                    symbolRight: '$symbol_right',
                    code: '$code',
                    value: '$value',
                    modifiedDate: '$modified_date',
                    title: '$title',
                }
            },
        ]).exec(function (Error, Response) {
            if (Error) {
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully get currency list', data: Response });
            }
        })

    })
}

module.exports.addCurrency = (currencyData) => {
    console.log("currencyData in country===>", currencyData);
    return new Promise((resolve, reject) => {
        currency.create(currencyData, (currencyError, currencyResponse) => {
            if (currencyError) {
                console.log('currencyError: ', currencyError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new Currency.', data: currencyResponse });
            }
        });
    })
}

module.exports.deleteCurrency = (currencyId) => {
    console.log("body in country===>", currencyId);
    return new Promise((resolve, reject) => {
        currency.findOneAndRemove({ _id: currencyId }, (currencyError, deletedCurrency) => {
            if (currencyError) {
                console.log('currencyError: ', currencyError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted country.', data: deletedCurrency });
            }
        });
    })
}

module.exports.updateCurrency = (currencyId, countryData) => {
    console.log("body in country===>", currencyId);
    console.log("country Data in service=====>", countryData);
    return new Promise((resolve, reject) => {
        currency.findOneAndUpdate({ _id: currencyId }, countryData, { upsert: true }, (currencyError, updatedCurrency) => {
            if (currencyError) {
                console.log('currencyError: ', currencyError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Currency', data: updatedCurrency });
            }
        });
    })
}



