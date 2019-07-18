var banner = require('../models/banner.model');
var bannerService = require('../services/banner.service');
var imageService = require('../services/image.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.bannerList = (req, res) => {
	bannerService.bannerList().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.deleteBanner = (req, res) => {

	const bannerid = req.params.id;
	bannerService.deleteBanner(bannerid).then((response) => {
		return res.status(200).json({ status: 1, message: response.message });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.updateBanner = (req, res) => {

	const image = req.body.image;
	if (image) {
		const path = 'banner/';
		const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
		const type = image.split(';')[0].split('/')[1];
		const name = 'Img_' + Date.now() + '.' + type;
		imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {

			const bannerid = req.params.id;
			const bannerData = {
				image_path: 'banner/',
				title: req.body.title,
				content: req.body.content,
				link: req.body.link,
				position: req.body.position,
				image: name,
			}
			bannerService.updateBanner(bannerid, bannerData).then((response) => {
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
		const bannerid = req.params.id;

		const bannerData = {
			title: req.body.title,
			content: req.body.content,
			link: req.body.link,
			position: req.body.position,
		}

		bannerService.updateBanner(bannerid, bannerData).then((response) => {
			return res.status(200).json({ status: 1, message: response.message });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});
	}
}


module.exports.addBanner = (req, res) => {

	const image = req.body.image;
	if (image) {
		const path = 'banner/';
		const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
		const type = image.split(';')[0].split('/')[1];
		const name = 'Img_' + Date.now() + '.' + type;
		imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {

			const bannerid = req.params.id;
			const bannerData = {
				image_path: 'banner/',
				title: req.body.title,
				content: req.body.content,
				link: req.body.link,
				position: req.body.position,
				image: name,
			}
			bannerService.addBanner(bannerData).then((response) => {
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
		const bannerData = {
			title: req.body.title,
			content: req.body.content,
			link: req.body.link,
			position: req.body.position,
		}
		
		bannerService.addBanner(bannerData).then((response) => {
			return res.status(200).json({ status: 1, message: response.message });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});
	}
}
