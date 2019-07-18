// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');


// Database models
var user = require('../models/user.model');
var usergroup = require('../models/usergroup.model');

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.login = (body) => {
    console.log('login body: ', body);
    return new Promise((resolve, reject) => {
        user.findOne({ username: body.username })
            .exec((err, customer) => {
                if (err) {
                    reject({ status: 500, message: 'Internal Server Error' });
                } else if (customer) {
                    console.log("customer", customer);
                    customer.comparePassword(body.password, customer.password, (error, isMatch) => {
                        if (error) {
                            reject({ status: 403, message: 'user not found' });
                        } else if (isMatch) {
                            const payload = { customer };

                            var token = jwt.sign(payload, 'pmt');

                            const userData = {
                                address: customer.address,
                                avatar: customer.avatar,
                                avatarPath: customer.avatar_path,
                                createdDate: customer.created_date,
                                email: customer.email,
                                firstName: customer.first_name,
                                isActive: 1,
                                lastName: customer.last_name,
                                phoneNumber: customer.phone_number,
                                userId: customer._id,
                                username: customer.username
                            }
                            const tokendata = {
                                token: token,
                                user: userData,
                            }
                            console.log("Token = ", tokendata);

                            resolve({ status: 200, message: 'Successfully login', data: tokendata })
                        } else {
                            reject({ status: 403, message: 'Incorrect Password' });
                        }
                    });
                } else {
                    reject({ status: 500, message: 'User not found' });
                }

            });
    })
}


module.exports.userList = (userData) => {
    return new Promise((resolve, reject) => {
        if (userData.count == 'true' || userData.count == 1) {

            user.count((useerr, userres) => {
                if (useerr) {
                    console.log('usererror: ', useerr);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully got the complete list of categorys', data: userres });
                }
            });
        }
        else {
            user.aggregate([
                {
                    $project: {
                        userId: '$_id',
                        username: '$name',
                        address: '$image',
                        avatar: '$avatar',
                        avatarPath: '$avatar_path',
                        email: '$email',
                        firstName: '$first_name',
                        lastName: '$last_name',
                        phoneNumber: '$phone_number',
                        username: '$username',
                        usergroupId: '$user_group_id'
                    }
                },
                {
                    $lookup: {
                        from: 'user_group',
                        localField: 'usergroupId',
                        foreignField: '_id',
                        as: 'usergroup'
                    }
                },
                {
                    $unwind: '$usergroup'
                },
                {
                    $project: {
                        usergroup: {
                            groupId: '$usergroup._id',
                            name: '$usergroup.name',
                            createdDate: '$usergroup.createdDate',
                        },
                        userId: 1,
                        username: 1,
                        address: 1,
                        avatar: 1,
                        avatarPath: 1,
                        email: 1,
                        firstName: 1,
                        lastName: 1,
                        phoneNumber: 1,
                        username: 1,
                        usergroupId: 1
                    }
                },
            ])
                .exec(function (Error, Response) {
                    if (Error) {
                        reject({ status: 500, message: 'Internal Server Error' });
                    } else {
                        resolve({ status: 200, message: 'Successfully get All user List', data: Response });
                    }
                })

        }
    })
}


module.exports.roleList = (userData) => {
    return new Promise((resolve, reject) => {
        if (userData.count == 'true' || userData.count == 1) {

            usergroup.count((useerr, userres) => {
                if (useerr) {
                    console.log('usererror: ', useerr);
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully got the complete list of categorys', data: userres });
                }
            });
        }
        else {
            usergroup.aggregate([
                {
                    $project: {
                        groupId: '$_id',
                        name: '$name',
                        isActive:'$is_active',
                    }
                },
            ]).exec(function (Error, Response) {
                if (Error) {
                    reject({ status: 500, message: 'Internal Server Error' });
                } else {
                    resolve({ status: 200, message: 'Successfully get role list', data: Response });
                }
            })
        }
    })
}

module.exports.getProfile = (authorization) => {

    return new Promise((resolve, reject) => {

        jwt.verify(authorization.split(' ')[1], 'pmt', function (err, decoded) {
            if (err) throw err;
            const customerId = decoded.customer._id;
            user.aggregate([
                {
                    $match: { '_id': ObjectId(customerId) }
                },
                {
                    $project: {
                        id: '$_id',
                        email: '$email',
                        firstName: '$first_name',
                        lastName: '$last_name',
                        mobileNumber: '$mobile',
                        modifiedDate: '$modified_date',
                        password: '$password',
                        pincode: '$pincode',
                        safe: '$safe',
                        username: '$username',
                        zoneId: '$zone_id',
                        address: '$address',
                        countryId: '$country_id',
                        avatar: '$avatar',
                        avatarPath: '$avatar_path',
                    }
                }
            ]).exec(function (error, userDetail) {
                if (error) {
                    return reject(error);
                } else {
                    return resolve({ status: 200, message: 'Successfully Get the Profile..!', data: userDetail[0] });
                }
            })
        });
    })
}

module.exports.changePassword = (userId, userData) => {
    return new Promise((resolve, reject) => {

        user.findOne({ _id: userId }).exec((err, user) => {
            if (err) {
                reject({ status: 500, message: 'Internal Server Error' });
            } else if (user) {
                user.comparePassword(userData.oldPassword, user.password, (error, isMatch) => {
                    if (error) {
                        reject({ status: 500, message: 'Internal Server Error' });
                    } else if (isMatch) {
                        user.password = userData.newPassword;
                        user.save();
                        resolve({ status: 200, message: 'Your password changed successfully', data: user })
                    }
                    else {
                        reject({ status: 500, message: 'password does not match' });
                    }
                });
            } else {
                return res.status(400).send({ errMsg: 'Bad request' });
            }
        });
    });
}

module.exports.createRole = (roleData)=> {
	console.log("roleData in country===>",roleData);
    return new Promise((resolve, reject) => {
        usergroup.create(roleData, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new Role.', data: userres });
            }
        });
    })
}

module.exports.updateRole = (roleId,roleData)=> {
	console.log("roleData in country===>",roleData);
    return new Promise((resolve, reject) => {
        usergroup.findByIdAndUpdate({_id:roleId},roleData,{upsert:true}, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully updated Role.', data: userres });
            }
        });
    })
}

module.exports.createUser = (userData)=> {
	console.log("userData in country===>",userData);
    return new Promise((resolve, reject) => {
        user.create(userData, (useerr, userres) => {
            if (useerr) {
                console.log('usererror: ', useerr);
                reject({ status: 500, message: 'Internal Server Error' });
            } else {
                resolve({ status: 200, message: 'Successfully created new User.', data: userres });
            }
        });
    })
}













