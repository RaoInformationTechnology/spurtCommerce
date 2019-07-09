var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var address = new Schema({

    customer_id:
    {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'customer'
    },
    address_1: {
        type: String,
    },
    address_2: {
        type: String,
    },
    city: {
        type: String,
    },
    state: {
        type: String,
    },
    postcode: {
        type: String
    },
    address_type: {
        type: Number,
    },
    is_active: {
        type: String,
    },
    created_by: {
        type: String,
        Default: null
    },
    modified_by: {
        type: String,
        Default: null
    },
    created_date: {
        type: Date,
        default: Date.now,
    },
    modified_date: {
        type: Date,
        default: Date.now,
    },

});

module.exports = mongoose.model('address', address, 'address');