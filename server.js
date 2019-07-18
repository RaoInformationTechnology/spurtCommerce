var exp = require('express');
var path = require('path');
var mongoose = require('mongoose');


//Define Controllers Here

var customerController = require('./controller/customer.controller');
var countryController = require('./controller/country.controller');
var manufactureController = require('./controller/manufacture.controller');
var pageController = require('./controller/page.controller');
var productController = require('./controller/product.controller');
var bannerController = require('./controller/banner.controller');
var categoryController = require('./controller/category.controller');
var contactController = require('./controller/contact.controller');
var currencyController = require('./controller/currency.controller');
var mediaController = require('./controller/media.controller');
var settingController = require('./controller/settings.controller');
var zoneController = require('./controller/zone.controller');
var emailTempController = require('./controller/emailTemp.controller');
var orderStatusController = require('./controller/orderStatus.controller');
var orderController = require('./controller/order.controller');
var authController = require('./controller/auth.controller');
var storeController = require('./controller/store.controller');
var languageController = require('./controller/language.controller');
var wishListController = require('./controller/customerwishlist.controller');
var stockStatusController = require('./controller/stockStatus.controller');



//Define Validation Here

var productValidation = require('./validation/product.validation');
var customerValidation = require('./validation/customer.validation');
var orderValidation = require('./validation/order.validation');

// Mongodb Connection Here

var cors = require('cors');

var bodyParser = require('body-parser');
var app = exp();
var http = require('http');
const port = 9000;
var server = app.listen(port);

mongoose.connect('mongodb://localhost:27017/spurtcommerce', { useNewUrlParser: true })
    .then(() => console.log("CONNECTED"))
    .catch(err => console.log(err));

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());



app.get('/api/list/productlist', storeController.getProductList);

//Routes for country API
app.post('/api/country/add-country', countryController.addCountry);
app.get('/api/country/countrylist', countryController.countryList);
app.get('/api/list/country-list', countryController.countryList);
app.put('/api/country/update-country/:id', countryController.updateCountry);
app.delete('/api/country/delete-country/:id', countryController.deleteCountry);

//Routes for Store API




//Routes for Banner API
app.get('/api/list/banner-list', bannerController.bannerList);
app.post('/api/banner/add-banner', bannerController.addBanner);
app.delete('/api/banner/delete-banner/:id', bannerController.deleteBanner);
app.put('/api/banner/update-banner/:id', bannerController.updateBanner);
app.get('/api/banner/bannerList', bannerController.bannerList);

//Routes for Category API


app.delete('/api/delete-category/:id', categoryController.deleteCategory);
app.post('/api/add-category', categoryController.addCategory);
app.put('/api/update-category/:id', categoryController.updateCategory);
app.post('/api/customer/login', customerController.login);

//Routes for ContactUs API

app.post('/api/list/contact-us', contactController.addResponse);

//Routes for currency API

app.get('/api/currency/currencylist', currencyController.currencyList);
app.post('/api/currency/add-currency', currencyController.addCurrency);
app.put('/api/currency/update-currency/:id', currencyController.updateCurrency);
app.delete('/api/currency/delete-currency/:id', currencyController.deleteCurrency);


//Routes for Settings API

app.get('/api/settings/get-settings', settingController.getSetting);

//Routes for Zone API

app.post('/api/zone/add-zone', zoneController.addZone);
app.put('/api/zone/update-zone/:id', zoneController.updateZone);
app.delete('/api/zone/delete-zone/:id', zoneController.deleteZone);
app.get('/api/zone/zone-list', zoneController.zoneList);
app.get('/api/list/zone-list', zoneController.zoneList);

//Routes for Product API


app.get('/api/product/productlist', productController.productList);
app.delete('/api/product/delete-product/:id', productController.deleteProduct);

//Routes for Order API

app.get('/api/order/orderlist', orderController.orderList);
app.get('/api/order/order-detail', orderController.orderDetail);
app.get('/api/order/total-order-amount', orderController.totalAmount);

//Routes for AdminSide API
app.post('/api/auth/login', authController.login);


app.get('/api/customer/customerlist', customerController.customerList);
app.get('/api/product/product-detail/:id', productController.productDetail);
app.get('/api/product/top-selling-productlist', productController.topSellingProduct);
app.get('/api/customer/get-profile', customerController.getProfile);

app.get('/api/orders/order-list', orderController.myOrderList);
app.get('/api/orders/order-detail', orderController.orderDetail);

app.get('/api/product-store/featureproduct-list', productController.getfeatureproduct);

//Routes for Manufacturer API

app.get('/api/manufacturer/manufacturerlist', manufactureController.getManufacture);
app.get('/api/manufacturers/manufacturerlist', manufactureController.getManufacture);
app.put('/api/manufacturer/update-manufacturer/:id', manufactureController.updateManufacturer);
app.post('/api/manufacturer/create-manufacturer', manufactureController.addManufacturer);
app.delete('/api/manufacturer/delete-manufacturer/:id', manufactureController.deleteManufacturer);


app.put('/api/CustomerAddress/update-address/:id', customerController.updateAddress);

