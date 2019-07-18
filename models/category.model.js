var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var category = new Schema({

    name: {
        type: String,
    },
    image: {
        type: String,
    },
    image_path: {
        type: String,
    },
    parent_int: {
        type: String
    },
    sort_order: {
        type: String,
    },
    meta_tag_title: {
        type: String,
    },
    meta_tag_description: {
        type: String,
    },
    meta_tag_keyword: {
        type: String,
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
    children: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'categoty'
        }],
});

module.exports = mongoose.model('category', category, 'category');