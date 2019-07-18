var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var loginLog = new Schema({
    customer_id: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'customer'
    },
    email_id: {
        type: String,
    },
    first_name: {
        type: String,
    },
    ip_address: {
        type: String,
    },
    created_date: {
        type: Date,
        default: Date.now()
    },
    modified_date: {
        type: Date,
        Default: Date.now()
    },
    created_by: {
        type: String,
        Default: null
    },
    modified_by: {
        type: String,
        Default: null
    }
});
module.exports = mongoose.model('loginLog', loginLog, 'login_log');