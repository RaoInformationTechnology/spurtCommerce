// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');


// Database models
var settings = require('../models/settings.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.settingsList = () => {
    return new Promise((resolve, reject) => {
        settings.aggregate([
            {
                $project: {
                    settingsId:'$_id',
                    facebook: '$facebook',
                    google: '$google',
                    twitter: '$twitter',
                    instagram: '$instagram',
                    storeEmail: '$store_email',
                    isActive: 1,
                    storeAddress: '$store_address',
                    orderStatus: '$order_status',
                    storeLanguageName: '$store_language_name',
                    storeLogo: '$store_logo',
                    storeLogoPath: '$store_logo_path',
                    storeName: '$store_name',
                    storeOwner: '$store_owner',
                    storeTelephone: '$store_telephone',
                    categoryProductCount: 1,
                    storeLanguageName:'$store_language_name',
                    itemsPerPage:'$items_per_page',
                    countryId:'$country_id',
                    storeCurrencyId:'$store_currency_id',
                    zoneId:'$zone_id',
                }
            },
        ]).exec(function (error, settingsList) {
            if (error) {
                return reject(error);
            } else {
                return resolve({ status: 200, message: 'Successfully get settings', data: settingsList });
            }
        })

    })
}


module.exports.createSetting = (settingData) => {

    console.log("setting Data--------->>>>>>>",settingData);

    return new Promise((resolve, reject) => {
        settings.findByIdAndUpdate({ _id:'5cbd89c640b5afcf7d459997'}, settingData, { upsert: true }, (settingError, settingResponse) => {
            if (settingError) {
                console.log('settingError: ', settingError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Setting', data: settingResponse });
            }
        });
    })
}

