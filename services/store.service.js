// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');
var _ = require('lodash');


// Database models
var product = require('../models/product.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

module.exports.getProductList = (productData) => {
    return new Promise((resolve, reject) => {
        if (productData.count == 'true' || productData.count == 1) {
            product.count((productError, newProduct) => {
                if (productError) {
                    console.log('usererror: ', productError);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully created new product.', data: newProduct });
                }
            });
        }
        else {

            var searchText = productData.keyword;
            
            var query = {
                $and: [{ 'isActive':1} ]
            }

            if (productData.keyword) {
                query['$and'].push({ 'name': { $regex: new RegExp(searchText, 'i') } });
            }

            if (productData.condition == '1') {
                query['$and'].push({ 'condition': '1' });
            }

            if (productData.condition == '2') {
                query['$and'].push({ 'condition': '2' });

            }

            if (productData.manufacturerId) {
                query['$and'].push({ 'manufacturer_id': ObjectId(productData.manufacturerId) });

            }

            if (productData.categoryId) {
                query['$and'].push({ 'Category': ObjectId(productData.categoryId) });
            }

            if (productData.priceTo) {
                query['$and'].push({ 'price': { '$lte': parseInt(productData.priceTo) } });
            }

            if (productData.priceFrom) {
                query['$and'].push({ 'price': { '$gte': parseInt(productData.priceFrom) } });
            }

            console.log("shopFilters", JSON.stringify(query));


            product.aggregate([
                {
                    $match: query
                },
                {
                    $unwind: '$Images',
                },
                {
                    $lookup: {
                        from: 'product_image',
                        localField: 'Images',
                        foreignField: '_id',
                        as: 'Images'
                    }
                },
                //Lookup of Product Image
                {
                    $unwind: '$Images'
                },
                {
                    $project: {
                        productId: '$_id',
                        Images: {
                            productImageId: '$Images._id',
                            image: '$Images.image',
                            containerName: '$Images.container_name',
                            defaultImage: '$Images.default_image',
                        },
                        Category: 1,
                        sku: 1,
                        quantity: 1,
                        description: 1,
                        minimumQuantity: 1,
                        subtractStock: 1,
                        stockStatusId: 1,
                        manufacturerId: 1,
                        shipping: 1,
                        price: 1,
                        dateAvailable: 1,
                        sortOrder: 1,
                        name: 1,
                        metaTagTitle: 1,
                        condition: 1,
                        isActive: 1,
                        location: 1
                    }
                },
                //Reduce To Limited Data Using Project
                {
                    $group: {
                        _id: '$_id',
                        productId: {
                            $first: '$productId',
                        },
                        sku: {
                            $first: '$sku',
                        },
                        Images: {
                            $first: '$Images',
                        },
                        location: {
                            $first: '$location'
                        },
                        quantity: {
                            $first: '$quantity'
                        },
                        description: {
                            $first: '$description'
                        },
                        minimumQuantity: {
                            $first: '$minimumQuantity'
                        },
                        subtractStock: {
                            $first: '$subtractStock'
                        },
                        stockStatusId: {
                            $first: '$stockStatusId'
                        },
                        manufacturerId: {
                            $first: '$manufacturerId'
                        },
                        shipping: {
                            $first: '$shipping'
                        },
                        price: {
                            $first: '$price'
                        },
                        dateAvailable: {
                            $first: '$dateAvailable'
                        },
                        sortOrder: {
                            $first: '$sortOrder'
                        },
                        name: {
                            $first: '$name'
                        },
                        metaTagTitle: {
                            $first: '$metaTagTitle'
                        },
                        condition: {
                            $first: '$condition'
                        },
                        isActive: {
                            $first: '$isActive'
                        }
                    }
                },
            ])
            .skip(productData.offset)
            .limit(productData.limit)   
            .exec(function (error, productList) {
                if (error) {
                    console.log("Error:", error);
                    return reject(error);
                } else {
                    const productData = {
                        maximumProductPrice: 69000,
                        productList: productList
                    }
                    return resolve({ status: 200, message: 'Successfully get product list', data: productData });
                }
            })
        }
    })
}


