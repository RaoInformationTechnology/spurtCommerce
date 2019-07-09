var orderStatus = require('../models/order_status.model');
var orderStatusService = require('../services/orderstatus.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.orderStatusList = (req, res) => {
	orderStatusService.orderStatusList().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.orderStatusById = (req, res) => {
	const orderStatusId = req.params.id;

	orderStatusService.orderStatusById(orderStatusId).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.addOrderStatus = (req, res) => {

	const orderStatusData = {

		color_code: req.body.colorCode,
		name: req.body.name,
		is_active: parseInt(req.body.status)

	}

	orderStatusService.addOrderStatus(orderStatusData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.updateOrderStatus = (req, res) => {

	const orderStatusId = req.params.id;

	const orderStatusData = {
		color_code: req.body.colorCode,
		name: req.body.name,
		is_active: parseInt(req.body.status)

	}

	orderStatusService.updateOrderStatus(orderStatusId,orderStatusData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.deleteOrderStatus = (req, res) => {
	const orderStatusId = req.params.id;

	orderStatusService.deleteOrderStatus(orderStatusId).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}






