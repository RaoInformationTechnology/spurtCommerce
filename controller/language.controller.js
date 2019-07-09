var settings = require('../models/settings.model');
var settingsService = require('../services/settings.service');
var languageService = require('../services/language.service');
var imageService = require('../services/image.service');


// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.languageList = (req, res) => {
	languageService.languageList().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.addLanguage = (req, res) => {


	image = req.body.image;

	const path = 'language/';
	const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
	const type = image.split(';')[0].split('/')[1];
	const name = 'Img_' + Date.now() + '.' + type;
	imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {

		const languageData = {
			code: req.body.code,
			name: req.body.name,
			sort_order: parseInt(req.body.sortOrder),
			is_active: parseInt(req.body.status),
			image_path: path,
			image: name
		}

		languageService.addLanguage(languageData).then((response) => {
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

module.exports.deleteLanguage = (req, res) => {
	const languageId = req.params.id;

	languageService.deleteLanguage(languageId).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.updateLanguage = (req, res) => {

	languageId = req.params.id;

	image = req.body.image;

	if (image) {

		const path = 'language/';
		const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
		const type = image.split(';')[0].split('/')[1];
		const name = 'Img_' + Date.now() + '.' + type;
		imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {

			const languageData = {
				code: req.body.code,
				name: req.body.name,
				sort_order: parseInt(req.body.sortOrder),
				is_active: parseInt(req.body.status),
				image_path: path,
				image: name
			}

			languageService.updateLanguage(languageId,languageData).then((response) => {
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

		const languageData = {
			code: req.body.code,
			name: req.body.name,
			sort_order: parseInt(req.body.sortOrder),
			is_active: parseInt(req.body.status),
		}

		languageService.updateLanguage(languageId,languageData).then((response) => {
			return res.status(200).json({ status: 1, message: response.message, data: response.data });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});

	}

}





