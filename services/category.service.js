// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');
var _ = require('lodash');


// Database models
var category = require('../models/category.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.categoryList = (categoryData) => {
    return new Promise((resolve, reject) => {
        if (categoryData.count == 'true' || categoryData.count == 1) {

            category.count((useerr, userres) => {
                if (useerr) {
                    console.log('usererror: ', useerr);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully got the complete list of categorys', data: userres });
                }
            });
        }
        else {
            category.aggregate([
                {
                    $match: { parent_int: "0" }
                },
                {
                    $project: {
                        categoryId: '$_id',
                        name: '$name',
                        image: '$image',
                        imagePath: '$image_path',
                        parentInt: '$parent_int',
                        sortOrder: '$sort_order',
                        metaTagTitle: '$meta_tag_title',
                        metaTagDescription: '$meta_tag_description',
                        metaTagKeyword: '$meta_tag_keyword',
                        children: '$children'
                    }

                },
                {
                    $lookup: {
                        from: 'category',
                        localField: 'children',
                        foreignField: '_id',
                        as: 'children'
                    }
                },
                {
                    $unwind: {
                        path: '$children',
                        preserveNullAndEmptyArrays: true
                    }
                },
                {
                    $project: {
                        categoryId: 1,
                        name: 1,
                        image: 1,
                        imagePath: 1,
                        parentInt: 1,
                        sortOrder: 1,
                        metaTagTitle: 1,
                        metaTagDescription: 1,
                        metaTagKeyword: 1,
                        children: {
                            categoryId: '$children._id',
                            name: '$children.name',
                            image: '$children.image',
                            imagePath: '$children.image_path',
                            parentInt: '$children.parent_int',
                            sortOrder: '$children.sort_order',
                            metaTagTitle: '$children.meta_tag_title',
                            metaTagDescription: '$children.meta_tag_description',
                            metaTagKeyword: '$children.meta_tag_keyword',
                            children: '$children.children',
                        },
                    }
                },
                {
                    $unwind: {
                        path: '$children.children',
                        preserveNullAndEmptyArrays: true
                    }
                },
                {
                    $lookup: {
                        from: 'category',
                        localField: 'children.children',
                        foreignField: '_id',
                        as: 'children.children'
                    }
                },
                {
                    $unwind: {
                        path: '$children.children',
                        preserveNullAndEmptyArrays: true
                    }
                },
                {
                    $project: {
                        categoryId: 1,
                        name: 1,
                        image: 1,
                        imagePath: 1,
                        parentInt: 1,
                        sortOrder: 1,
                        metaTagTitle: 1,
                        metaTagDescription: 1,
                        metaTagKeyword: 1,
                        children: {
                            categoryId: '$children.categoryId',
                            name: '$children.name',
                            image: '$children.image',
                            imagePath: '$children.imagePath',
                            parentInt: '$children.parentInt',
                            sortOrder: '$children.sortOrder',
                            metaTagTitle: '$children.metaTagTitle',
                            metaTagDescription: '$children.metaTagDescription',
                            metaTagKeyword: '$children.metaTagKeyword',
                            children: {
                                categoryId: '$children.children._id',
                                name: '$children.children.name',
                                image: '$children.children.image',
                                imagePath: '$children.children.image_path',
                                parentInt: '$children.children.parent_int',
                                sortOrder: '$children.children.sort_order',
                                metaTagTitle: '$children.children.meta_tag_title',
                                metaTagDescription: '$children.children.meta_tag_description',
                                metaTagKeyword: '$children.children.meta_tag_keyword',
                            }
                        },
                    }
                },
                {
                    $group: {
                        _id: '$children.categoryId',
                        categoryId: { $first: '$categoryId' },
                        name: { $first: '$name' },
                        image: { $first: '$image', },
                        imagePath: { $first: '$imagePath', },
                        parentInt: { $first: '$parentInt' },
                        sortOrder: { $first: '$sortOrder', },
                        metaTagTitle: { $first: '$metaTagTitle', },
                        metaTagDescription: { $first: '$metaTagDescription' },
                        metaTagKeyword: { $first: '$metaTagKeyword', },
                        grandchilds: { $push: '$children.children' },
                        children: {
                            $first: {
                                categoryId: '$children.categoryId',
                                name: '$children.name',
                                image: '$children.image',
                                imagePath: '$children.imagePath',
                                parentInt: '$children.parentInt',
                                sortOrder: '$children.sortOrder',
                                metaTagTitle: '$children.metaTagTitle',
                                metaTagDescription: '$children.metaTagDescription',
                                metaTagKeyword: '$children.metaTagKeyword',
                            }

                        }
                    }
                },
                {
                    $project: {
                        _id: 1,
                        categoryId: 1,
                        name: 1,
                        image: 1,
                        imagePath: 1,
                        parentInt: 1,
                        sortOrder: 1,
                        metaTagTitle: 1,
                        metaTagDescription: 1,
                        metaTagKeyword: 1,
                        children: {
                            categoryId: '$children.categoryId',
                            name: '$children.name',
                            image: '$children.image',
                            imagePath: '$children.imagePath',
                            parentInt: '$children.parentInt',
                            sortOrder: '$children.sortOrder',
                            metaTagTitle: '$children.metaTagTitle',
                            metaTagDescription: '$children.metaTagDescription',
                            metaTagKeyword: '$children.metaTagKeyword',
                            children: '$grandchilds',
                        }
                    }
                },
                {
                    $group: {
                        _id: '$categoryId',
                        children: {
                            $push: '$children'
                        },
                        name: { $first: '$name' },
                        image: { $first: '$image', },
                        imagePath: { $first: '$imagePath', },
                        parentInt: { $first: '$parentInt' },
                        sortOrder: { $first: '$sortOrder', },
                        metaTagTitle: { $first: '$metaTagTitle', },
                        metaTagDescription: { $first: '$metaTagDescription' },
                        metaTagKeyword: { $first: '$metaTagKeyword', },
                    }
                }

            ]).exec(function (Error, Response) {
                if (Error) {
                    console.log('error: ', Error);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully get manufacturer list', data: Response });
                }
            })

        }
    })
}

