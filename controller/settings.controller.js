var settings = require('../models/settings.model');
var settingsService = require('../services/settings.service');
var imageService = require('../services/image.service');

// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.getSetting = (req, res) => {
	settingsService.settingsList().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.createSetting = (req, res) => {

	let settingData = {}

	if (req.body.countryId) settingData['country_id'] = req.body.countryId;
	if (req.body.storeAddress) settingData['store_address'] = req.body.storeAddress;
	if (req.body.storeCurrencyId) settingData['store_currency_id'] = req.body.storeCurrencyId;
	if (req.body.storeEmail) settingData['store_email'] = req.body.storeEmail;
	if (req.body.storeLanguageName) settingData['store_language_name'] = req.body.storeLanguageName;
	if (req.body.storeName) settingData['store_name'] = req.body.storeName;
	if (req.body.storeOwner) settingData['store_owner'] = req.body.storeOwner;
	if (req.body.storeTelephone) settingData['store_telephone'] = req.body.storeTelephone;
	if (req.body.zoneId) settingData['zone_id'] = req.body.zoneId;
	if (req.body.facebook) settingData['google'] = req.body.facebook;
	if (req.body.google) settingData['facebook'] = req.body.google;
	if (req.body.twitter) settingData['twitter'] = req.body.twitter;
	if (req.body.instagram) settingData['instagram'] = req.body.instagram;


	if (req.body.storeLogo) {

		const image = req.body.storeLogo;

		const path = 'storeLogo/';
		const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
		const type = image.split(';')[0].split('/')[1];
		const name = 'Img_' + Date.now() + '.' + type;
		imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {

			settingData['store_logo_path'] = path;
			settingData['store_logo'] = name;


			settingsService.createSetting(settingData).then((response) => {
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
	else {
		settingsService.createSetting(settingData).then((response) => {
			return res.status(200).json({ status: 1, message: response.message, data: response.data });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});
	}
}

