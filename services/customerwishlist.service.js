// Npm modules
const mongoose = require('mongoose');
const path = require('path');


// Database models
var wishlist = require('../models/customerwishlist.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.addProductToWishList = (productData) => {
    console.log('addEmployeeToTheCompany productData: ', productData);
    return new Promise((resolve, reject) => {
        wishlist.create(productData, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Thank you product added to the wishlist successfully.', data: userres });
            }
        });
    })
}



module.exports.getWishList = (wishList) => {


    return new Promise((resolve, reject) => {

        if (wishList.count == 'true' || wishList.count == 1) {
            wishlist.count({ 'customer_id': wishList.customer_id }, (productError, newProduct) => {
                if (productError) {
                    console.log('usererror: ', productError);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully created new product.', data: newProduct });
                }
            });

        }
        else {

            wishlist.aggregate([
                {
                    $match: { 'customer_id': ObjectId(wishList.customer_id) }

                },
                {
                    $project: {
                        wishlistProductId: '$_id',
                        productId: '$product_id'
                    }
                },
                {
                    $lookup: {
                        from: 'product',
                        localField: 'productId',
                        foreignField: '_id',
                        as: 'product'
                    }
                },
                {
                    $unwind: '$product'
                },
                {
                    $lookup: {
                        from: 'product_image',
                        localField: 'product.Images',
                        foreignField: '_id',
                        as: 'productImage'
                    }
                },
                {
                    $unwind: '$productImage'

                },
                {
                    $project: {
                        productImage: {
                            _id: '$productImage._id',
                            image: '$productImage.image',
                            containerName: '$productImage.container_name',
                            defaultImage: '$productImage.default_image',
                        },
                        product: 1,
                        wishlistProductId: 1
                    }

                },
                {
                    $group: {
                        _id: '$_id',
                        product: {
                            $first: '$product',
                        },
                        productId: {
                            $first: '$productId',
                        },
                        productImage: {
                            $first: '$productImage',
                        },
                        wishlistProductId: {
                            $first: '$wishlistProductId',
                        }
                    }
                }


            ]).exec(function (error, productDetail) {
                if (error) {
                    return reject(error);
                } else {
                    console.log('productDetail: ', productDetail);
                    return resolve({ status: 200, message: 'Successfully get product list', data: productDetail });
                }
            })
        }
    })
}

module.exports.removeProductFromWishList = (wishListId) => {
    console.log('addEmployeeToTheCompany productData: ', wishListId);
    return new Promise((resolve, reject) => {
        wishlist.findByIdAndRemove(wishListId, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Thank you deleted the product from wishlist successfully.', data: userres });
            }
        });
    })
}








