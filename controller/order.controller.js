var order = require('../models/order.model');

//services
var orderService = require('../services/order.service');
var customerService = require('../services/customer.service');
var emailService = require('../services/email.service');
var productService = require('../services/product.service');
var orderProduct = require('../models/order_product.model');


// npm import
const path = require('path');
const mongoose = require('mongoose');
const ObjectId = require('mongodb').ObjectId;
var moment = require('moment');
var _ = require('lodash');


module.exports.orderList = (req, res) => {
	const orderData = {
		limit: parseInt(req.query.limit),
		offset: req.query.offset ? parseInt(req.query.offset) : 0,
		orderId: req.query.orderId,
		totalAmount: req.query.totalAmount,
		dateAdded: req.query.dateAdded,
		keyword: req.query.keyword,
		customerName: req.query.customerName,
		count: req.query.count,
	}
	orderService.orderList(orderData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.orderDetail = (req, res) => {

	const orderId = req.query.orderId;

	orderService.orderListById(orderId).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.totalAmount = (req, res) => {

	orderService.totalAmount().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.orderCheckout = (req, res) => {

	let productDetailData = [];

	_.forEach(req.body.productDetails, (product) => {
		let productInformatiomData = {
			productInformatiomData: {
				name: product.name,
				model: product.model,
				quantity: product.quantity,
				total: product.price * product.quantity
			}
		}

		productDetailData.push(productInformatiomData);
	})

	let totalAmount = 0;
	let total = 0;

	const today = moment().format('YYYY-MM-DD');

	const authorization = req.header('authorization');
	customerService.getProfile(authorization).then((response) => {
		_.forEach(req.body.productDetails, (product) => {
			total = product.price * product.quantity;
			totalAmount = totalAmount + total;
		})

		let randomNumber = Math.floor(100000000 + Math.random() * 900000000);
		const orderId = 'SPU-' + randomNumber;
		const orderData = {
			orderId: orderId,
			email: req.body.emailId,
			telephone: req.body.phoneNumber,
			shipping_address_format: req.body.shippingAddressFormat,
			shipping_address_1: req.body.shippingAddress_1,
			shipping_address_2: req.body.shippingAddress_2,
			shipping_city: req.body.shippingCity,
			shipping_company: req.body.shippingCompany,
			shipping_country: req.body.shippingCountry,
			shipping_firstname: req.body.shippingFirstName,
			shipping_lastname: req.body.shippingLastName,
			shipping_postcode: req.body.shippingPostCode,
			shipping_zone: req.body.shippingZone,
			customer_id: response.data._id,
			invoice_prefix: 'SPU',
			order_status_id: '5cbd891240b5afcf7d459820',
			total: totalAmount,
			is_active: "1",
		}

		let message = "Dear " + req.body.shippingFirstName + " " + req.body.shippingLastName + ",        </td>    </tr>    <tr>        <td dir='ltr' style='padding:0 0px;color:#078e05;font-weight:400;text-align:left;font-size:16px;line-height:1.5rem;padding-top:10px;font-family: 'Roboto', sans-serif;' valign='top'> Order successfully placed.        </td>    </tr>    <tr>        <td dir='ltr' style='padding:0 0px;color:#000;font-weight:300;text-align:left;font-size:12px;line-height:1.2rem;padding-top:10px;font-family: 'Roboto', sans-serif;' valign='top'> You have successfully placed an order for customization services. Kindly find the following details on the placed order.    </tr></tbody></table></td></tr>\r\n";

		emailService.customerOrderMail(message, orderData, 'Congratulations on your recent order', productDetailData, today).then((response) => {

			orderService.orderCheckout(orderData).then((response) => {
				_.forEach(req.body.productDetails, (product) => {
					const productData = {
						order_id: response.data._id,
						product_id: product.productId,
						name: product.name,
						model: product.model,
						quantity: product.quantity,
						total: product.price * product.quantity
					}
					orderProduct.create(productData, (useerr, userres) => {
						if (useerr) {
							console.log("usererr");
						} else {
							console.log("user response");
						}
					});
				})

				return res.status(200).json({ status: 1, message: 'Check Out the product successfully And Send order detail in your mail ..!!', data: response.data });
			}).catch((error) => {
				console.log('error: ', error);
				return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
			});
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});

	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.myOrderList = (req, res) => {
	const authorization = req.header('authorization');
	customerService.getProfile(authorization).then((response) => {
		const orderData = {
			customer_id: response.data._id,
		}
		orderService.myOrderList(orderData).then((response) => {
			return res.status(200).json({ status: 1, message: response.message, data: response.data });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.recentSellingProduct = (req, res) => {

	orderService.recentSellingProduct().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.todayOrderCount = (req, res) => {

	orderService.todayOrderCount().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.todayOrderAmount = (req, res) => {

	orderService.todayOrderAmount().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.changeOrderStatus = (req, res) => {

	const orderData = {
		orderId: req.body.orderId,
		orderStatusId: req.body.orderStatusId
	}


	orderService.changeOrderStatus(orderData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.salesList = (req, res) => {


	orderService.salesList().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}





