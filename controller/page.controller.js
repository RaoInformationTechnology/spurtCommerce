var page = require('../models/page.model');
var pageService = require('../services/page.service');
// npm import
const path = require('path');
const mongoose = require('mongoose');


const ObjectId = require('mongodb').ObjectId;

module.exports.pageList = (req, res) => {
	pageService.pageList().then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.updatePageDetail = (req, res) => {

	const pageId = req.body.pageId;

	const pageData = {
		is_active: req.body.active,
		full_text: req.body.content,
		meta_tag_description: req.body.metaTagContent,
		meta_tag_keywords: req.body.metaTagKeyword,
		meta_tag_title: req.body.metaTagTitle,
		title: req.body.title
	}


	pageService.updatePageDetail(pageId,pageData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}


module.exports.addNewPage = (req, res) => {

	const pageData = {
		is_active: req.body.active,
		full_text: req.body.content,
		meta_tag_description: req.body.metaTagContent,
		meta_tag_keywords: req.body.metaTagKeyword,
		meta_tag_title: req.body.metaTagTitle,
		title: req.body.title
	}


	pageService.addNewPage(pageData).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.deletePage = (req, res) => {
	const pageId = req.params.id;

	pageService.deletePage(pageId).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}

module.exports.pageDetail = (req, res) => {
	const pageId = req.params.id;

	pageService.pageDetail(pageId).then((response) => {
		return res.status(200).json({ status: 1, message: response.message, data: response.data });
	}).catch((error) => {
		console.log('error: ', error);
		return res.status(error.status ? error.status : 500).json({ message: error.message ? error.message : 'Internal Server Error' });
	});
}