var mongoose = require('mongoose');
var bcrypt = require('bcryptjs');
SALT_WORK_FACTOR = 10;

var user = new mongoose.Schema({

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
	user_group_id:{
		type:mongoose.Schema.Types.ObjectId,
		ref:'user_group'
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
		type: String
	},
	delete_flag: {
		type: String
	},
	last_login:{
		type:Date
	},
	newsletter:{
		type:String
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
	is_active:{
		type:String
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


user.pre('save', function (next) {
	var user = this;
	console.log("Im Model=====================>", user);
	bcrypt.genSalt(SALT_WORK_FACTOR, function (err, salt) {
		if (err) return next(err);
		bcrypt.hash(user.password, salt, function (err, hash) {
			if (err) return next(err);
			console.log(hash);
			user.password = hash;
			next();
		});
	});
});

user.methods.comparePassword = function (userPassword, password, cb) {
	console.log("userpassword", userPassword);
	console.log("password", password);
	bcrypt.compare(userPassword, password, function (err, isMatch) {
		if (err) return cb(err);
		cb(null, isMatch);
	});
};


module.exports = mongoose.model('user', user, 'users');