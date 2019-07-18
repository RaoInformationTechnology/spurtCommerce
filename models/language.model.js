var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var language = new Schema({
	name:{
        type:String,
    },
    code:{
        type:String,
    },
    image:{
        type:String,
    },
    image_path:{
        type:String,
    },
    locale:{
        type:String,
    },
    sort_order:{
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
module.exports = mongoose.model('language', language,'language');