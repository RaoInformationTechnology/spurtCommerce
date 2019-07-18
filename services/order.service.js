// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');
const moment = require('moment');

// Database models
var order = require('../models/order.model');
var order_product = require('../models/order_product.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;


module.exports.orderList = (orderData) => {
    return new Promise((resolve, reject) => {
        if (orderData.count == 'true' || orderData.count == 1) {
            order.count((productError, featureProduct) => {
                if (productError) {
                    console.log('usererror: ', productError);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully got the complete list of products', data: featureProduct });
                }
            });
        }
        else {

            var query = {
                $and: [{ 'is_active': '1' }]
            }

            if (orderData.orderId) {
                query['$and'].push({ '_id': ObjectId(orderData.orderId) });
            }

            if (orderData.totalAmount) {
                query['$and'].push({ 'total': parseInt(orderData.totalAmount) });
            }

            if (orderData.customerName) {
                query['$and'].push({ 'shipping_firstname': { $regex: new RegExp(orderData.customerName, 'i') } });
            }

            console.log("shopFilters", JSON.stringify(query));

            order.aggregate([
                {
                    $match: query
                },
                {
                    $project: {
                        orderId: '$_id',
                        paymentAddress1: '$payment_address_1',
                        createdDate: '$created_date',
                        currencyCode: '$currency_code',
                        currencyId: '$currency_id',
                        email: '$email',
                        firstname: '$firstname',
                        invoiceNo: '$invoice_no',
                        invoicePrefix: '$invoice_prefix',
                        isActive: '$is_active',
                        orderStatus: '$order_status_id',
                        shippingLastname: '$shipping_lastname',
                        invoicePrefix: '$invoice_prefix',
                        invoiceNo: '$invoiceNo',
                        total: '$total',
                        shippingFirstname: '$shipping_firstname',
                        shippingLastname: '$shipping_lastname',
                        paymentFirstname: '$payment_firstname',
                        orderPrefixId: '$orderPrefixId',
                        modifiedDate: '$modified_date',
                    }

                },
                {
                    $lookup: {
                        from: 'order_status',
                        localField: 'orderStatus',
                        foreignField: '_id',
                        as: 'orderStatus'
                    }
                },
                {
                    $unwind: '$orderStatus'
                },
                {
                    $project: {
                        paymentAddress1: 1,
                        orderPrefixId: 1,
                        createdDate: 1,
                        currencyCode: 1,
                        currencyId: 1,
                        email: 1,
                        firstname: 1,
                        isActive: 1,
                        shippingLastname: 1,
                        total: 1,
                        shippingFirstname: 1,
                        shippingLastname: 1,
                        paymentFirstname: 1,
                        orderId: 1,
                        modifiedDate: 1,
                        orderStatus: {
                            orderStatusId: '$orderStatus._id',
                            name: '$orderStatus.name',
                            colorCode: '$orderStatus.color_code',
                        },

                    }
                },
            ])
                .skip(orderData.offset)
                .limit(orderData.limit)
                .exec(function (error, productDetail) {
                    if (error) {
                        return reject(error);
                    } else {
                        return resolve({ status: 200, message: 'Successfully get order list', data: productDetail });
                    }
                })
        }
    })
}

module.exports.orderListById = (orderId) => {
    return new Promise((resolve, reject) => {

        order.aggregate([
            {
                $match: { '_id': ObjectId(orderId) }

            },
            {
                $project: {
                    orderId: '$_id',
                    paymentAddress1: '$payment_address_1',
                    createdDate: '$created_date',
                    modifiedDate: '$modified_date',
                    customerId: '$customer_id',
                    currencyCode: '$currency_code',
                    currencyId: '$currency_id',
                    email: '$email',
                    firstname: '$firstname',
                    invoiceNo: '$invoice_no',
                    invoicePrefix: '$invoice_prefix',
                    isActive: '$is_active',
                    orderStatus: '$order_status_id',
                    shippingLastname: '$shipping_lastname',
                    invoiceNo: '$invoiceNo',
                    total: '$total',
                    shippingFirstname: '$shipping_firstname',
                    shippingLastname: '$shipping_lastname',
                    paymentFirstname: '$payment_firstname',
                    shippingAddress1: '$shipping_address_1',
                    shippingAddress2: '$shipping_address_2',
                    orderPrefixId: '$orderPrefixId',
                    orderStatusId: '$order_status_id',
                    telephone: '$telephone',
                }
            },
            {
                $lookup: {
                    from: 'customer',
                    localField: 'customerId',
                    foreignField: '_id',
                    as: 'customerDetail'
                }
            },
            {
                $unwind: '$customerDetail'
            },
            {
                $lookup: {
                    from: 'order_product',
                    localField: '_id',
                    foreignField: 'order_id',
                    as: 'productList'
                }
            },
            {
                $unwind: '$productList'
            },
            {
                $project: {
                    paymentAddress1: 1,
                    createdDate: 1,
                    customerDetail: 1,
                    customerId: 1,
                    currencyCode: 1,
                    currencyId: 1,
                    email: 1,
                    firstname: 1,
                    invoiceNo: 1,
                    invoicePrefix: 1,
                    isActive: 1,
                    orderStatus: 1,
                    shippingLastname: 1,
                    invoiceNo: 1,
                    total: 1,
                    shippingFirstname: 1,
                    shippingLastname: 1,
                    paymentFirstname: 1,
                    shippingAddress1: 1,
                    shippingAddress2: 1,
                    orderPrefixId: 1,
                    orderStatusId: 1,
                    orderId: 1,
                    modifiedDate: 1,
                    telephone: 1,
                    productList: {
                        orderProductId: '$productList._id',
                        orderId: '$productList.order_id',
                        productId: '$productList.product_id',
                        model: '$productList.model',
                        quantity: '$productList.quantity',
                        name: '$productList.name',
                        total: '$productList.total'
                    },

                },

            },
            {
                $lookup: {
                    from: 'product',
                    localField: 'productList.productId',
                    foreignField: '_id',
                    as: 'productList.productDetail'
                }
            },
            {
                $unwind: '$productList.productDetail'
            },
            {
                $group: {
                    _id: '$_id',
                    paymentAddress1: {
                        $first: '$paymentAddress1',
                    },
                    customerDetail: {
                        $first: '$customerDetail'
                    },
                    customerId: {
                        $first: '$customerId'
                    },
                    currencyCode: {
                        $first: '$currencyCode'
                    },
                    currencyId: {
                        $first: '$currencyId'
                    },
                    email: {
                        $first: '$email'
                    },
                    firstname: {
                        $first: '$firstname'
                    },
                    invoiceNo: {
                        $first: '$invoiceNo'
                    },
                    total: {
                        $first: '$total'
                    },
                    price: {
                        $first: '$price'
                    },
                    shippingFirstname: {
                        $first: '$shippingFirstname'
                    },
                    shippingLastname: {
                        $first: '$shippingLastname'
                    },
                    paymentFirstname: {
                        $first: '$paymentFirstname'
                    },
                    shippingAddress1: {
                        $first: '$shippingAddress1'
                    },
                    shippingAddress2: {
                        $first: '$shippingAddress2'
                    },
                    isActive: {
                        $first: '$isActive'
                    },
                    productList: {
                        $push: '$productList',
                    },
                    orderPrefixId: {
                        $first: '$orderPrefixId',
                    },
                    orderStatusId: {
                        $first: '$orderStatusId',
                    },
                    createdDate: {
                        $first: '$createdDate'
                    },
                    orderId: {
                        $first: '$orderId'
                    },
                    invoicePrefix: {
                        $first: '$invoicePrefix'
                    },
                    modifiedDate: {
                        $first: '$modifiedDate'
                    },
                    telephone: {
                        $first: '$telephone'
                    }
                }
            }
        ])
            .exec(function (error, productDetail) {
                if (error) {
                    return reject(error);
                } else {
                    return resolve({ status: 200, message: 'Successfully get order list', data: productDetail });
                }
            })
    })
}

module.exports.totalAmount = (orderId) => {
    return new Promise((resolve, reject) => {

        order.aggregate([
            {
                $group: {
                    _id: null,
                    total: {
                        $sum: '$total'
                    }
                }
            },
        ]).exec(function (error, productDetail) {
            if (error) {
                return reject(error);
            } else {
                console.log('productDetail: ', productDetail[0].total);
                return resolve({ status: 200, message: 'Successfully get total order Amount', data: productDetail[0].total });
            }
        })
    })
}

module.exports.orderCheckout = (orderData) => {

    return new Promise((resolve, reject) => {
        order.create(orderData, (orderError, orderResponse) => {
            if (orderError) {
                console.log('orderError: ', orderError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Check Out the product successfully And Send order detail in your mail ..!!', data: orderResponse });
            }
        });
    })
}


module.exports.myOrderList = (orderData) => {

    const customer_id = orderData.customer_id;

    return new Promise((resolve, reject) => {
        order.aggregate([
            {
                $match: { 'customer_id': ObjectId(customer_id) }

            },
            {
                $project: {
                    orderId: '$_id',
                    total: '$total',
                    createdDate: '$created_date',
                    customerId: '$customer_id',
                    orderStatusId: '$order_status_id'
                }
            },
            {
                $lookup: {
                    from: 'order_status',
                    localField: 'orderStatusId',
                    foreignField: '_id',
                    as: 'orderStatus'
                }
            },
            {
                $unwind: '$orderStatus'
            },
            {
                $project: {
                    orderId: 1,
                    total: 1,
                    createdDate: 1,
                    customerId: 1,
                    orderStatusId: 1,
                    orderStatus: {
                        orderStatusId: '$orderStatus._id',
                        name: '$orderStatus.name',
                        colorCode: '$orderStatus.color_code',
                        isActive: 1,
                    },

                }
            },

        ]).exec(function (error, orderDetail) {
            if (error) {
                return reject(error);
            } else {
                return resolve({ status: 200, message: 'Successfully show the Order List..!!', data: orderDetail });
            }
        })
    })
}

module.exports.recentSellingProduct = () => {
    return new Promise((resolve, reject) => {

        order_product.aggregate([
            {
                $project: {
                    orderId: '$order_id',
                    Total: '$total',
                    product_id: '$product_id',
                }
            },
            {
                $lookup: {
                    from: 'product',
                    localField: 'product_id',
                    foreignField: '_id',
                    as: 'product'
                }
            },
            {
                $unwind: '$product'
            },
            {
                $project: {
                    orderId: 1,
                    Total: 1,
                    productId: '$product._id',
                    Images: '$product.Images',
                    ProductName: '$product.name',
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
                $unwind: '$productImage'
            },
            {
                $project: {
                    orderId: 1,
                    Total: 1,
                    productId: 1,
                    ProductName: 1,
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
                    productImage: { $push: '$productImage' },
                    Total: { $first: '$Total' },
                    productId: { $first: '$product_id' },
                    orderId: { $first: '$orderId' },
                    ProductName: { $first: '$ProductName' },
                }
            },
            {
                $lookup: {
                    from: 'order',
                    localField: 'orderId',
                    foreignField: '_id',
                    as: 'order'
                }
            },
            {
                $unwind: '$order'
            },
            {
                $project: {
                    orderId: 1,
                    Total: 1,
                    productId: 1,
                    ProductName: 1,
                    productImage: 1,
                    order: {
                        invoicePrefix: '$order.invoice_prefix',
                        orderId: '$order._id',
                        orderPrefixId: '$order.orderPrefixId'
                    }
                }
            }
        ]).exec(function (error, orderDetail) {

            if (error) {
                return reject(error);
            } else {
                return resolve({ status: 200, message: 'Successfully show the Order List..!!', data: orderDetail });
            }
        })
    })
}


module.exports.todayOrderCount = () => {

    return new Promise((resolve, reject) => {
        ``
        var datetime = new Date();
        var todayDate = datetime.toISOString().slice(0, 10);

        todayDate = todayDate + "T00:00:00.000Z";
        console.log("today date------>>>", todayDate);

        order.find({ created_date: todayDate }).count().exec((error, response) => {
            if (error) {
                return reject(error);
            } else {
                console.log("order count object", response);
                const order = {
                    orderCount: response,
                }

                return resolve({ status: 200, message: 'Successfully get Today order count', data: order });
            }
        });
    })
}


module.exports.todayOrderAmount = () => {

    return new Promise((resolve, reject) => {

        var datetime = new Date();
        var todayDate = datetime.toISOString().slice(0, 10);

        todayDate = todayDate + "T00:00:00.000Z";

        console.log("today date------>>>", todayDate);

        order.aggregate([
            {
                $match: { 'created_date': todayDate }
            },
            {
                $group: {
                    _id: null,
                    total: {
                        $sum: '$total'
                    }
                }
            }

        ]).exec(function (error, orderDetail) {
            console.log(JSON.stringify(orderDetail));
            if (error) {
                return reject(error);
            } else {
                console.log("order count object", orderDetail);
                return resolve({ status: 200, message: 'Successfully show the Order List..!!', data: orderDetail });
            }
        })
    })
}


module.exports.changeOrderStatus = (orderData) => {

    var currentDate = new Date().toISOString().replace(/T/, ' ').replace(/\..+/, '');

    const orderDetail = {
        modified_date: currentDate,
        order_status_id: orderData.orderStatusId
    }

    return new Promise((resolve, reject) => {
        order.findByIdAndUpdate({ _id: orderData.orderId }, orderDetail, { upsert: true }, (orderError, orderResponse) => {
            if (orderError) {
                console.log('orderError: ', orderError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Order Status', data: orderResponse });
            }
        });
    })
}

module.exports.salesList = () => {
    return new Promise((resolve, reject) => {
        order.find((orderError, orderResponse) => {
            if (orderError) {
                console.log('orderError: ', orderError);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                sales = {
                    month: 6,
                    monthYear: "Jun-2019",
                    ordercount: "5",
                    year: 2019,
                }
                const salesArray = [sales]
                resolve({ status: 200, message: 'Successfully updated Order Status', data: salesArray });
            }
        });
    })
}