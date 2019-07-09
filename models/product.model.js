var mongoose = require('mongoose');

var product = new mongoose.Schema({
    sku:{
        type:String
    },
    upc:{
        type:String
    },
    quantity:{
        type:Number
    },
    stock_status_id:{
        type:Number
    },
    image :{
        type:String
    },
    image_path :{
        type:String
    },
    manufacturer_id :{
        type:String
    },
    shipping :{
        type:String
    },
    price :{
        type:Number
    },
    date_available :{
        type:String
    },
    sort_order :{
        type:String
    },
    name :{
        type:String
    },
    description :{
        type:String
    },
    amount :{
        type:String
    },
    meta_tag_title :{
        type:String
    },
    meta_tag_description :{
        type:String
    },
    meta_tag_keyword :{
        type:String
    },
    discount :{
        type:String
    },
    subtract_stock :{
        type:String
    },
    minimum_quantity :{
        type:String
    },
    location :{
        type:String
    },
    wishlist_status :{
        type:String
    },
    delete_flag :{
        type:String
    },
    is_featured:{
        type:Number
    },
    isFeatured:{
        type:Number
    },
    rating :{   
        type:String
    },
    condition :{ 
        type:String
    },
    is_active :{
        type:Number
    },
    Images : [
    { type: mongoose.Schema.Types.ObjectId, 
        ref: 'product_image'
    }],
     Category : [
    { type: mongoose.Schema.Types.ObjectId, 
        ref: 'categoty'
    }],
    createdDate :{
        type:Date,
        default:Date.now()
    },
    dateAvailable :{
        type:String
    },
    deleteFlag:{
        type:Number
    },
    isActive:{
        type:Number
    },
    manufacturerId:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'manufacturer'
    },
    metaTagTitle:{
        type:String
    },
    minimumQuantity :{
        type:String
    },
    modifiedDate :{
        type:Date,
        default:Date.now()
    },
    sortOrder :{
        type:String
    },
    stockStatusId:{
        type:String
    },
    subtractStock:{
        type:Number
    },
    wishListStatus :{
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
        default:Date.now()
    },
    modified_date :{
        type:Date,
        default:Date.now()
    }
});

module.exports = mongoose.model('product', product,'product');