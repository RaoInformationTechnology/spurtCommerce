var zone = require('../models/zone.model');
var zoneService = require('../services/zone.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;


module.exports.zoneList = (req, res) => {
	zoneService.zoneList().then((response) => {
		return res.status(200).json({status:1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.addZone = (req, res) => {
	const zoneData = {
		country_id:req.body.countryId,
		code:req.body.code,
		name:req.body.name,
		is_active:req.body.status
	}
	console.log("zone Data",zoneData);
	zoneService.addZone(zoneData).then((response) => {
		return res.status(200).json({status:1, message: response.message});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.deleteZone = (req, res) => {

	const zoneId = req.params.id;
	zoneService.deleteZone(zoneId).then((response) => {
		return res.status(200).json({status:1, message: response.message});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.updateZone = (req, res) => {

	const zoneId = req.params.id;
	const zoneData = {
		country_id:req.body.countryId,
		code:req.body.code,
		name:req.body.name,
		is_active:req.body.status
	}
	zoneService.updateZone(zoneId,zoneData).then((response) => {
		return res.status(200).json({status:1, message: response.message});
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}



