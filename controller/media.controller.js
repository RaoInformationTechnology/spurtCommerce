var currency = require('../models/currency.model');
var imageService = require('../services/image.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');
const multer = require('multer');



const ObjectId = require('mongodb').ObjectId;


module.exports.imageResize = (req, res) => {

	//console.log("req",req);

	const imageData = {
		widthString: req.query.width,
		heightString: req.query.height,
		imgPath: req.query.path,
		imgName: req.query.name,
		ext: req.query.name.split('.'),
	}

	if (imageData.ext[1] === 'jpg' || imageData.ext[1] === 'jpeg' || imageData.ext[1] === 'png') {
		var val;
		imageService.imageResize(imageData).then((response) => {
			return res.send(response);
		}).catch((error) => {
			console.log(error);
		})
	}
}

module.exports.FileUpload = (req, res) => {
	const image = req.body.image;
	const path = req.body.path;
	const base64Data = new Buffer(image.replace(/^data:image\/\w+;base64,/, ''), 'base64');
	const type = image.split(';')[0].split('/')[1];
	const name = 'Img_' + Date.now() + '.' + type;
	imageService.imageUpload((path === '' ? name : path + name), base64Data).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}



module.exports.getBucketList = (req, res) => {

	const limit = req.body.limit;

	if (req.query.folderName) {
		console.log("In if condtion");
		const folderName = req.query.folderName;

		imageService.listFolders(limit, folderName).then((response) => {
			return res.status(200).json({ status: 1, message: response.message, data: response.data });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});
	}
	else {
		const folderName = "";
		imageService.listFolders(limit, folderName)
			.then((response) => {
				return res.status(200).json({ status: 1, message: response.message, data: response.data });
			})
			.catch((error) => {
				console.log('error: ', error);
				return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
			});
	}
}


module.exports.createFolder = (req, res) => {
	
	const folderName = req.body.folderName;

	imageService.createFolder(folderName).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});

}






