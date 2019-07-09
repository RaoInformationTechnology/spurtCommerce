var user = require('../models/user.model');
var authService = require('../services/auth.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');

// Static variables
const ObjectId = require('mongodb').ObjectId;

module.exports.login = (req, res) => {
	const customerData = {
		username: req.body.username,
		password: req.body.password,
	}
	console.log("customer Data", customerData);
	authService.login(customerData).then((response) => {
		return res.status(200).json({ message: response.message, data: response.data, status: 1 });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.userList = (req, res) => {

	const userData = {
		limit: 10,
		offset: req.query.offset,
		keyword: req.query.keyword,
		sku: req.query.sku,
		count: req.query.count
	}
	authService.userList(userData).then((response) => {
		return res.status(200).json({ message: response.message, data: response.data, status: 1 });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.changePassword = (req, res) => {

	const authorization = req.header('authorization');
	authService.getProfile(authorization).then((response) => {



		const userData = {
			newPassword: req.body.newPassword,
			oldPassword: req.body.oldPassword,
		}

		let userId = response.data._id;

		authService.changePassword(userId, userData).then((response) => {
			return res.status(200).json({ message: response.message, status: 1 });
		}).catch((error) => {
			console.log('error: ', error);
			return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
		});


	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});

}

module.exports.createRole = (req, res) => {

	const roleData = {
		name: req.body.name,
		is_active: parseInt(req.body.status)
	}

	authService.createRole(roleData).then((response) => {
		return res.status(200).json({ message: response.message, data: response.data, status: 1 });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.updateRole = (req, res) => {

	const roleId = req.params.id;


	const roleData = {
		name: req.body.name,
		is_active: parseInt(req.body.status)
	}

	authService.updateRole(roleId, roleData).then((response) => {
		return res.status(200).json({ message: response.message, data: response.data, status: 1 });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.roleList = (req, res) => {

	const userData = {
		limit: 10,
		offset: req.query.offset,
		keyword: req.query.keyword,
		sku: req.query.sku,
		count: req.query.count
	}
	authService.roleList(userData).then((response) => {
		return res.status(200).json({ message: response.message, data: response.data, status: 1 });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.createUser = (req, res) => {

	const userData = {

		email: req.body.email,
		first_name: req.body.firstName,
		last_name: req.body.lastName,
		password: req.body.password,
		user_group_id: req.body.userGroupId,
		username: req.body.username
	}


	user.findOne({ email: req.body.email }, (error, customer) => {

		if (customer == null) {

			authService.createUser(userData).then((response) => {
				return res.status(200).json({ message: response.message, data: response.data, status: 1 });
			}).catch((error) => {
				console.log('error: ', error);
				return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
			});
		}
		else if (error) {
			const successResponse = {
				status: 1,
				message: 'Internal server Error',
			};
			return res.status(500).send(successResponse);
		}
		else {
			const successResponse = {
				status: 1,
				message: 'user already registered.',
			};
			return res.status(400).send(successResponse);

		}

	})

}










