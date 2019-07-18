// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var stockStatus = require('../models/stock-status.model');
// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.stockList = () => {
    return new Promise((resolve, reject) => {

        stockStatus.aggregate([
            {
                $project: {
                    stockStatusId: '$_id',
                    name: '$name',
                    isActive: '$is_active',

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

module.exports.updateStockStatus = (stockId, stockData) => {

    console.log("Stock data",stockData);

    console.log("Stock Id",stockId);

    return new Promise((resolve, reject) => {
        stockStatus.findByIdAndUpdate({ _id: stockId }, stockData, { upsert: true }, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Stock Status', data: userres });
            }
        });
    })
}


module.exports.addStockStatus = (stockData) => {

    return new Promise((resolve, reject) => {
        stockStatus.create(stockData, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new Stock Status.', data: userres });
            }
        });
    })
}

module.exports.deleteStockStatus = (stockId) => {
    console.log("body in country===>", stockId);
    return new Promise((resolve, reject) => {
        stockStatus.findByIdAndRemove({ _id: stockId }, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted Stock Status.', data: userres });
            }
        });
    })
}
