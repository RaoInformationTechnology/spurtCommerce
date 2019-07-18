// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var zone = require('../models/zone.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;


module.exports.zoneList = () => {
    return new Promise((resolve, reject) => {
        zone.aggregate([
            {
                $project: {
                    zoneId: '$_id',
                    code: '$code',
                    isActive: 1,
                    name: '$name',
                    country: '$country_id',
                }
            },
            //Lookup of Country
            {
                $lookup: {
                    from: 'country',
                    localField: 'country',
                    foreignField: '_id',
                    as: 'country'
                }
            },
            {
                $unwind: '$country'
            },
            {
                $project: {
                    country: {
                        countryId: '$country._id',
                        image: '$country.name',
                        containerName: '$country.code',
                    },
                    zoneId: 1,
                    code: 1,
                    isActive: 1,
                    name: 1,
                    country: 1
                }
            },

        ]).exec(function (zoneError, zoneList) {
            if (zoneError) {
                return reject(zoneError);
            } else {
                return resolve({ status: 200, message: 'Successfully get settings', data: zoneList });
            }
        })

    })
}


module.exports.addZone = (zoneData) => {

    return new Promise((resolve, reject) => {
        zone.create(zoneData, (zoneErr, zoneResponse) => {
            if (zoneErr) {
                console.log('zoneError: ', zoneErr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new zone.', data: zoneResponse });
            }
        });
    })
}

module.exports.deleteZone = (zoneId) => {
    return new Promise((resolve, reject) => {
        zone.findOneAndRemove({ _id: zoneId }, (zoneErr, deletedZone) => {
            if (zoneErr) {
                console.log('zoneError: ', zoneErr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted Zone.', data: deletedZone });
            }
        });
    })
}

module.exports.updateZone = (zoneId, zoneData) => {

    return new Promise((resolve, reject) => {
        zone.findOneAndUpdate({ _id: zoneId }, zoneData, { upsert: true }, (zoneErr, updatedZone) => {
            if (zoneErr) {
                console.log('zoneError: ', zoneErr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Zone.', data: updatedZone });
            }
        });
    })
}




