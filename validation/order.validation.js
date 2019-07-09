const Joi = require('joi');


module.exports.orderCheckout = (req, res, next) => {
    const schema = Joi.object().keys({

        shippingAddress_1: Joi.string().required(),
        phoneNumber: Joi.number().required(),
        shippingAddress_2: Joi.string().required(),
        shippingCity: Joi.string().required(),
        shippingCountry: Joi.string().required(),
        shippingFirstName: Joi.string().required(),
        shippingLastName: Joi.string().required(),
        shippingPostCode: Joi.number().required(),
        shippingZone: Joi.string().required(),
        shippingCompany: Joi.string(),
        shippingAddressFormat: Joi.any(),
        productDetails: Joi.array().required(),
        emailId: Joi.string().required(),
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



