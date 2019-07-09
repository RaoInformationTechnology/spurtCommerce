const ejs = require('ejs');
const nodemailer = require('nodemailer');
const smtpTransport = require('nodemailer-smtp-transport');


module.exports.customerOrderMail = (emailContent, orderData, Subject, productDetailData, today) => {
    return new Promise((resolve, reject) => {
        const transporter = nodemailer.createTransport(smtpTransport({
            host: "smtp.gmail.com",
            port: 465,
            secure: true,
            auth: {
                user: 'pushpraj4132@gmail.com',
                pass: 'livinggod13@',
            },
        }));
        ejs.renderFile('./views/emailTemplate.ejs', { emailContent, orderData, productDetailData, today }, (err, data) => {
            if (err) {
                console.log(err);
            } else {
                const mailOptions = {
                    from: 'no-reply@spurtcommerce.com',
                    to: orderData.email,
                    subject: Subject + ' ' + orderData.orderId,
                    html: data,
                };
                transporter.sendMail(mailOptions, (error, info) => {
                    if (error) {
                        reject(error);
                        console.log(error);
                    } else {
                        console.log('Email sent: ' + info.response);
                        resolve(info);
                    }
                });
            }
        });
    });
}


module.exports.contactMail = (emailContent, Subject) => {
    const productDetailData = undefined;
    return new Promise((resolve, reject) => {
        const transporter = nodemailer.createTransport(smtpTransport({
            host: "smtp.gmail.com",
            port: 465,
            secure: true,
            auth: {
                user: 'pushpraj4132@gmail.com',
                pass: 'livinggod13@',
            },
        }));
        ejs.renderFile('./views/emailTemplate.ejs', { emailContent, productDetailData }, (err, data) => {
            if (err) {
                console.log(err);
            } else {
                const mailOptions = {
                    to: 'vishal.pankhaniya786@gmail.com',
                    subject: Subject,
                    html: data,
                };
                transporter.sendMail(mailOptions, (error, info) => {
                    if (error) {
                        reject(error);
                        console.log(error);
                    } else {
                        console.log('Email sent: ' + info.response);
                        resolve(info);
                    }
                });
            }
        });
    });
}


module.exports.registerMail = (emailContent, email, Subject) => {
    const productDetailData = undefined;
    return new Promise((resolve, reject) => {
        const transporter = nodemailer.createTransport(smtpTransport({
            host: "smtp.gmail.com",
            port: 465,
            secure: true,
            auth: {
                user: 'pushpraj4132@gmail.com',
                pass: 'livinggod13@',
            },
        }));
        ejs.renderFile('./views/emailTemplate.ejs', { emailContent, productDetailData }, (err, data) => {
            if (err) {
                console.log(err);
            } else {
                const mailOptions = {
                    from:'no-reply@spurtcommerce.com',
                    to: email,
                    subject: Subject,
                    html: data,
                };
                transporter.sendMail(mailOptions, (error, info) => {
                    if (error) {
                        reject(error);
                        console.log(error);
                    } else {
                        console.log('Email sent: ' + info.response);
                        resolve(info);
                    }
                });
            }
        });
    });
}