app.put('/api/product-store/update-featureproduct/:id', productController.updateFeatureProduct);


//Routes for Customer API

app.delete('/api/customer/delete-customer/:id', customerController.deleteCustomer);

app.get('/api/auth/userlist', authController.userList);
app.get('/api/role/rolelist', authController.roleList);
app.get('/api/customer/customer-details/:id', customerController.customerDetails);
app.get('/api/customer/login-log-list', customerController.loginLogList);
app.post('/api/address/add-address', customerController.addAddress);
app.get('/api/address/get-address-list/:id', customerController.addressList);
app.put('/api/address/update-address/:id', customerController.updateAddressById);
app.delete('/api/address/delete-address/:id', customerController.deleteAddress);



//Routes for WishList API

app.post('/api/customer/add-product-to-wishlist', wishListController.addProductToWishList);
app.get('/api/customer/wishlist-product-list', wishListController.getWishList);
app.delete('/api/customer/wishlist-product-delete/:id', wishListController.removeProductFromWishList);
app.get('/api/customer/recent-customerlist', customerController.customerList);

app.get('/api/product/recent-selling-product', orderController.recentSellingProduct);
app.get('/api/order/today-order-count', orderController.todayOrderCount);
app.get('/api/order/today-order-amount', orderController.todayOrderAmount);


app.post('/api/order/order-change-status', orderController.changeOrderStatus);
app.get('/api/order/saleslist', orderController.salesList);
app.post('/api/customer/change-password', customerController.changePassword);
app.post('/api/auth/change-password', authController.changePassword);


app.get('/api/categorylist', categoryController.categoryByList);
app.get('/api/list/category-list', categoryController.categoryList);
app.get('/api/list/related-product-list', productController.getRelatedProduct);

//Routes for Pages API

app.get('/api/page/pagelist', pageController.pageList);
app.put('/api/page/update-page/:id', pageController.updatePageDetail);
app.post('/api/page/add-page', pageController.addNewPage);
app.delete('/api/page/delete-page/:id', pageController.deletePage);
app.get('/api/pages/pagelist', pageController.pageList);

//Routes for Media API

app.get('/api/media/image-resize', mediaController.imageResize);
app.get('/api/product-store/productdetail/:id', productController.productDetail);
app.post('/api/media/upload-file', mediaController.FileUpload);
app.post('/api/media/create-folder', mediaController.createFolder);
app.get('/api/media/bucket-object-list', mediaController.getBucketList);


//Routes for Role API

app.post('/api/role/create-role', authController.createRole);
app.put('/api/role/update-role/:id', authController.updateRole);
app.post('/api/auth/create-user', authController.createUser);

//Routes for Stock Status API

app.get('/api/stock-status/stock-status-list', stockStatusController.stockList);
app.put('/api/stock-status/update-stock-status/:id', stockStatusController.updateStockStatus);
app.post('/api/stock-status/create-stock-status', stockStatusController.addStockStatus);
app.delete('/api/stock-status/delete-stock-status/:id', stockStatusController.deleteStockStatus);

//Routes for Order Status API

app.post('/api/order-status/create-order-status', orderStatusController.addOrderStatus);
app.get('/api/order/order-status', orderStatusController.orderStatusList);
app.get('/api/order/order-status/:id', orderStatusController.orderStatusById);
app.get('/api/order-status/order-status-list', orderStatusController.orderStatusList);
app.put('/api/order-status/update-order-status/:id', orderStatusController.updateOrderStatus);
app.delete('/api/order-status/delete-order-status/:id', orderStatusController.deleteOrderStatus);

//Routes for EmailTemplate API

app.get('/api/email-template/email-templatelist', emailTempController.emailTemplateList);
app.put('/api/email-template/update-email-template/:id', emailTempController.updateEmailTemplate);
app.delete('/api/email-template/delete-email-template/:id', emailTempController.deleteEmailTemplate);

//Routes for Language API

app.get('/api/language/languagelist', languageController.languageList);
app.post('/api/language/add-language', languageController.addLanguage);
app.delete('/api/language/delete-language/:id', languageController.deleteLanguage);
app.put('/api/language/update-language/:id', languageController.updateLanguage);

//Routes for Seeting API

app.post('/api/settings/create-settings/', settingController.createSetting);


app.route('/api/product/update-product/:id')
    .post([productValidation.updateProduct], productController.updateProduct);

app.route('/api/product/add-product')
    .post([productValidation.addProduct], productController.addProduct);

app.route('/api/customer/add-customer')
    .post([customerValidation.addCustomer], customerController.addCustomer);

app.route('/api/customer/update-customer/:id')
    .put([customerValidation.updateCustomer], customerController.updateCustomer);

app.route('/api/customer/register')
    .post([customerValidation.register], customerController.register);

app.route('/api/customer/edit-profile')
    .post([customerValidation.editProfile], customerController.editProfile);

app.route('/api/orders/customer-checkout')
    .post([orderValidation.orderCheckout], orderController.orderCheckout);

app.get('/api/pages/get_pagedetails/:id',pageController.pageDetail);


























