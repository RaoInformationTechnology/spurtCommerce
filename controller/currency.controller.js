var currency = require('../models/currency.model');
var currencyService = require('../services/currency.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.currencyList = (req, res) => {
	currencyService.currencyList().then((response) => {
		return res.status(200).json({status:1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.addCurrency = (req, res) => {
	const body = req.body;
	const currencyData = {
		title : req.body.title,
		code : req.body.code,
		symbol_left : req.body.symbolLeft,
		symbol_right : req.body.symbolRight,
		value : req.body.value,
		is_active : req.body.status
	}
	currencyService.addCurrency(currencyData).then((response) => {
		return res.status(200).json({status:1, message: response.message});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.deleteCurrency = (req, res) => {

	const currencyid = req.params.id;
	currencyService.deleteCurrency(currencyid).then((response) => {
		return res.status(200).json({status:1, message: response.message});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.updateCurrency = (req, res) => {

	const currencyId = req.params.id;
	const currencyData = {
		title : req.body.title,
		code : req.body.code,
		symbol_left : req.body.symbolLeft,
		symbol_right : req.body.symbolRight,
		value : req.body.value,
		is_active : req.body.status,
		modified_date:new Date(),
	}
	currencyService.updateCurrency(currencyId,currencyData).then((response) => {
		return res.status(200).json({status:1, message: response.message});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}