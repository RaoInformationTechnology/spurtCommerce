var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var country = new Schema({

	name: String,
	iso_code_2:String,
	iso_code_3:String,
	address_format:String,
	postcode_required:Number,
	is_active:Number,
	created_date:{
		type:Date,
		default:Date.now()
	},
    modified_date:{
		type:Date,
		default:Date.now()
	},
    created_by:String,
    modified_by:String,
});
module.exports = mongoose.model('country', country,'country');