// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var manufacture = require('../models/manufacture.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.manufactureList = (brandData) => {
    return new Promise((resolve, reject) => {
        if (brandData.count == 'true' || brandData.count == 1) {
            manufacture.count((manufactureError, manufactureList) => {
                if (manufactureError) {
                    console.log('manufactureError: ', manufactureError);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully get manufacturer list', data: manufactureList });
                }
            });

        }
        else {
            const aggregate = [{
                $project: {
                    manufacturerId: '$_id',
                    isActive: '$is_active',
                    image: '$image',
                    imagePath: '$image_path',
                    name: '$name',
                    sortOrder:'$sort_order',
                }
            }]
            if (brandData.limit) {
                aggregate.push({ $limit: brandData.offset + brandData.limit });
                aggregate.push({ $skip: brandData.offset });
            }
            console.log('agreaget: ', aggregate);
            manufacture.aggregate(aggregate).exec(function (manufactureError, manufactureList) {
                if (manufactureError) {
                    console.log('manufactureError:', manufactureError);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully get manufacturer list', data: manufactureList });
                }
            })
        }
    })
}

module.exports.updateManufacturer = (brandData) => {

    return new Promise((resolve, reject) => {
        manufacture.findByIdAndUpdate({ _id: brandData.manufacturer_id }, brandData, { upsert: true }, (manufactureError, updatedManufacture) => {
            if (manufactureError) {
                console.log('manufactureError: ', manufactureError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Manufacturer.', data: updatedManufacture });
            }
        });
    })
}

module.exports.addManufacturer = (brandData) => {

    return new Promise((resolve, reject) => {
        manufacture.create(brandData, (manufactureError, manufactureData) => {
            if (manufactureError) {
                console.log('manufactureError: ', manufactureError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new Manufacturer.', data: manufactureData });
            }
        });
    })
}

module.exports.deleteManufacturer = (manufacturerId) => {

    return new Promise((resolve, reject) => {
        manufacture.findOneAndRemove({ _id: manufacturerId }, (manufactureError, deletedManufacturer) => {
            if (manufactureError) {
                console.log('manufactureError: ', manufactureError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted Manufacturer.', data: deletedManufacturer });
            }
        });
    })
}



