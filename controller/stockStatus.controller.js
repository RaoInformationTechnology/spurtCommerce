var stockStatus = require('../models/stock-status.model');
var stockStatusService = require('../services/stockStatus.service');


// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.stockList = (req, res) => {
    stockStatusService.stockList().then((response) => {
        return res.status(200).json({ status: 1, message: response.message, data: response.data });
    }).catch((error) => {
        console.log('error: ', error);
        return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
    });
}


module.exports.updateStockStatus = (req, res) => {

    const stockId = req.params.id;
    const stockData = {
        name: req.body.name,
        is_active: parseInt(req.body.status),
        modified_date: new Date(),
    }

    console.log("Stockid",stockId);

    console.log("stockData",stockData);

    stockStatusService.updateStockStatus(stockId, stockData).then((response) => {
        return res.status(200).json({ status: 1, message: response.message });
    }).catch((error) => {
        console.log('error: ', error);
        return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
    });
}

module.exports.addStockStatus = (req, res) => {

    const stockData = {
        name: req.body.name,
        is_active: parseInt(req.body.status)
    }
    stockStatusService.addStockStatus(stockData).then((response) => {
        return res.status(200).json({ status: 1, message: response.message });
    }).catch((error) => {
        console.log('error: ', error);
        return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
    });
}


module.exports.deleteStockStatus = (req, res) => {

    const stockId = req.params.id;
    
	stockStatusService.deleteStockStatus(stockId).then((response) => {
		return res.status(200).json({status:1, message: response.message});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}



