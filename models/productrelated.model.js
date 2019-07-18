var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var product_related = new Schema({
	related_id:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'product'
    },
    product_id:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'product'
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
module.exports = mongoose.model('product_related', product_related,'product_related');