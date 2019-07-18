// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');

// Database models
var orderStatus = require('../models/order_status.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.orderStatusList = () => {
    return new Promise((resolve, reject) => {
        orderStatus.aggregate([
            {
                $project:{
                    orderStatusId:'$_id',
                    colorCode:'$color_code',
                    name:'$name',
                    isActive:'$is_active'
                }
            }
        ]).exec(function (orderErr, orderStatus) {
            if (orderErr) {
                console.log('order error: ', orderErr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully got the complete order status list.', data: orderStatus });
            }
        })

    })
}

module.exports.orderStatusById = (orderStatusId) => {
    return new Promise((resolve, reject) => {

        orderStatus.aggregate([
            {
                $match: { _id: ObjectId(orderStatusId) }
            }
        ]).exec(function (orderErr, orderStatus) {
            if (orderErr) {
                console.log('order error: ', orderErr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully got the complete list of products', data: orderStatus });
            }
        })

    })
}


module.exports.addOrderStatus = (orderStatusData) => {

    return new Promise((resolve, reject) => {
        orderStatus.create(orderStatusData, (orderError, orderStatus) => {
            if (orderError) {
                console.log('usererror: ', orderError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new Order Status.', data: orderStatus });
            }
        });
    })
}



module.exports.updateOrderStatus = (orderStatusId, orderStatusData) => {

    return new Promise((resolve, reject) => {
        orderStatus.findByIdAndUpdate({ _id: orderStatusId }, orderStatusData, { upsert: true }, (orderError, updatedOrderStatus) => {
            if (orderError) {
                console.log('usererror: ', orderError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Order Status', data: updatedOrderStatus });
            }
        });
    })
}

module.exports.deleteOrderStatus = (orderStatusId) => {
   
    return new Promise((resolve, reject) => {
        orderStatus.findByIdAndRemove({ _id: orderStatusId }, (orderError, deletedOrderStatus) => {
            if (orderError) {
                console.log('orderError: ', orderError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully deleted Order Status.', data: deletedOrderStatus });
            }
        });
    })
}










