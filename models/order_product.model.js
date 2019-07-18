var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var order_product = new Schema({
	order_product_id:{
		type:String,
	},
	product_id:{
		type: mongoose.Schema.Types.ObjectId,
		ref: 'product'
	},
	order_id:{
		type: mongoose.Schema.Types.ObjectId,
		ref: 'order'
	},
	name:{
		type:String
	},
	model:{
		type:String
	},
	quantity:{
		type:String
	},
	trace:{
		type:String
	},
	total:{
		type:String
	},
	tax:{
		type:String
	},
	image_path:{
		type:String
	},
	is_active:{
		type:String
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
module.exports = mongoose.model('order_product', order_product,'order_product'); 