var mongoose = require('mongoose');

var manufacturer = new mongoose.Schema({

    name :{
    	type:String
    },
    image :{
    	type:String
    },
    image_path :{
    	type:String
    },
    sort_order :{
    	type:Number
    },
    is_active :{
    	type:Number
    },
    created_by :{
    	type:String,
    	default:null
    },
    modified_by :{
    	type:String,
    	default:null
    },
    created_date :{
    	type:Date,
    	default:new Date()
    },
    modified_date :{
    	type:Date,
    	default:new Date()
    }
});

module.exports = mongoose.model('manufacturer', manufacturer,'manufacturer');