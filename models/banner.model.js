var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var banner = new Schema({
	title:{
		type:String,
	},
	sort_order:{
		type:String,
	},
	url:{
		type:String
	},
	banner_group_id:{
		type:String
	},
	container_name:{
		type:String
	},
	view_page_count:{
		type:String
	},
	banner_group_banner_group_id:{
		type:String
	},
	link:{
		type:String
	},
	image:{
		type:String
	},
	image_path:{
		type:String
	},
	content:{
		type:String
	},
	position:{
		type:String
	},
	is_active:String,
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
module.exports = mongoose.model('banner', banner,'banner');