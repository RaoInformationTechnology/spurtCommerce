var manufacture = require('../models/manufacture.model');
var manufactureService = require('../services/manufacture.service');
var mediaController = require('../controller/media.controller');
var imageService = require('../services/image.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');

// Static variables
const ObjectId = require('mongodb').ObjectId;

module.exports.getManufacture = (req, res) => {

	const brandData = {
		limit: req.query.limit ? parseInt(req.query.limit) : 0,
		offset: req.query.offset ? parseInt(req.query.offset) : 0,
		keyword: req.query.keyword,
		sku: req.query.sku,
		count: req.query.count
	}
	manufactureService.manufactureList(brandData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.updateManufacturer = (req, res) => {
	const path = 'manufacturer/';

	const image = req.body.image;
	if (image) {
		const path = 'manufacturer/';
		const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
		const type = image.split(';')[0].split('/')[1];
		const name = 'Img_' + Date.now() + '.' + type;
		imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {

			const brandData = {
				name: req.body.name,
				sort_order: parseInt(req.body.sortOrder),
				is_active: req.body.status,
				image_path: path,
				image: name,
				manufacturer_id: req.body.manufacturerId
			}

			manufactureService.updateManufacturer(brandData).then((response) => {
				return res.status(200).json({ status: 1, message: response.message });
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
		const brandData = {
			name: req.body.name,
			sort_order: req.body.sortOrder,
			is_active: req.body.status,
			manufacturer_id: req.body.manufacturerId
		}

		manufactureService.updateManufacturer(brandData).then((response) => {
			return res.status(200).json({ status: 1, message: response.message });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});

	}
}

module.exports.addManufacturer = (req, res) => {
	const path = 'manufacturer/';

	const image = req.body.image;
	if (image) {
		const path = 'manufacturer/';
		const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
		const type = image.split(';')[0].split('/')[1];
		const name = 'Img_' + Date.now() + '.' + type;
		imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {

			const brandData = {
				name: req.body.name,
				sort_order: parseInt(req.body.sortOrder),
				is_active: req.body.status,
				image_path: path,
				image: name
			}

			manufactureService.addManufacturer(brandData).then((response) => {
				return res.status(200).json({ status: 1, message: response.message });
			}).catch((error) => {
				console.log('error: ', error);
				return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
			});

		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});

	}
}

module.exports.deleteManufacturer = (req, res) => {

	manufacturerId = req.body.manufacturerId;

	manufactureService.deleteManufacturer(manufacturerId).then((response) => {

		return res.status(200).json({ status: 1, message: response.message });

	}).catch((error) => {

		console.log('error: ', error);

		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}








