const Joi = require('joi');

module.exports.addProduct = (req, res, next) => {
    const schema = Joi.object().keys({

        price: Joi.number().required(),
        productName: Joi.string().required(),
        sku: Joi.string().required(),
        productDescription: Joi.string(),
        model: Joi.string().trim().required(),
        quantity: Joi.number().required(),
        minimumQuantity: Joi.number(),
        status: Joi.number().required(),
        condition: Joi.string().required(),
        outOfStockStatus: Joi.string().required(),
        categoryId: Joi.required(),
        relatedProductId: Joi.array().required(),
        requiredShipping: Joi.string(),
        location: Joi.string(),
        upc: Joi.string().required(),
        image: Joi.array().required(),
        metaTagTitle: Joi.string().required(),
        subtractStock: Joi.number().required(),
        dateAvailable: Joi.date(),
        sortOrder: Joi.string(),
    });

    Joi.validate(
        req.body,
        schema,
        { convert: true },
        (err, value) => {
            if (err) {
                return res.status(400).json({
                    message: err.details[0] && err.details[0].message ? err.details[0].message : 'Bad request'
                });
            } else {
                next();
            }
        }
    );
};

module.exports.updateProduct = (req, res, next) => {

    const schema = Joi.object().keys({
        productId: Joi.required(),
        price: Joi.number().required(),
        productName: Joi.string().required(),
        sku: Joi.string().required(),
        productDescription: Joi.string(),
        model: Joi.string().trim().required(),
        quantity: Joi.number().required(),
        minimumQuantity: Joi.number(),
        status: Joi.number().required(),
        condition: Joi.string().required(),
        outOfStockStatus: Joi.string().required(),
        categoryId: Joi.required(),
        relatedProductId: Joi.array().required(),
        requiredShipping: Joi.string(),
        location: Joi.string(),
        upc: Joi.string(),
        image: Joi.array().required(),
        metaTagTitle: Joi.string(),
        subtractStock: Joi.number().required(),
        dateAvailable: Joi.date(),
        sortOrder: Joi.string(),
    });

    Joi.validate(
        req.body,
        schema,
        { convert: true },
        (err, value) => {
            if (err) {
                return res.status(400).json({
                    message: err.details[0] && err.details[0].message ? err.details[0].message : 'Bad request'
                });
            } else {
                next();
            }
        }
    );
};