var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var email_template = new Schema({
	
	shortname:{
		type:String,
	},
	subject:{
		type:String,
	},
	message:{
		type:String,
	},
	is_active:{
		type:Number,
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
module.exports = mongoose.model('email_template', email_template,'email_template');