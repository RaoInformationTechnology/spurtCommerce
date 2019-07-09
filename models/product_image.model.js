var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var product_image = new Schema({

	image:{
		type:String,
	},
	container_name:{
		type:String,
	},
	default_image:{
		type:Number,
	},
	sort_order:{
		type:String,
	},
	is_active:{
		type:Number,
	},
	created_by:{
		type:String,
		Default:null
	},
	modified_by:{
		type:String,
		Default:null
	},
	created_date : {
		type: Date,
		default: new Date()
	},
	modified_date:{
		type:Date,
		Default: new Date()
	},
});
module.exports = mongoose.model('product_image', product_image,'product_image');