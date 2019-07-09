var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var currency = new Schema({
	currency_id:{
		type:String,
	},
	title:{
		type:String,
	},
	code:{
		type:String,
	},
	symbol_left:{
		type:String,
	},
	symbol_right:{
		type:String,
	},
	decimal_place:{
		type:String,
	},
	value:{
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
module.exports = mongoose.model('currency', currency,'currency');