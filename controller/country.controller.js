var country = require('../models/country.model');
var countryService = require('../services/country.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.countryList = (req, res) => {
	countryService.countryList().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.addCountry = (req, res) => {

	const countryData = {
		iso_code_2: req.body.isoCode2,
		iso_code_3: req.body.isoCode3,
		name: req.body.name,
		postcode_required: parseInt(req.body.postcodeRequired),
	}
	countryService.addCountry(countryData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.deleteCountry = (req, res) => {

	const countryid = req.params.id;
	
	countryService.deleteCountry(countryid).then((response) => {
		return res.status(200).json({ status: 1, message: response.message });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.updateCountry = (req, res) => {

	const bannerid = req.params.id;

	const countryData = {
		iso_code_2: req.body.isoCode2,
		iso_code_3: req.body.isoCode3,
		name: req.body.name,
		postcode_required: parseInt(req.body.postcodeRequired),
	}
	
	countryService.updateCountry(bannerid, countryData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}