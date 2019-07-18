var mongoose = require('mongoose');
var bcrypt = require('bcryptjs');
SALT_WORK_FACTOR = 10;

var customer = new mongoose.Schema({

	first_name: {
		type: String
	},
	last_name: {
		type: String
	},
	username: {
		type: String
	},
	email: {
		type: String
	},
	password: {
		type: String
	},
	mobile: {
		type: String
	},
	address: {
		type: String
	},
	country_id: {
		type: mongoose.Schema.Types.ObjectId,
		ref: 'country'
	},
	city: {
		type: String
	},
	pincode: {
		type: Number
	},
	avatar: {
		type: String
	},
	avatar_path: {
		type: String
	},
	mail_status: {
		type:Number
	},
	delete_flag: {
		type: String
	},
	last_login:{
		type:Date
	},
	newsletter:{
		type:Number
	},
	safe:{
		type:String
	},
	ip:{
		type:String
	},
	zone_id:{
		type:mongoose.Schema.Types.ObjectId,
		ref:'zone'
	},
	isActive:{
		type:Number
	},
	created_by:{
		type:String,
		default:null
	},
	modified_by:{
		type:String,
		default:null
	},
	created_date:{
		type:Date,
		default:Date.now()
	},
	modified_date:{
		type:Date,
		default:Date.now()
	}
});


customer.pre('save', function (next) {
	var customer = this;
	console.log("Im Model=====================>", customer);
	bcrypt.genSalt(SALT_WORK_FACTOR, function (err, salt) {
		if (err) return next(err);
		bcrypt.hash(customer.password, salt, function (err, hash) {
			if (err) return next(err);
			console.log(hash);
			customer.password = hash;
			next();
		});
	});
});

customer.methods.comparePassword = function (userPassword, password, cb) {
	console.log("userpassword", userPassword);
	console.log("password", password);
	bcrypt.compare(userPassword, password, function (err, isMatch) {
		if (err) return cb(err);
		cb(null, isMatch);
	});
};


module.exports = mongoose.model('customer', customer, 'customer');