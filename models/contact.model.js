var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var contact = new Schema({
	name:{
		type:String,
	},
	email:{
		type:String,
	},
	phone_number:{
		type:String,
	},
	message:{
		type:String,
	},
	is_active:{
		type:String,
	},
	created_date : {
		type: Date,
		default: Date.now()
	},
	modified_date:{
		type:Date,
		Default:Date.now()
	},
	created_by:{
		type:String,
		Default:null
	},
	modified_by:{
		type:String,
		Default:null
	}
});
module.exports = mongoose.model('contact', contact,'contact');