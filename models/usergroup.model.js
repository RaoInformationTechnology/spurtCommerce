var mongoose = require('mongoose');


var usergroup = new mongoose.Schema({

	name:{
        type:String
    },
    slug:{
        type:String
    },
	is_active:{
		type:Number
	},
	created_by:{
		type:String,
		default:null
	},
	modified_by:{
		type:String,
		default:null
	},
	created_date:{
		type:Date,
		default:Date.now()
	},
	modified_date:{
		type:Date,
		default:Date.now()
	}
});

module.exports = mongoose.model('usergroup',usergroup, 'user_group');

