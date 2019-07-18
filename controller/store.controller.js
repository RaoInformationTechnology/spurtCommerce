var product = require('../models/product.model');
var storeService = require('../services/store.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.getProductList = (req, res) => {
	
	const productData = {
		limit:parseInt(req.query.limit),
		offset:parseInt( req.query.offset),
		keyword: req.query.keyword,
		sku: req.query.sku,
		count: req.query.count,
		manufacturerId: req.query.manufacturerId,
		categoryId: req.query.categoryId,
		price: req.query.price,
		priceFrom: req.query.priceFrom,
		priceTo: req.query.priceTo,
		condition:req.query.condition,
	}

	storeService.getProductList(productData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}
