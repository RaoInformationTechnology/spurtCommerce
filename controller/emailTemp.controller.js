var emailTemp = require('../models/emailtemp.model');
var emailTempService = require('../services/emailTemp.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;


module.exports.emailTemplateList = (req, res) => {
	emailTempData = {
		limit:parseInt(req.body.limit),
		keyword:req.body.keyword
	}
	console.log("emaildata",emailTempData);
	emailTempService.emailTemplateList(emailTempData).then((response) => {
		return res.status(200).json({status:1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.updateEmailTemplate = (req, res) => {

	const emailTempId = req.params.id;

	const emailTempData = {
		is_active: parseInt(req.body.status),
		message:req.body.content,
		subject:req.body.subject,
		shortname:req.body.title,

	}

	emailTempService.updateEmailTemplate(emailTempId,emailTempData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.deleteEmailTemplate = (req, res) => {

	const emailTempId = req.params.id;

	emailTempService.deleteEmailTemplate(emailTempId).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


