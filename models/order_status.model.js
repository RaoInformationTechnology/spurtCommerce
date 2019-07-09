var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var order_status = new Schema({
    
    name:{
        type:String
    },
    color_code:{
        type:String
    },
    is_active :{
        type:String,
    },
    created_by :{
        type:String,
        Default:null
    },
    modified_by :{
        type:String,
        Default:null
    },
    created_date :{
        type: Date,
        default: Date.now,
    },
    modified_date:{
        type: Date,
        default: Date.now,
    }
});

module.exports = mongoose.model('order_status', order_status,'order_status');