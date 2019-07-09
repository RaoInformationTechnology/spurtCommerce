// Npm modules
const mongoose = require('mongoose');
const path = require('path');
const Url = require('url');
const multer = require('multer');
var fs = require('fs');
var _ = require('lodash');
var async = require("async");

// Static variables
const ObjectId = require('mongodb').ObjectId;

// Services

module.exports.imageResize = (imageData) => {
    return new Promise(function (resolve, reject) {
        const directoryPath = path.join(process.cwd(), 'uploads' + '/' + imageData.imgPath + imageData.imgName)
        var gm = require('gm').subClass({ imageMagick: true });
        return gm(directoryPath).resize(imageData.widthString, imageData.heightString).toBuffer((error, buffer) => {
            if (error) {
                reject(error);
            }
            else {
                resolve(buffer);
            }
        });
    })
}

module.exports.imageUpload = (folderName, base64Image) => {

    console.log("base64----------->>>>>", base64Image);
    const directoryPath = path.join(process.cwd(), 'uploads' + '/' + folderName);
    console.log("path->>>>>>>", directoryPath);
    return new Promise((resolve, reject) => {
        fs.writeFile(directoryPath, base64Image, 'base64', (err) => {
            if (err) {
                reject(err);
            }
            resolve({ success: true });
        });
    });
}


module.exports.createFolder = (folderName) => {

    const directoryPath = path.join(process.cwd(), 'uploads' + '/' + folderName);
    return new Promise((resolve, reject) => {
        if (fs.existsSync(directoryPath)) {
            resolve({ ETAG: new Date() });
        }
        fs.mkdir(directoryPath, { recursive: true }, (err) => {
            if (err) {
                reject(err);
            }
            resolve({ ETAG: new Date() });
        });
    });
}

module.exports.listFolders = (limit, folderName) => {

    return new Promise((resolve, reject) => {

        const directoryPath = path.join(process.cwd(), 'uploads' + '/' + folderName);
        readDir(directoryPath).then((files) => {

            const contents = [];
            const commonPrefix = [];

            async.eachSeries(files, (file, callback) => {
                const pathfile = path.resolve(directoryPath, file);
                fs.stat(pathfile, (error, stat) => {
                    if (stat && stat.isDirectory()) {
                        commonPrefix.push({
                            Prefix: folderName ? folderName + file + '/' : file + '/',
                        });
                        callback();

                    } else {
                        contents.push({
                            Key: folderName ? folderName + file : file,
                        });
                        callback();
                    }
                });
            }, (callbackError, callbackResponse) => {
                if (callbackError) {
                    console.log('callbackError: ', callbackError);
                } else {
                    const outputResponse = {};
                    outputResponse.Name = 'uploads';
                    outputResponse.Prefix = folderName;
                    outputResponse.Delimiter = 100;
                    outputResponse.IsTruncated = 'uploads';
                    outputResponse.Marker = '';
                    outputResponse.Contents = contents;
                    outputResponse.CommonPrefixes = commonPrefix;
                    resolve({ status: 200, message: 'Successfully get bucket object list', data: outputResponse });
                }
            })

        }).catch((error) => {
            console.log('error:', error);
        });
    })
}

function readDir(pathfile) {

    return new Promise((resolve, reject) => {
        fs.readdir(pathfile, (filesError, files) => {
            if (filesError) {
                console.log("filesError:", filesError);
                reject(filesError);
            }
            console.log('filesList:', files);
            resolve(files);
        });
    })
}