var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var stockStatus = new Schema({
	name:{
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
module.exports = mongoose.model('stockStatus', stockStatus,'stock_status');