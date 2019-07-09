// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var language = require('../models/language.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.languageList = () => {
    return new Promise((resolve, reject) => {
        language.aggregate([
            {
                $project: {
                    languageId:'$_id',
                    code:'$code',
                    image:'$image',
                    imagePath:'$image_path',
                    isActive: 1,
                    name:'$name',
                    sortOrder:'$sort_order'
                }
            },
        ]).exec(function (languageError, languageList) {
            if (languageError) {
                return reject(languageError);
            } else {
                return resolve({ status: 200, message: 'Successfully get settings', data: languageList });
            }
        })

    })
}


module.exports.addLanguage = (languageData) => {

    return new Promise((resolve, reject) => {
        language.create(languageData, (languageError, languageResponse) => {
            if (languageError) {
                console.log('languageError: ', languageError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new Language.', data: languageResponse });
            }
        });
    })
}


module.exports.deleteLanguage = (languageId) => {

    console.log("body in country===>", languageId);
    return new Promise((resolve, reject) => {
        language.findByIdAndRemove({ _id: languageId }, (languageError, deletedLanguage) => {
            if (languageError) {
                console.log('languageError: ', languageError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted Language.', data: deletedLanguage });
            }
        });
    })
}


module.exports.updateLanguage = (languageId, languageData) => {

    console.log("Stock data",languageData);

    console.log("Stock Id",languageId);

    return new Promise((resolve, reject) => {
        language.findByIdAndUpdate({ _id: languageId }, languageData, { upsert: true }, (languageError, updatedLanguage) => {
            if (languageError) {
                console.log('languageError: ', languageError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Language.', data: updatedLanguage });
            }
        });
    })
}







