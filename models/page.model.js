var mongoose = require('mongoose');

var page = new mongoose.Schema({

    title:String,
    intro:String,
    full_text :String,
    page_group_id :String,
    sort_order :String,
    meta_tag_title :String,
    meta_tag_description :String,
    meta_tag_keywords :String,
    view_page_count :String,
    is_active :String,
    created_by :String,
    modified_by :String,
    created_date : {
    	type: Date,
    	default: Date.now()
    },
    modified_date :Date
});

module.exports = mongoose.model('page', page,'page');