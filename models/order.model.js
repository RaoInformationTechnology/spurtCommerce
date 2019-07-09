var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var order = new Schema({

	customer_id: {
		type: mongoose.Schema.Types.ObjectId,
		ref: 'customer'
	},
	orderId:{
		type:String
	},
	currency_id: {
		type: String
	},
	shipping_zone_id: {
		type: String
	},
	payment_zone_id: {
		type: String
	},
	shipping_country_id: {
		type: String
	},
	payment_country_id: {
		type: String
	},
	invoice_no: {
		type: String
	},
	invoice_prefix: {
		type: String
	},
	firstname: {
		type: String
	},
	lastname: {
		type: String
	},
	email: {
		type: String
	},
	telephone: {
		type: String
	},
	fax: {
		type: String
	},
	shipping_firstname: {
		type: String
	},
	shipping_lastname: {
		type: String
	},
	shipping_company: {
		type: String
	},
	shipping_address_1: {
		type: String
	},
	shipping_address_2: {
		type: String
	},
	shipping_city: {
		type: String
	},
	shipping_postcode: {
		type: String
	},
	shipping_country: {
		type: String
	},
	shipping_zone: {
		type: String
	},
	shipping_address_format: {
		type: String
	},
	shipping_method: {
		type: String
	},
	payment_firstname: {
		type: String
	},
	payment_lastname: {
		type: String
	},
	payment_company: {
		type: String
	},
	payment_address_1: {
		type: String
	},
	payment_address_2: {
		type: String
	},
	payment_city: {
		type: String
	},
	payment_postcode: {
		type: String
	},
	payment_country: {
		type: String
	},
	payment_zone: {
		type: String
	},
	payment_address_format: {
		type: String
	},
	payment_method: {
		type: String
	},
	comment: {
		type: String
	},
	total: {
		type: Number
	},
	reward: {
		type: String
	},
	order_status_id: {
		type: mongoose.Schema.Types.ObjectId,
		ref: 'order_status'
	},
	affiliate_id: {
		type: String
	},
	commision: {
		type: String
	},
	currency_code: {
		type: String
	},
	currency_value: {
		type: String
	},
	ip: {
		type: String
	},
	payment_flag: {
		type: String
	},
	order_name: {
		type: String
	},
	is_active: {
		Default:'1',
		type: String
	},
	created_date: {
        type: Date,
        default: new Date()
    },
    modified_date: {
        type: Date,
        Default: new Date()
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
module.exports = mongoose.model('order', order, 'order'); 