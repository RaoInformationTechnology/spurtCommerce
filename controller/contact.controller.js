var contact = require('../models/contact.model');
var contactService = require('../services/contact.service');
var emailService = require('../services/email.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.addResponse = (req, res) => {


	const contactData = {
		name: req.body.name,
		Email: req.body.email,
		phone_number: req.body.phoneNumber,
		message: req.body.message
	}

	const message = "Dear Mr.Admin,<br/><br/>\r\n                              <p style=\"margin-bottom:.5em; margin: 0 0 10px 0;text-indent: 50px\">"+ req.body.name+" try to contact you...! </p>\r\n";
	const subject = "ContactUs";

	emailService.contactMail(message,subject).then((response) => {

		contactService.addResponse(contactData).then((response) => {
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
