// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');
var _ = require('lodash');


// Database models
var product = require('../models/product.model');
var product_Image = require('../models/product_image.model');
var productRelated = require('../models/productrelated.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;


module.exports.getfeatureproduct = (productData) => {
    return new Promise((resolve, reject) => {

        if (productData.count == 'true') {

            product.count({ is_featured: '1' }, (productError, featureProduct) => {
                if (productError) {
                    console.log('usererror: ', productError);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully got the complete list of products', data: featureProduct });
                }
            });
        }
        else {

            product.aggregate([
                {
                    $match: { isFeatured: 1 }

                },
                {
                    $limit: productData.limit
                },
                {
                    $unwind: '$Images'
                },
                {
                    $lookup: {
                        from: 'product_image',
                        localField: 'Images',
                        foreignField: '_id',
                        as: 'Images'
                    }
                },
                {
                    $unwind: {
                        path: '$Images',
                        preserveNullAndEmptyArrays: true
                    }

                },
                {
                    $project: {
                        Images: {
                            _id: '$Images._id',
                            image: '$Images.image',
                            containerName: '$Images.container_name',
                            defaultImage: '$Images.default_image',
                        },
                        productId: '$_id',
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
                        location: 1,
                    }

                },
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
                        Category: {
                            $first: '$Category',
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
                }

            ]).exec(function (error, productDetail) {
                if (error) {
                    return reject(error);
                } else {
                    return resolve({ status: 200, message: 'Successfully get productDetail', data: productDetail });
                }
            })
        }
    })
}



module.exports.productDetail = (productId) => {
    return new Promise((resolve, reject) => {
        console.log('productId: ', productId)
        product.aggregate([
            {
                $match: { '_id': ObjectId(productId) }
            },
            //Using Match Find By Id
            {
                $unwind: {
                    path: '$Images',
                    preserveNullAndEmptyArrays: true
                }
            },
            {
                $lookup: {
                    from: 'product_image',
                    localField: 'Images',
                    foreignField: '_id',
                    as: 'productImage'
                }
            },
            //Lookup of Product Image
            {
                $unwind: {
                    path: '$productImage',
                    preserveNullAndEmptyArrays: true
                }
            },
            {
                $project: {
                    product_image: {
                        productImageId: '$productImage._id',
                        image: '$productImage.image',
                        containerName: '$productImage.container_name',
                        defaultImage: '$productImage.default_image',
                    },
                    product_id: 1,
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
                    location: 1,
                    upc: 1
                }
            },
            // // //Reduce To Limited Data Using Project
            {
                $group: {
                    _id: '$_id',
                    product_id: {
                        $first: '$product_id',
                    },
                    sku: {
                        $first: '$sku',
                    },
                    productImage: {
                        $push: '$product_image',
                    },
                    Category: {
                        $first: '$Category',
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
                    },
                    upc: {
                        $first: '$upc'
                    }
                }
            },
            // //Group To Generate Single Document to Multiple
            {
                $unwind: {
                    path: '$Category',
                    preserveNullAndEmptyArrays: true
                }
            },
            // //Unwind Category To Create Single Object From Array
            {
                $lookup: {
                    from: 'category',
                    localField: 'Category',
                    foreignField: '_id',
                    as: 'Category'
                }
            },
            // //Lookup Of Product Category
            {
                $unwind: {
                    path: '$Category',
                    preserveNullAndEmptyArrays: true
                }
            },
            {
                $project: {
                    Category: {
                        categoryId: '$Category._id',
                        categoryName: '$Category.name',
                    },
                    productImage: 1,
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
                    location: 1,
                    upc: 1,

                }
            },
            //Project To Reduce Category Data to Limited 
            {
                $group: {
                    _id: '$_id',
                    sku: {
                        $first: '$sku',
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
                    },

                    productImage: {
                        $first: '$productImage'
                    },
                    Category: {
                        $push: '$Category'
                    },
                    upc: {
                        $first: '$upc'
                    }
                }
            },
            {
                $lookup: {
                    from: 'product_related',
                    localField: '_id',
                    foreignField: 'product_id',
                    as: 'relatedProductDetail'
                }
            },
            {
                $unwind: {
                    path: '$relatedProductDetail',
                    preserveNullAndEmptyArrays: true,
                }
            },
            {
                $lookup: {
                    from: 'product',
                    localField: 'relatedProductDetail.product_id',
                    foreignField: '_id',
                    as: 'relatedProductDetail'
                }
            }
            //Group To Generate Single Document Form Multiple Output Document

        ]).exec(function (error, productDetail) {
            if (error) {
                return reject(error);
            } else {
                return resolve({ status: 200, message: 'Successfully get productDetail', data: productDetail });
            }
        })
    })
}


module.exports.addProduct = (productData) => {
    console.log("Product Data in service------->", productData);
    return new Promise((resolve, reject) => {
        product.create(productData, (productError, productRes) => {
            if (productError) {
                console.log('usererror: ', productError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new product.', data: productRes });
            }
        });
    })
}


module.exports.getRelatedProduct = (productId) => {
    return new Promise((resolve, reject) => {

        productRelated.aggregate([
            {
                $match: { 'product_id': ObjectId(productId) }
            },
            {
                $lookup: {
                    from: 'product',
                    localField: 'related_id',
                    foreignField: '_id',
                    as: 'product'
                }
            },
            {
                $unwind: {
                    path: '$product',
                    preserveNullAndEmptyArrays: true,
                }
            },
            {
                $project: {
                    'productId': '$product._id',
                    'name': '$product.name',
                    'description': '$product.description',
                    'price': '$product.price',
                    'Images': '$product.Images',
                }
            },
            {
                $lookup: {
                    from: 'product_image',
                    localField: 'Images',
                    foreignField: '_id',
                    as: 'productImage'
                }
            },
            {
                $unwind: {
                    path: '$productImage',
                    preserveNullAndEmptyArrays: true,
                }
            },
            {
                $project: {
                    productId: 1,
                    name: 1,
                    description: 1,
                    price: 1,
                    productImage: {
                        _id: '$productImage._id',
                        image: '$productImage.image',
                        containerName: '$productImage.container_name',
                        defaultImage: '$productImage.default_image',
                    },

                }
            },
            {
                $group: {
                    _id: '$productId',
                    name: {
                        $first: '$name',
                    },
                    description: {
                        $first: '$description'
                    },
                    price: {
                        $first: '$price'
                    },
                    productImage: {
                        $first: '$productImage'
                    },
                    productId: {
                        $first: '$productId'
                    },
                }
            }

        ]).exec(function (error, productDetail) {
            if (error) {
                return reject(error);
            } else {
                return resolve({ status: 200, message: 'Related product list is successfully being shown.', data: productDetail });
            }
        })

    })

}


module.exports.topSellingProduct = (productData) => {
    return new Promise((resolve, reject) => {
        product.aggregate([
            {
                $limit: 4
            },
            {
                $project: {
                    'product.productId': '$_id',
                    'product.name': '$name',
                    'product.description': '$description',
                    'product.price': '$price',
                    'product.Images': '$Images',
                }
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
                $unwind: {
                    path: '$productImage',
                    preserveNullAndEmptyArrays: true,
                }
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
                }

            },
        ])
            .limit(4)
            .exec(function (error, topSelling) {
                if (error) {
                    return reject(error);
                } else {
                    return resolve({ status: 200, message: 'Successfully get product list', data: topSelling });
                }
            })

    })
}


module.exports.updateProduct = (productId, productData) => {
    console.log("Product Data in service------->", productData);
    return new Promise((resolve, reject) => {
        product.findByIdAndUpdate({ _id: productId }, productData, { upsert: true }, (productError, updateProduct) => {
            if (productError) {
                console.log('usererror: ', productError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated product.', data: updateProduct });
            }
        });
    })
}


module.exports.deleteProduct = (productId) => {

    return new Promise((resolve, reject) => {
        product.findByIdAndRemove({ _id: productId }, (productError, deleteProduct) => {
            if (productError) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted Product.', data: deleteProduct });
            }
        });
    })
}


module.exports.updateFeatureProduct = (productId, productData) => {

    return new Promise((resolve, reject) => {
        product.findByIdAndUpdate({ _id: productId }, productData, { upsert: true }, (productError, updateProduct) => {
            if (productError) {
                console.log('usererror: ', productError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated product.', data: updateProduct });
            }
        });
    })
}


module.exports.addImageToArray = (productId, productImage) => {
    let imageData;
    return new Promise((resolve, reject) => {

        _.forEach(productImage, (singleImageItem) => {

            if (!singleImageItem.productImageId) {

                imageData = {
                    image: singleImageItem.image,
                    container_name: singleImageItem.containerName,
                    default_image: 1,
                }

                product_Image.create(imageData, (productError, savedImage) => {
                    if (productError) {
                        console.log('usererror: ', productError);
                    } else {
                        product.find({ _id: productId }, (productError, foundproduct) => {
                            if (productError) {
                                reject({ status: 500, message: 'Internal Server Error' });
                            } else {
                                foundproduct[0].Images.push(savedImage._id);
                                foundproduct = foundproduct[0];
                                product.findOneAndUpdate({ _id: productId }, { $set: foundproduct }, { upsert: true, new: true }, (err, updatedProduct) => {
                                    if (err) {
                                        console.log('usererror: ', err);
                                    }
                                });
                            }
                        });
                    }
                });

            }
        })

        resolve({ status: 200, message: 'Successfully updated product.' });
    })
}



module.exports.AddImage = (productImage) => {
    let imageData;
    let savedImageArray = [];
    return new Promise((resolve, reject) => {

        _.forEach(productImage, (singleImageItem, index) => {
            if (!singleImageItem.productImageId) {

                imageData = {
                    image: singleImageItem.image,
                    container_name: singleImageItem.containerName,
                    default_image: singleImageItem.defaultImage,
                }

                product_Image.create(imageData, (productError, savedImage) => {
                    if (productError) {
                        console.log('usererror: ', productError);
                    } else {
                        console.log("SAved Images------>>>", savedImage);
                        savedImageArray.push(savedImage._id);
                        console.log("SAved Images------>>>", savedImageArray);
                        if (index + 1 === productImage.length) {
                            resolve({ status: 200, message: 'Successfully updated product.', data: savedImageArray });
                        }
                    }
                });
            } else {
                if (index + 1 === productImage.length) {
                    resolve({ status: 200, message: 'Successfully updated product.', data: savedImageArray });
                }
            }
        })
    })
}

module.exports.productList = (productData) => {
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

            var query = {
                $and: [
                    { 'name': { $regex: new RegExp(productData.keyword, 'i') }, },
                ]
            }

            if (productData.sku) {
                query['$and'].push({ 'sku': { $regex: new RegExp(productData.sku, 'i') } });
            }

            if (productData.status == 1) {
                query['$and'].push({ 'isActive': 1 });
            }

            if (productData.status == 0) {
                query['$and'].push({ 'isActive': 0 });
            }



            const aggregate = [
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
                        as: 'productImage'
                    }
                },
                //Lookup of Product Image
                {
                    $unwind: '$productImage'
                },
                {
                    $project: {
                        product_image: {
                            productImageId: '$productImage._id',
                            image: '$productImage.image',
                            containerName: '$productImage.container_name',
                            defaultImage: '$productImage.default_image',
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
                        location: 1,
                        isFeatured: 1,
                    }
                },
                //Reduce To Limited Data Using Project
                {
                    $group: {
                        _id: '$_id',
                        product_id: {
                            $first: '$product_id',
                        },
                        sku: {
                            $first: '$sku',
                        },
                        productImage: {
                            $first: '$product_image',
                        },
                        Category: {
                            $first: '$Category',
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
                        },
                        isFeatured: {
                            $first: '$isFeatured'
                        }
                    }
                },
                //Group To Generate Single Document to Multiple
                {
                    $unwind: '$Category',
                },
                //Unwind Category To Create Single Object From Array
                {
                    $lookup: {
                        from: 'category',
                        localField: 'Category',
                        foreignField: '_id',
                        as: 'Category'
                    }
                },
                //Lookup Of Product Category
                {
                    $unwind: '$Category'
                },
                {
                    $project: {
                        productImage: 1,
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
                        location: 1,
                        isFeatured: 1,
                        Category: {
                            categoryId: '$Category._id',
                            categoryName: '$Category.name',
                        },

                    }
                },
                //Project To Reduce Category Data to Limited 
                {
                    $group: {
                        _id: '$_id',
                        sku: {
                            $first: '$sku',
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
                        },

                        productImage: {
                            $first: '$productImage'
                        },
                        Category: {
                            $push: '$Category'
                        },
                        isFeatured: {
                            $first: '$isFeatured',
                        }
                    }
                }
                //Group To Generate Single Document Form Multiple Output Document

            ]

            if (productData.limit) {
                aggregate.push({ $limit: productData.offset + productData.limit });
                aggregate.push({ $skip: productData.offset });
            }

            product.aggregate(aggregate).exec(function (error, productDetail) {
                if (error) {
                    return reject(error);
                } else {
                    return resolve({ status: 200, message: 'Successfully get product list', data: productDetail });
                }
            })
        }
    })
}


module.exports.addrelatedProduct = (productId, relatedProduct) => {
    let productData;

    return new Promise((resolve, reject) => {

        _.forEach(relatedProduct, (singleProductId) => {

            productData = {
                product_id: productId,
                related_id: singleProductId,
                default_image: 1,
            }

            productRelated.create(productData, (productError, savedProduct) => {
                if (productError) {
                    console.log('usererror: ', productError);
                } else {
                    console.log('related product', savedProduct);
                }
            });
        })

        resolve({ status: 200, message: 'Successfully updated product.' });
    })
}