module.exports.deleteCategory = (categoryId) => {
    console.log("body in country===>", categoryId);
    return new Promise((resolve, reject) => {
        category.findByIdAndRemove({ _id: categoryId }, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted Category.', data: userres });
            }
        });
    })
}

module.exports.addCategory = (categoryData) => {
    console.log("categoryData in country===>", categoryData);
    return new Promise((resolve, reject) => {
        category.create(categoryData, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new Category.', data: userres });
            }
        });
    })
}

module.exports.updateCategory = (categoryId, categoryData) => {
    console.log("categoryData in service===>", categoryData);
    console.log("categoryid in service====>", categoryId);
    return new Promise((resolve, reject) => {
        category.findByIdAndUpdate({ _id: categoryId }, categoryData, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Category.', data: userres });
            }
        });
    })
}


module.exports.updateChildren = (parent, childrenId) => {
    console.log("parent in service===>", parent);
    console.log("childrenId in service====>", childrenId);
    return new Promise((resolve, reject) => {
        category.findOne({ _id: parent }, (useerr, category) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                console.log("founded category=======>>", category);
                category.children.push(childrenId);
                category.save();
                resolve({ status: 200, message: 'Successfully updated Category.', data: category });
            }
        });
    })
}


module.exports.categoryByList = (categoryData) => {
    return new Promise((resolve, reject) => {
        if (categoryData.count == 'true' || categoryData.count == 1) {

            category.count((useerr, userres) => {
                if (useerr) {
                    console.log('usererror: ', useerr);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully got the complete list of categorys', data: userres });
                }
            });
        }
        else {

            var searchText = categoryData.keyword;


            var query = {
                $and: [
                    { 'name': { $regex: new RegExp(searchText, 'i') }, },
                ]
            }

            const aggregate =
                [
                    {
                        $match: query
                    },
                    {
                        $project: {
                            categoryId: '$_id',
                            name: '$name',
                            image: '$image',
                            imagePath: '$image_path',
                            parentInt: '$parent_int',
                            sortOrder: '$sort_order',
                            metaTagTitle: '$meta_tag_title',
                            metaTagDescription: '$meta_tag_description',
                            metaTagKeyword: '$meta_tag_keyword',
                            children: '$children'
                        }
                    }
                ]

            if (categoryData.limit) {
                aggregate.push({ $limit: categoryData.offset + categoryData.limit });
                aggregate.push({ $skip: categoryData.offset });
            }


            category.aggregate(aggregate).exec(function (Error, Response) {
                if (Error) {
                    console.log('error: ', Error);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully get manufacturer list', data: Response });
                }
            })

        }
    })
}


