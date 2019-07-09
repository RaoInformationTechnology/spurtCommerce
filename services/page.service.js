// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var page = require('../models/page.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.pageList = (productData) => {
    return new Promise((resolve, reject) => {
        page.aggregate([
            {
                $project: {
                    'pageId': '$_id',
                    'metaTagContent': '$meta_tag_description',
                    'metaTagKeyword': '$meta_tag_keywords',
                    'metaTagTitle': '$meta_tag_title',
                    'title': '$title',
                    'isActive':'$is_active',
                    'content':'$full_text',
                }
            },
        ])
        .exec(function (pageError, pageList) {
            if (pageError) {
                return reject(pageError);
            } else {
                return resolve({ status: 200, message: 'Successfully get page list', data: pageList });
            }
        })
    })
}

module.exports.updatePageDetail = (pageId, pageData) => {

    return new Promise((resolve, reject) => {
        page.findOneAndUpdate({ _id: pageId }, pageData, { upsert: true }, (pageError, updatedPageDetail) => {
            if (pageError) {
                console.log('pageError: ', pageError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated page.', data: updatedPageDetail });
            }
        });
    })
}

module.exports.addNewPage = (pageData) => {

    return new Promise((resolve, reject) => {
        page.create(pageData,(pageError, pageResponse) => {
            if (pageError) {
                console.log('pageError: ', pageError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully Added page.', data: pageResponse });
            }
        });
    })
}

module.exports.deletePage = (pageId) => {

    return new Promise((resolve, reject) => {
        page.findByIdAndRemove({_id:pageId},(pageError, deletedPage) => {
            if (pageError) {
                console.log('pageError: ', pageError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully Deleted page.', data: deletedPage });
            }
        });
    })
}


module.exports.pageDetail = (pageId) => {
    return new Promise((resolve, reject) => {
        page.aggregate([
            {
                $match: { '_id': ObjectId(pageId) }
            },
            {
                $project: {
                    'pageId': '$_id',
                    'metaTagContent': '$meta_tag_description',
                    'metaTagKeyword': '$meta_tag_keywords',
                    'metaTagTitle': '$meta_tag_title',
                    'title': '$title',
                    'isActive':'$is_active',
                    'content':'$full_text',
                }
            },
        ])
        .exec(function (pageError, pageDetail) {
            if (pageError) {
                return reject(pageError);
            } else {
                return resolve({ status: 200, message: 'Successfully get page list', data: pageDetail[0] });
            }
        })
    })
}




