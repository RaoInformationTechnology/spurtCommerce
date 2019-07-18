-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 22, 2019 at 08:10 PM
-- Server version: 5.7.25-0ubuntu0.16.04.2
-- PHP Version: 7.0.33-0ubuntu0.16.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spurtcommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_token`
--

CREATE TABLE `access_token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `modified_by` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_token`
--

INSERT INTO `access_token` (`id`, `user_id`, `token`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(1, 49, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDksImlhdCI6MTU1MzI2MjcyMSwiZXhwIjoxNTUzMzQ5MTIxfQ.0dCZWd3bjKAVXe9resKx3HMQGoBiBy40xeTABPXY4B8', NULL, '2019-03-22 19:22:01', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `company` varchar(32) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `address_type` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sort_order` varchar(255) DEFAULT NULL,
  `url` tinytext,
  `banner_group_id` int(11) DEFAULT NULL,
  `container_name` varchar(255) DEFAULT NULL,
  `view_page_count` int(11) DEFAULT '0',
  `banner_group_banner_group_id` int(11) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `content` text,
  `position` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `title`, `sort_order`, `url`, `banner_group_id`, `container_name`, `view_page_count`, `banner_group_banner_group_id`, `link`, `image`, `image_path`, `content`, `position`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(48, 'festival offer 2019', NULL, NULL, NULL, NULL, 0, 0, 'www.piccocart.com', 'Img_1551871702778.jpeg', 'banner/', '<blockquote>\n<h1><strong>Win </strong>INR&nbsp;&nbsp;<strong>10 to </strong><strong>1000</strong></h1>\n</blockquote>\n', 2, NULL, '2019-02-18 03:20:11', '2019-03-14 07:20:11', NULL, NULL),
(49, 'THE T-SHIRT FEST', NULL, NULL, NULL, NULL, 0, 0, 'www.tshirt.com', 'Img_1551871715853.jpeg', 'banner/', '', 1, NULL, '2019-02-18 03:20:50', '2019-03-21 00:34:51', NULL, NULL),
(50, 'March - CARNIVAL', NULL, NULL, NULL, NULL, 0, 0, 'www.content.com', 'Img_1551872953437.jpeg', 'banner/', '', 4, NULL, '2019-02-18 04:12:32', '2019-03-18 01:16:05', NULL, NULL),
(53, '0 % Interest ', NULL, NULL, NULL, NULL, 0, 0, 'www.fashion.com', 'Img_1551871740879.jpeg', 'banner/', '<p><tt><big><q><var>&nbsp;NO COST EMI *</var></q></big></tt></p>\n', 3, NULL, '2019-02-20 05:51:04', '2019-03-14 07:08:26', NULL, NULL),
(55, 'Prime Exclusives', NULL, NULL, NULL, NULL, 0, 0, 'www.bannerlink.com', 'Img_1551871752833.jpeg', 'banner/', '<h1><strong>&nbsp;FREE fast delivery ,</strong></h1>\n\n<p><strong>video , music&nbsp; &amp; more</strong></p>\n', 5, NULL, '2019-02-25 06:43:49', '2019-03-14 07:14:32', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banner_group`
--

CREATE TABLE `banner_group` (
  `banner_group_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner_image`
--

CREATE TABLE `banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(45) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `banner_image_description`
--

CREATE TABLE `banner_image_description` (
  `banner_image_description_id` int(11) NOT NULL,
  `banner_image_id` int(11) DEFAULT NULL,
  `banner_id` int(11) DEFAULT NULL,
  `title` varchar(4) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `parent_int` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `meta_tag_title` varchar(255) DEFAULT NULL,
  `meta_tag_description` text,
  `meta_tag_keyword` varchar(255) DEFAULT NULL,
  `is_active` varchar(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`, `image`, `image_path`, `parent_int`, `sort_order`, `meta_tag_title`, `meta_tag_description`, `meta_tag_keyword`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(108, 'Electronics', 'image', NULL, 0, 3, '', '', '', '1', NULL, NULL, '2019-03-18 02:00:00', '2019-03-20 06:56:28'),
(109, 'Mobiles', 'image', NULL, 108, 1, 'electronic', 'electronic', 'electronic', '1', NULL, NULL, '2019-03-18 02:01:28', '2019-03-18 02:02:56'),
(110, 'Laptops', 'image', NULL, 108, 4, '', '', '', '1', NULL, NULL, '2019-03-18 02:02:17', '2019-03-19 08:51:47'),
(111, 'Mens Fashion', 'image', NULL, 0, 1, '', '', '', '1', NULL, NULL, '2019-03-18 02:05:19', '2019-03-18 07:39:02'),
(112, 'Top wear', 'image', NULL, 111, 1, 'dress', 'dress', 'dress', '1', NULL, NULL, '2019-03-18 02:05:48', NULL),
(113, 'Bottom wear', 'image', NULL, 111, 1, 'dress', 'dress', 'dress', '1', NULL, NULL, '2019-03-18 02:06:16', NULL),
(117, 'Womens Fashion', 'image', NULL, 0, 2, '', '', '', '1', NULL, NULL, '2019-03-18 05:06:19', '2019-03-20 01:06:49'),
(118, 'Women Watches', 'image', NULL, 117, 1, '', '', '', '1', NULL, NULL, '2019-03-18 05:08:53', '2019-03-18 05:10:03'),
(119, 'Womens Dress', 'image', NULL, 117, 1, '', '', '', '1', NULL, NULL, '2019-03-18 05:11:18', '2019-03-18 06:04:33'),
(120, 'Baby & Kids', 'image', NULL, 0, 5, '', '', '', '1', NULL, NULL, '2019-03-18 05:13:31', '2019-03-19 08:53:13'),
(121, 'Toys', 'image', NULL, 120, 1, '', '', '', '1', NULL, NULL, '2019-03-18 05:14:25', '2019-03-20 01:08:03'),
(122, 'Sony', 'image', NULL, 109, 1, '', '', '', '1', NULL, NULL, '2019-03-18 05:24:20', '2019-03-18 08:53:41'),
(123, 'Camera', 'image', NULL, 108, 1, 'camera', 'camera', 'camera', '1', NULL, NULL, '2019-03-18 05:28:11', NULL),
(124, 'Home appliances', 'image', NULL, 108, 1, 'home appliances product', 'home appliances product', 'home appliances product', '1', NULL, NULL, '2019-03-18 05:44:50', NULL),
(126, 'Provisional & Utensils', 'image', NULL, 0, 4, '', '', '', '1', NULL, NULL, '2019-03-18 06:56:55', '2019-03-19 08:52:58'),
(127, 'Vivo', 'image', NULL, 109, 1, '', '', '', '1', NULL, NULL, '2019-03-18 08:54:55', '2019-03-20 04:08:09'),
(128, 'Oppo', 'image', NULL, 109, 1, 'oppo mobile', 'oppo mobile', 'oppo mobile', '1', NULL, NULL, '2019-03-18 08:55:54', NULL),
(129, 'Foodgrains, OIls & Masala', 'image', NULL, 126, 1, 'Foodgrains, OIls & Masala', 'Foodgrains, OIls & Masala', '', '1', NULL, NULL, '2019-03-19 00:28:52', NULL),
(130, 'Organic Staples', 'image', NULL, 126, 1, 'Organic Staples', 'Organic Staples', 'Organic Staples', '1', NULL, NULL, '2019-03-19 00:31:39', NULL),
(131, 'Dals & Pulses', 'image', NULL, 126, 1, 'Dals & Pulses', 'Dals & Pulses', 'Dals & Pulses', '1', NULL, NULL, '2019-03-19 00:32:11', NULL),
(132, 'baby\'s dress', 'image', NULL, 120, 1, 'Dress', 'baby\'s dress', 'baby\'s dress', '1', NULL, NULL, '2019-03-19 00:52:55', NULL),
(134, 'Steel Utensils', 'image', NULL, 126, 1, 'Steel Utensils', 'Steel Utensils', 'Steel Utensils', '1', NULL, NULL, '2019-03-19 01:29:04', NULL),
(135, 'Plates & Tumlers', 'image', NULL, 134, 1, 'Plates & Tumlers', 'Plates & Tumlers', 'Plates & Tumlers', '1', NULL, NULL, '2019-03-19 01:36:03', NULL),
(136, 'Bowls & Vessels', 'image', NULL, 134, 1, '', '', '', '1', NULL, NULL, '2019-03-19 02:09:34', '2019-03-20 04:09:25'),
(137, 'Cereals & Millets', 'image', NULL, 131, 1, 'Cereals & Millets', 'Cereals & Millets', 'Cereals & Millets', '1', NULL, NULL, '2019-03-19 02:10:51', NULL),
(138, 'Toor, Channa & Moong Dal', 'image', NULL, 131, 1, 'Toor, Channa & Moong Dal', 'Toor, Channa & Moong Dal', 'Toor, Channa & Moong Dal', '1', NULL, NULL, '2019-03-19 02:11:44', NULL),
(139, 'DELL', 'image', NULL, 110, 1, 'dell', 'dell', 'dell', '1', NULL, NULL, '2019-03-19 02:13:48', NULL),
(141, 'Organic Edible Oil & Ghee', 'image', NULL, 130, 1, 'Organic Edible Oil & Ghee', 'Organic Edible Oil & Ghee', 'Organic Edible Oil & Ghee', '1', NULL, NULL, '2019-03-19 02:18:42', NULL),
(142, 'Organic Flours', 'image', NULL, 130, 1, 'Organic Flours', 'Organic Flours', 'Organic Flours', '1', NULL, NULL, '2019-03-19 02:19:58', NULL),
(143, 'Sony Camera', 'image', NULL, 123, 1, 'Sony Camera', 'Sony Camera', 'Sony Camera', '1', NULL, NULL, '2019-03-19 02:21:10', '2019-03-19 02:24:36'),
(144, 'Blended Masalas', 'image', NULL, 129, 1, 'Blended Masalas', 'Blended Masalas', 'Blended Masalas', '1', NULL, NULL, '2019-03-19 02:21:22', NULL),
(145, 'Soya & Mustard Oils', 'image', NULL, 129, 1, 'Soya & Mustard Oils', 'Soya & Mustard Oils', 'Soya & Mustard Oils', '1', NULL, NULL, '2019-03-19 02:22:38', NULL),
(146, 'Footwear', 'image', NULL, 117, 1, 'Footwear', 'Footwear', 'Footwear', '1', NULL, NULL, '2019-03-19 02:24:07', NULL),
(147, 'Slippers', 'image', NULL, 146, 1, 'Slippers', 'Slippers', 'Slippers', '1', NULL, NULL, '2019-03-19 02:24:36', NULL),
(148, 'Formal shoes', 'image', NULL, 146, 1, 'Formal shoes', 'Formal shoes', 'Formal shoes', '1', NULL, NULL, '2019-03-19 02:24:57', NULL),
(149, 'Casual Shoes', 'image', NULL, 146, 1, 'Casual Shoes', 'Casual Shoes', 'Casual Shoes', '1', NULL, NULL, '2019-03-19 02:25:23', NULL),
(150, 'Analog Watches', 'image', NULL, 118, 1, 'Analog Watches', 'Analog Watches', 'Analog Watches', '1', NULL, NULL, '2019-03-19 02:26:25', NULL),
(151, 'Smart Watch', 'image', NULL, 118, 1, 'Smart Watch', 'Smart Watch', 'Smart Watch', '1', NULL, NULL, '2019-03-19 02:27:03', NULL),
(152, 'Digital Watch', 'image', NULL, 118, 1, '', '', '', '1', NULL, NULL, '2019-03-19 02:27:29', '2019-03-19 02:28:55'),
(153, 'Kurti\'s', 'image', NULL, 119, 1, 'Kurti\'s', 'Kurti\'s', 'Kurti\'s', '1', NULL, NULL, '2019-03-19 02:28:01', NULL),
(154, 'Saree', 'image', NULL, 119, 1, 'Saree', 'Saree', 'Saree', '1', NULL, NULL, '2019-03-19 02:28:20', NULL),
(155, 'Beauty & Grooming', 'image', NULL, 117, 1, 'Beauty & Grooming', 'Beauty & Grooming', 'Beauty & Grooming', '1', NULL, NULL, '2019-03-19 02:31:02', NULL),
(156, 'Washing Machine', 'image', NULL, 124, 1, 'Washing Machine', 'Washing Machine', 'Washing Machine', '1', NULL, NULL, '2019-03-19 02:31:39', NULL),
(157, 'Make Up', 'image', NULL, 155, 1, 'Make Up', 'Make Up', 'Make Up', '1', NULL, NULL, '2019-03-19 02:31:56', NULL),
(158, 'Hair Care', 'image', NULL, 155, 1, 'Hair Care', 'Hair Care', 'Hair Care', '1', NULL, NULL, '2019-03-19 02:32:39', NULL),
(159, 'Bath & spa', 'image', NULL, 155, 1, 'Bath & spa', 'Bath & spa', 'Bath & spa', '1', NULL, NULL, '2019-03-19 02:33:08', NULL),
(160, 'Mens Footwear', 'image', NULL, 111, 1, 'Mens Footwear', 'Mens Footwear', 'Mens Footwear', '1', NULL, NULL, '2019-03-19 02:34:46', NULL),
(161, 'Beauty & Grooming', 'image', NULL, 111, 1, 'Beauty & Grooming', 'Beauty & Grooming', 'Beauty & Grooming', '1', NULL, NULL, '2019-03-19 02:35:16', NULL),
(162, 'Shirt', 'image', NULL, 112, 1, 'Shirt', 'Shirt', 'Shirt', '1', NULL, NULL, '2019-03-19 02:35:52', NULL),
(163, 't-shirt', 'image', NULL, 112, 1, 't-shirt', 't-shirt', 't-shirt', '1', NULL, NULL, '2019-03-19 02:38:05', NULL),
(164, 'Pants', 'image', NULL, 113, 1, 'Pants', 'Pants', 'Pants', '1', NULL, NULL, '2019-03-19 02:38:51', NULL),
(165, 'Tracks', 'image', NULL, 113, 1, 'Tracks', 'Tracks', 'Tracks', '1', NULL, NULL, '2019-03-19 02:39:11', NULL),
(166, 'Formal Shoe', 'image', NULL, 160, 1, 'Formal Shoe', 'Formal Shoe', 'Formal Shoe', '1', NULL, NULL, '2019-03-19 02:39:38', NULL),
(167, 'Slippers', 'image', NULL, 160, 1, 'Slippers', 'Slippers', 'Slippers', '1', NULL, NULL, '2019-03-19 02:40:11', NULL),
(168, 'For girl', 'image', NULL, 132, 7, 'For girl', 'For girl', 'For girl', '1', NULL, NULL, '2019-03-19 08:55:03', NULL),
(169, 'For boy', 'image', NULL, 132, 7, 'For boy', 'For boy', 'For boy', '1', NULL, NULL, '2019-03-19 08:55:59', NULL),
(170, 'Outdoor Toys', 'image', NULL, 121, 1, 'Outdoor Toys', 'Outdoor Toys', 'Outdoor Toys', '1', NULL, NULL, '2019-03-19 09:20:04', NULL),
(171, 'Musical Toys, dolls', 'image', NULL, 121, 1, 'Musical Toys, dolls', 'Musical Toys, dolls', 'Musical Toys, dolls', '1', NULL, NULL, '2019-03-19 09:20:56', NULL),
(172, 'HP', 'image', NULL, 110, 1, 'hp laptop', 'hp laptop', 'hp laptop', '1', NULL, NULL, '2019-03-20 00:34:57', NULL),
(173, 'Perfumes', 'image', NULL, 161, 1, 'Perfumes', 'Perfumes', 'Perfumes', '1', NULL, NULL, '2019-03-20 01:10:46', NULL),
(174, 'mens watch', 'image', NULL, 112, 1, '', '', '', '1', NULL, NULL, '2019-03-20 02:52:34', '2019-03-20 02:53:36'),
(175, 'Deodorants', 'image', NULL, 161, 1, 'Deodorants', 'Deodorants', 'Deodorants', NULL, NULL, NULL, '2019-03-20 04:31:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_description`
--

CREATE TABLE `category_description` (
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `meta_description` varchar(65) DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `category_description_id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_path`
--

CREATE TABLE `category_path` (
  `category_path_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `path_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_path`
--

INSERT INTO `category_path` (`category_path_id`, `category_id`, `path_id`, `level`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(106, 109, 108, 0, NULL, NULL, NULL, NULL),
(107, 109, 109, 1, NULL, NULL, NULL, NULL),
(109, 112, 111, 0, NULL, NULL, NULL, NULL),
(110, 112, 112, 1, NULL, NULL, NULL, NULL),
(111, 113, 111, 0, NULL, NULL, NULL, NULL),
(112, 113, 113, 1, NULL, NULL, NULL, NULL),
(119, 118, 117, 0, NULL, NULL, NULL, NULL),
(120, 118, 118, 1, NULL, NULL, NULL, NULL),
(129, 123, 108, 0, NULL, NULL, NULL, NULL),
(130, 123, 123, 1, NULL, NULL, NULL, NULL),
(131, 124, 108, 0, NULL, NULL, NULL, NULL),
(132, 124, 124, 1, NULL, NULL, NULL, NULL),
(135, 119, 117, 0, NULL, NULL, NULL, NULL),
(136, 119, 119, 1, NULL, NULL, NULL, NULL),
(139, 111, 111, 0, NULL, NULL, NULL, NULL),
(145, 122, 108, 0, NULL, NULL, NULL, NULL),
(146, 122, 109, 1, NULL, NULL, NULL, NULL),
(147, 122, 122, 2, NULL, NULL, NULL, NULL),
(151, 128, 108, 0, NULL, NULL, NULL, NULL),
(152, 128, 109, 1, NULL, NULL, NULL, NULL),
(153, 128, 128, 2, NULL, NULL, NULL, NULL),
(154, 129, 126, 0, NULL, NULL, NULL, NULL),
(155, 129, 129, 1, NULL, NULL, NULL, NULL),
(156, 130, 126, 0, NULL, NULL, NULL, NULL),
(157, 130, 130, 1, NULL, NULL, NULL, NULL),
(158, 131, 126, 0, NULL, NULL, NULL, NULL),
(159, 131, 131, 1, NULL, NULL, NULL, NULL),
(160, 132, 120, 0, NULL, NULL, NULL, NULL),
(161, 132, 132, 1, NULL, NULL, NULL, NULL),
(165, 134, 126, 0, NULL, NULL, NULL, NULL),
(166, 134, 134, 1, NULL, NULL, NULL, NULL),
(167, 135, 126, 0, NULL, NULL, NULL, NULL),
(168, 135, 134, 1, NULL, NULL, NULL, NULL),
(169, 135, 135, 2, NULL, NULL, NULL, NULL),
(173, 137, 126, 0, NULL, NULL, NULL, NULL),
(174, 137, 131, 1, NULL, NULL, NULL, NULL),
(175, 137, 137, 2, NULL, NULL, NULL, NULL),
(176, 138, 126, 0, NULL, NULL, NULL, NULL),
(177, 138, 131, 1, NULL, NULL, NULL, NULL),
(178, 138, 138, 2, NULL, NULL, NULL, NULL),
(179, 139, 108, 0, NULL, NULL, NULL, NULL),
(180, 139, 110, 1, NULL, NULL, NULL, NULL),
(181, 139, 139, 2, NULL, NULL, NULL, NULL),
(185, 141, 126, 0, NULL, NULL, NULL, NULL),
(186, 141, 130, 1, NULL, NULL, NULL, NULL),
(187, 141, 141, 2, NULL, NULL, NULL, NULL),
(188, 142, 126, 0, NULL, NULL, NULL, NULL),
(189, 142, 130, 1, NULL, NULL, NULL, NULL),
(190, 142, 142, 2, NULL, NULL, NULL, NULL),
(194, 144, 126, 0, NULL, NULL, NULL, NULL),
(195, 144, 129, 1, NULL, NULL, NULL, NULL),
(196, 144, 144, 2, NULL, NULL, NULL, NULL),
(197, 145, 126, 0, NULL, NULL, NULL, NULL),
(198, 145, 129, 1, NULL, NULL, NULL, NULL),
(199, 145, 145, 2, NULL, NULL, NULL, NULL),
(200, 146, 117, 0, NULL, NULL, NULL, NULL),
(201, 146, 146, 1, NULL, NULL, NULL, NULL),
(202, 147, 117, 0, NULL, NULL, NULL, NULL),
(203, 147, 146, 1, NULL, NULL, NULL, NULL),
(204, 147, 147, 2, NULL, NULL, NULL, NULL),
(205, 143, 108, 0, NULL, NULL, NULL, NULL),
(206, 143, 123, 1, NULL, NULL, NULL, NULL),
(207, 143, 143, 2, NULL, NULL, NULL, NULL),
(208, 148, 117, 0, NULL, NULL, NULL, NULL),
(209, 148, 146, 1, NULL, NULL, NULL, NULL),
(210, 148, 148, 2, NULL, NULL, NULL, NULL),
(211, 149, 117, 0, NULL, NULL, NULL, NULL),
(212, 149, 146, 1, NULL, NULL, NULL, NULL),
(213, 149, 149, 2, NULL, NULL, NULL, NULL),
(214, 150, 117, 0, NULL, NULL, NULL, NULL),
(215, 150, 118, 1, NULL, NULL, NULL, NULL),
(216, 150, 150, 2, NULL, NULL, NULL, NULL),
(217, 151, 117, 0, NULL, NULL, NULL, NULL),
(218, 151, 118, 1, NULL, NULL, NULL, NULL),
(219, 151, 151, 2, NULL, NULL, NULL, NULL),
(222, 153, 117, 0, NULL, NULL, NULL, NULL),
(223, 153, 119, 1, NULL, NULL, NULL, NULL),
(224, 153, 153, 2, NULL, NULL, NULL, NULL),
(225, 154, 117, 0, NULL, NULL, NULL, NULL),
(226, 154, 119, 1, NULL, NULL, NULL, NULL),
(227, 154, 154, 2, NULL, NULL, NULL, NULL),
(228, 152, 117, 0, NULL, NULL, NULL, NULL),
(229, 152, 118, 1, NULL, NULL, NULL, NULL),
(230, 152, 152, 2, NULL, NULL, NULL, NULL),
(231, 155, 117, 0, NULL, NULL, NULL, NULL),
(232, 155, 155, 1, NULL, NULL, NULL, NULL),
(233, 156, 108, 0, NULL, NULL, NULL, NULL),
(234, 156, 124, 1, NULL, NULL, NULL, NULL),
(235, 156, 156, 2, NULL, NULL, NULL, NULL),
(236, 157, 117, 0, NULL, NULL, NULL, NULL),
(237, 157, 155, 1, NULL, NULL, NULL, NULL),
(238, 157, 157, 2, NULL, NULL, NULL, NULL),
(239, 158, 117, 0, NULL, NULL, NULL, NULL),
(240, 158, 155, 1, NULL, NULL, NULL, NULL),
(241, 158, 158, 2, NULL, NULL, NULL, NULL),
(242, 159, 117, 0, NULL, NULL, NULL, NULL),
(243, 159, 155, 1, NULL, NULL, NULL, NULL),
(244, 159, 159, 2, NULL, NULL, NULL, NULL),
(245, 160, 111, 0, NULL, NULL, NULL, NULL),
(246, 160, 160, 1, NULL, NULL, NULL, NULL),
(247, 161, 111, 0, NULL, NULL, NULL, NULL),
(248, 161, 161, 1, NULL, NULL, NULL, NULL),
(249, 162, 111, 0, NULL, NULL, NULL, NULL),
(250, 162, 112, 1, NULL, NULL, NULL, NULL),
(251, 162, 162, 2, NULL, NULL, NULL, NULL),
(252, 163, 111, 0, NULL, NULL, NULL, NULL),
(253, 163, 112, 1, NULL, NULL, NULL, NULL),
(254, 163, 163, 2, NULL, NULL, NULL, NULL),
(255, 164, 111, 0, NULL, NULL, NULL, NULL),
(256, 164, 113, 1, NULL, NULL, NULL, NULL),
(257, 164, 164, 2, NULL, NULL, NULL, NULL),
(258, 165, 111, 0, NULL, NULL, NULL, NULL),
(259, 165, 113, 1, NULL, NULL, NULL, NULL),
(260, 165, 165, 2, NULL, NULL, NULL, NULL),
(261, 166, 111, 0, NULL, NULL, NULL, NULL),
(262, 166, 160, 1, NULL, NULL, NULL, NULL),
(263, 166, 166, 2, NULL, NULL, NULL, NULL),
(264, 167, 111, 0, NULL, NULL, NULL, NULL),
(265, 167, 160, 1, NULL, NULL, NULL, NULL),
(266, 167, 167, 2, NULL, NULL, NULL, NULL),
(267, 110, 108, 0, NULL, NULL, NULL, NULL),
(268, 110, 110, 1, NULL, NULL, NULL, NULL),
(271, 126, 126, 0, NULL, NULL, NULL, NULL),
(272, 120, 120, 0, NULL, NULL, NULL, NULL),
(273, 168, 120, 0, NULL, NULL, NULL, NULL),
(274, 168, 132, 1, NULL, NULL, NULL, NULL),
(275, 168, 168, 2, NULL, NULL, NULL, NULL),
(276, 169, 120, 0, NULL, NULL, NULL, NULL),
(277, 169, 132, 1, NULL, NULL, NULL, NULL),
(278, 169, 169, 2, NULL, NULL, NULL, NULL),
(279, 170, 120, 0, NULL, NULL, NULL, NULL),
(280, 170, 121, 1, NULL, NULL, NULL, NULL),
(281, 170, 170, 2, NULL, NULL, NULL, NULL),
(282, 171, 120, 0, NULL, NULL, NULL, NULL),
(283, 171, 121, 1, NULL, NULL, NULL, NULL),
(284, 171, 171, 2, NULL, NULL, NULL, NULL),
(288, 172, 108, 0, NULL, NULL, NULL, NULL),
(289, 172, 110, 1, NULL, NULL, NULL, NULL),
(290, 172, 172, 2, NULL, NULL, NULL, NULL),
(291, 117, 117, 0, NULL, NULL, NULL, NULL),
(292, 121, 120, 0, NULL, NULL, NULL, NULL),
(293, 121, 121, 1, NULL, NULL, NULL, NULL),
(294, 173, 111, 0, NULL, NULL, NULL, NULL),
(295, 173, 161, 1, NULL, NULL, NULL, NULL),
(296, 173, 173, 2, NULL, NULL, NULL, NULL),
(304, 174, 111, 0, NULL, NULL, NULL, NULL),
(305, 174, 112, 1, NULL, NULL, NULL, NULL),
(306, 174, 174, 2, NULL, NULL, NULL, NULL),
(309, 127, 108, 0, NULL, NULL, NULL, NULL),
(310, 127, 109, 1, NULL, NULL, NULL, NULL),
(311, 127, 127, 2, NULL, NULL, NULL, NULL),
(312, 136, 126, 0, NULL, NULL, NULL, NULL),
(313, 136, 134, 1, NULL, NULL, NULL, NULL),
(314, 136, 136, 2, NULL, NULL, NULL, NULL),
(315, 175, 111, 0, NULL, NULL, NULL, NULL),
(316, 175, 161, 1, NULL, NULL, NULL, NULL),
(317, 175, 175, 2, NULL, NULL, NULL, NULL),
(328, 108, 108, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `message` text,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone_number`, `message`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(10, 'veerapandi', 'veerapandi.picco@gmail.com', '952476006882205', 'Very Useful', NULL, '2019-03-02 01:26:39', NULL, NULL, NULL),
(11, 'ganesh', 'ganesh.picco@gmail.com', '7373840121', 'testint', NULL, '2019-03-12 23:55:30', NULL, NULL, NULL),
(12, 'amit kumar', 'amitpiccosoft@gmail.com', '999999999999999', 'my name is Amit Kumar', NULL, '2019-03-14 02:34:47', NULL, NULL, NULL),
(13, 'amit', 'gmail@gmail.com', '993339999988888', 'hii amit', NULL, '2019-03-14 02:43:57', NULL, NULL, NULL),
(14, 'veerapandi', 'veerapandi.picco@gmail.com', '889099099999999', 'Open demo ecommerce ', NULL, '2019-03-20 05:01:58', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `iso_code_2` varchar(2) DEFAULT NULL,
  `iso_code_3` varchar(3) DEFAULT NULL,
  `address_format` text,
  `postcode_required` tinyint(1) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(22, 'India', 'IN', 'IND', NULL, 0, NULL, '2019-02-15 04:15:14', NULL, NULL, NULL),
(24, 'US', 'US', 'USA', NULL, 1, NULL, '2019-02-17 22:16:46', NULL, NULL, NULL),
(27, 'England', 'EN', 'ENG', NULL, 0, NULL, '2019-02-18 04:06:49', NULL, NULL, NULL),
(30, 'China', 'CH', 'CHA', NULL, 0, NULL, '2019-02-18 06:29:04', NULL, NULL, NULL),
(45, 'SRI LANKA', 'SL', 'SLA', NULL, 0, NULL, '2019-02-20 07:36:10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `symbol_left` varchar(32) DEFAULT NULL,
  `symbol_right` varchar(32) DEFAULT NULL,
  `decimal_place` decimal(5,0) DEFAULT NULL,
  `value` float(15,8) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(44, 'assa', 'as', 'sasa', '', NULL, 211.00000000, 1, '2019-02-15 05:13:50', '2019-03-20 04:02:04', NULL, NULL),
(46, 'Doller', 'US', '1', '8', NULL, 12.00000000, 1, '2019-02-17 22:18:16', '2019-02-18 08:46:08', NULL, NULL),
(57, 'Rupees', 'IND', 'INR -', 'IN', NULL, 123.00000000, 1, '2019-03-20 01:57:14', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `first_name` varchar(512) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `username` varchar(512) NOT NULL,
  `email` varchar(512) DEFAULT NULL,
  `password` varchar(512) NOT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(128) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_path` tinytext,
  `mail_status` int(11) DEFAULT NULL,
  `delete_flag` int(11) DEFAULT '0',
  `customer_group_id` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `newsletter` int(11) DEFAULT NULL,
  `safe` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `mobile`, `address`, `country_id`, `city`, `pincode`, `avatar`, `avatar_path`, `mail_status`, `delete_flag`, `customer_group_id`, `last_login`, `newsletter`, `safe`, `ip`, `zone_id`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 'demo@spurtcommerce.com', NULL, 'demo@spurtcommerce.com', 'demo@spurtcommerce.com', '$2a$10$uVWOQ0s3hgUpAY.46VJHleGc2nADK5BFAPakyHTFObCkPYvtKD7vm', '8888888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '2019-03-22 16:49:00', NULL, NULL, '::1', NULL, 1, NULL, NULL, '2019-03-22 16:46:39', '2019-03-22 16:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer_group`
--

CREATE TABLE `customer_group` (
  `id` int(11) NOT NULL,
  `name` varchar(512) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_ip`
--

CREATE TABLE `customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_transaction`
--

CREATE TABLE `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `description` text,
  `amount` decimal(15,4) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wishlist`
--

CREATE TABLE `customer_wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `id` int(11) NOT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_template`
--

INSERT INTO `email_template` (`id`, `shortname`, `subject`, `message`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(1, 'Register Content', 'Registration Successfully', '<p>Dear {name},<br />\n&nbsp;</p>\n\n<p>Thank you for Registration With us..!</p>\n', 1, '2019-02-23 09:47:35', '2019-03-20 00:57:19', NULL, NULL),
(2, 'Forgot Password Content', 'Forgot Password', '<p>Dear {name},<br />\n&nbsp;</p>\n\n<p>Your new Password is : {xxxxxx}</p>\n', 1, '2019-02-23 09:53:09', '2019-03-06 01:06:45', NULL, NULL),
(3, 'Contact Content', 'ContactUs', 'Dear Mr.Admin,<br/><br/>\r\n                              <p style="margin-bottom:.5em; margin: 0 0 10px 0;text-indent: 50px"> {name} try to contact you...! </p>\r\n', NULL, NULL, NULL, NULL, NULL),
(4, 'Create User', 'User Login', '<p>Dear {name},<br />\r\n&nbsp;</p>\r\n\r\n<p>Email-id : {email}</p>\r\n\r\n<p>Password : {xxxxxx}</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You may login using the above Email Id and Password.</p>\r\n\r\n<p>&nbsp;</p>\r\n', 0, NULL, '2019-03-05 03:00:37', NULL, NULL),
(5, 'Customer Order Content', 'Details of your recent Order', 'Dear {name},        </td>    </tr>    <tr>        <td dir=\'ltr\' style=\'padding:0 0px;color:#078e05;font-weight:400;text-align:left;font-size:16px;line-height:1.5rem;padding-top:10px;font-family: \'Roboto\', sans-serif;\' valign=\'top\'> Order successfully placed.        </td>    </tr>    <tr>        <td dir=\'ltr\' style=\'padding:0 0px;color:#000;font-weight:300;text-align:left;font-size:12px;line-height:1.2rem;padding-top:10px;font-family: \'Roboto\', sans-serif;\' valign=\'top\'> You have successfully placed an order for customization services. Kindly find the following details on the placed order.    </tr></tbody></table></td></tr>\r\n', 0, NULL, '2019-03-05 07:04:07', NULL, NULL),
(6, 'Admin Mail Content', 'Congratulations on your recent order', 'Dear Mr.Admin,        </td>    </tr>    <tr>        <td dir=\'ltr\' style=\'padding:0 0px;color:#078e05;font-weight:400;text-align:left;font-size:16px;line-height:1.5rem;padding-top:10px;font-family: \'Roboto\', sans-serif;\' valign=\'top\'> A new order has been placed.         </td>    </tr>    <tr>        <td dir=\'ltr\' style=\'padding:0 0px;color:#000;font-weight:300;text-align:left;font-size:12px;line-height:1.2rem;padding-top:10px;font-family: \'Roboto\', sans-serif;\' valign=\'top\'> The new order {orderId} from the Customer {name} has been successfully placed. Kindly find the following details on the placed order.    </tr> </tbody></table></td> </tr> \r\n\r\n\r\n							\r\n\r\n\r\n							\r\n', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `geo_zone`
--

CREATE TABLE `geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `image` text,
  `image_path` text,
  `locale` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `image`, `image_path`, `locale`, `sort_order`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(53, 'English', 'en', 'Img_1552892261882.jpeg', 'language/', NULL, 1, 1, '2019-03-15 04:30:02', '2019-03-18 01:57:41', NULL, NULL),
(54, 'Hindi', 'hi', 'Img_1552642244089.png', 'language/', NULL, 0, 1, '2019-03-15 04:30:44', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `login_log`
--

CREATE TABLE `login_log` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `email_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_log`
--

INSERT INTO `login_log` (`id`, `customer_id`, `email_id`, `first_name`, `ip_address`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(1, 1, 'demo@spurtcommerce.com', 'demo@spurtcommerce.com', '::1', '2019-03-22 16:49:00', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `image_path`, `sort_order`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(22, 'adidas', 'Img_1551781580514.png', 'manufacturer/', 11, 1, NULL, NULL, '2019-03-01 05:56:19', '2019-03-21 00:42:22'),
(23, 'lenovo', 'Img_1551441402650.jpeg', 'manufacturer/', 13, 1, NULL, NULL, '2019-03-01 05:56:42', '2019-03-20 00:52:17'),
(25, 'Levis', 'Img_1551446334998.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-01 07:18:55', NULL),
(27, 'peter England', 'Img_1551446378607.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-01 07:19:38', NULL),
(28, 'Sonata', 'Img_1551767074475.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-01 07:19:57', '2019-03-06 06:01:02'),
(29, 'ramraj', 'Img_1552985087092.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-04 07:14:03', '2019-03-19 03:44:47'),
(30, 'sony', 'Img_1551705402126.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-04 07:16:42', NULL),
(31, 'fastrack', 'Img_1551705476437.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-04 07:17:56', '2019-03-20 00:11:39'),
(32, 'samsung', 'Img_1551874002023.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-06 06:06:42', NULL),
(33, 'HP', 'Img_1551874158846.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-06 06:09:18', NULL),
(34, 'nike', 'Img_1552038996528.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-08 03:56:36', NULL),
(35, 'orient', 'Img_1552303543254.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-08 04:58:38', '2019-03-11 06:25:43'),
(36, 'Onida', 'Img_1552045840773.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-08 05:50:40', NULL),
(41, 'DELL', 'Img_1552986470668.png', 'manufacturer/', 8, 1, NULL, NULL, '2019-03-19 04:07:50', '2019-03-19 21:27:38'),
(50, 'Achi', 'Img_1553076284295.jpeg', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-20 05:04:44', NULL),
(51, 'catch', 'Img_1553076327074.jpeg', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-20 05:05:27', NULL),
(52, 'bata', 'Img_1553076344823.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-20 05:05:44', NULL),
(53, 'patanjali', 'Img_1553076361372.jpeg', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-20 05:06:01', NULL),
(54, 'Paragon', 'Img_1553076382819.png', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-20 05:06:22', NULL),
(55, 'Sony', 'Img_1553076408056.jpeg', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-20 05:06:48', NULL),
(56, 'oppo', 'Img_1553076426007.jpeg', 'manufacturer/', 1, 1, NULL, NULL, '2019-03-20 05:07:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `timestamp`, `name`) VALUES
(1, 1546513939916, 'CreateUserTable1546513939916'),
(2, 1546516990326, 'CreateUserGroupTable1546516990326'),
(3, 1546521833384, 'CreateUserRelationToUserGroupTable1546521833384'),
(4, 1546522725201, 'CreateCategoryTable1546522725201'),
(5, 1546523068121, 'CreateZoneToGeoZoneTable1546523068121'),
(6, 1546523201059, 'CreateCustomerGroupTable1546523201059'),
(7, 1546523577052, 'CreateCustomerIpTable1546523577052'),
(8, 1546523725119, 'CreateGeoZoneTable1546523725119'),
(9, 1546523802480, 'CreateBannerGroupTable1546523802480'),
(10, 1546524333028, 'CreateCurrencyTable1546524333028'),
(11, 1546524561001, 'CreateCustomerTable1546524561001'),
(12, 1546525248338, 'CreateAddessTable1546525248338'),
(13, 1546525786783, 'CreateBannerImageTable1546525786783'),
(14, 1546525833396, 'CreateStockStatusTable1546525833396'),
(15, 1546526076621, 'CreateBannerTable1546526076621'),
(16, 1546526936010, 'CreateBannerImageDescriptionTable1546526936010'),
(17, 1546527306595, 'CreateCustomerTransactionTable1546527306595'),
(18, 1546528787878, 'CreateProductTable1546528787878'),
(19, 1546529746397, 'CreateProductRelatedTable1546529746397'),
(20, 1546529906290, 'CreateManufacturerTable1546529906290'),
(21, 1546530096773, 'CreateProductTagTable1546530096773'),
(22, 1546578299514, 'CreateLanguageTable1546578299514'),
(23, 1546578412979, 'AddProductRelatedRelationToProductTable1546578412979'),
(24, 1546578790576, 'CreateCategoryDescriptionTable1546578790576'),
(25, 1546579410193, 'CreateProductImageTable1546579410193'),
(26, 1546579597970, 'CreateEmailTemplateTable1546579597970'),
(27, 1546579614441, 'CreateProductDescriptionTable1546579614441'),
(28, 1546579884423, 'CreateProductToCategoryTable1546579884423'),
(29, 1546580085881, 'CreateCountryTable1546580085881'),
(30, 1546580179314, 'CreateProductDiscountTable1546580179314'),
(31, 1546580427531, 'CreateProductRatingTable1546580427531'),
(32, 1546580612161, 'CreateZoneTable1546580612161'),
(33, 1546580872313, 'CreateOrderProductTable1546580872313'),
(34, 1546580970382, 'CreateSettingsTable1546580970382'),
(35, 1546581203387, 'CreateOrderOptionTable1546581203387'),
(36, 1546581429998, 'CreateOrderTotalTable1546581429998'),
(37, 1546581683040, 'CreatePageGroupTable1546581683040'),
(38, 1546581933917, 'CreateOrderHistoryTable1546581933917'),
(39, 1546582132870, 'CreateOrderStatusTable1546582132870'),
(40, 1546582513520, 'CreatePageTable1546582513520'),
(41, 1546585163896, 'AddProductImageRelationToProductTable1546585163896'),
(42, 1546585326281, 'AddProductDiscountRelationToProductTable1546585326281'),
(43, 1546585460413, 'AddProductRatingRelationToProductTable1546585460413'),
(44, 1546585572765, 'AddPageRelationToPageGroupTable1546585572765'),
(45, 1546586351105, 'CreateZoneCountryRelationToZoneGeoTable1546586351105'),
(46, 1546587376381, 'CreateOrderTable1546587376381'),
(47, 1546588310183, 'CreateCountryRelationToZoneGeoTable1546588310183'),
(48, 1546588504951, 'CreateZoneRelationToCountryTable1546588504951'),
(49, 1546590314988, 'CreateCountryRelationToSettingsTable1546590314988'),
(50, 1546590433005, 'AddPoductToCategoryRelationToProductTable1546590433005'),
(51, 1546590872444, 'AddPoductToCategoryRelationToCategoryTable1546590872444'),
(52, 1546592870823, 'AddCustomerTransactionRelationToOrderTable1546592870823'),
(53, 1546593012207, 'AddCustomerTransactionRelationToCustomerTable1546593012207'),
(54, 1546593289549, 'AddOrderProductRelationToProductTable1546593289549'),
(55, 1546593359310, 'AddOrderProductRelationToOrderTable1546593359310'),
(56, 1546593427323, 'CreateCategoryRelationToCategoryDescriptionTable1546593427323'),
(57, 1546593494331, 'AddOrderOptionRelationToOrderTable1546593494331'),
(58, 1546593946185, 'AddOrderOptionRelationToOrderProductTable1546593946185'),
(59, 1546594100673, 'CreatebannerRelationToBannerImageDescriptionTable1546594100673'),
(60, 1546594184432, 'AddOrderHistoryRelationToOrderTable1546594184432'),
(61, 1546594262644, 'AddOrderHistoryRelationToOrderStatusTable1546594262644'),
(62, 1546594411489, 'CreateBannerImageRelationToBannerImageDescriptionTable1546594411489'),
(63, 1546594752832, 'AddOrderRelationToCustomerTable1546594752832'),
(64, 1546594852304, 'AddOrderRelationToCurrencyTable1546594852304'),
(65, 1546602183498, 'CreateBannerGroupRelationToBannerTable1546602183498');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `shipping_zone_id` int(11) DEFAULT NULL,
  `payment_zone_id` int(11) DEFAULT NULL,
  `shipping_country_id` int(11) DEFAULT NULL,
  `payment_country_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(45) DEFAULT NULL,
  `invoice_prefix` varchar(26) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `shipping_firstname` varchar(32) DEFAULT NULL,
  `shipping_lastname` varchar(32) DEFAULT NULL,
  `shipping_company` varchar(32) DEFAULT NULL,
  `shipping_address_1` varchar(128) DEFAULT NULL,
  `shipping_address_2` varchar(128) DEFAULT NULL,
  `shipping_city` varchar(128) DEFAULT NULL,
  `shipping_postcode` varchar(10) DEFAULT NULL,
  `shipping_country` varchar(128) DEFAULT NULL,
  `shipping_zone` varchar(128) DEFAULT NULL,
  `shipping_address_format` text,
  `shipping_method` varchar(128) DEFAULT NULL,
  `payment_firstname` varchar(32) DEFAULT NULL,
  `payment_lastname` varchar(32) DEFAULT NULL,
  `payment_company` varchar(32) DEFAULT NULL,
  `payment_address_1` varchar(128) DEFAULT NULL,
  `payment_address_2` varchar(128) DEFAULT NULL,
  `payment_city` varchar(128) DEFAULT NULL,
  `payment_postcode` varchar(10) DEFAULT NULL,
  `payment_country` varchar(128) DEFAULT NULL,
  `payment_zone` varchar(128) DEFAULT NULL,
  `payment_address_format` text,
  `payment_method` varchar(128) DEFAULT NULL,
  `comment` text,
  `total` decimal(10,0) DEFAULT NULL,
  `reward` int(8) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `commision` decimal(10,0) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `currency_value` decimal(11,0) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `payment_flag` int(3) DEFAULT NULL,
  `order_name` varchar(32) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `customer_id`, `currency_id`, `shipping_zone_id`, `payment_zone_id`, `shipping_country_id`, `payment_country_id`, `invoice_no`, `invoice_prefix`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_zone`, `shipping_address_format`, `shipping_method`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_zone`, `payment_address_format`, `payment_method`, `comment`, `total`, `reward`, `order_status_id`, `affiliate_id`, `commision`, `currency_code`, `currency_value`, `ip`, `payment_flag`, `order_name`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'SPU', NULL, NULL, 'demo@spurtcommerce.com', '0000000000', NULL, 'demo', 'user', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'demo', 'user', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2019-03-22 16:54:48', NULL),
(2, 1, NULL, NULL, NULL, NULL, NULL, '2', 'SPU', NULL, NULL, 'demo@spurtcommerce.com', '0000000000', NULL, 'demo', 'user', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'demo', 'user', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '15000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2019-03-22 16:57:52', '2019-03-22 16:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT NULL,
  `notify` tinytext,
  `comment` text,
  `date_added` datetime DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_log`
--

CREATE TABLE `order_log` (
  `order_log_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `shipping_zone_id` int(11) DEFAULT NULL,
  `payment_zone_id` int(11) DEFAULT NULL,
  `shipping_country_id` int(11) DEFAULT NULL,
  `payment_country_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(45) DEFAULT NULL,
  `invoice_prefix` varchar(26) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `email` varchar(96) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `shipping_firstname` varchar(32) DEFAULT NULL,
  `shipping_lastname` varchar(32) DEFAULT NULL,
  `shipping_company` varchar(32) DEFAULT NULL,
  `shipping_address_1` varchar(128) DEFAULT NULL,
  `shipping_address_2` varchar(128) DEFAULT NULL,
  `shipping_city` varchar(128) DEFAULT NULL,
  `shipping_postcode` varchar(10) DEFAULT NULL,
  `shipping_country` varchar(128) DEFAULT NULL,
  `shipping_zone` varchar(128) DEFAULT NULL,
  `shipping_address_format` text,
  `shipping_method` varchar(128) DEFAULT NULL,
  `payment_firstname` varchar(32) DEFAULT NULL,
  `payment_lastname` varchar(32) DEFAULT NULL,
  `payment_company` varchar(32) DEFAULT NULL,
  `payment_address_1` varchar(128) DEFAULT NULL,
  `payment_address_2` varchar(128) DEFAULT NULL,
  `payment_city` varchar(128) DEFAULT NULL,
  `payment_postcode` varchar(10) DEFAULT NULL,
  `payment_country` varchar(128) DEFAULT NULL,
  `payment_zone` varchar(128) DEFAULT NULL,
  `payment_address_format` text,
  `payment_method` varchar(128) DEFAULT NULL,
  `comment` text,
  `total` decimal(15,4) DEFAULT NULL,
  `reward` int(8) DEFAULT NULL,
  `order_status_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `commision` decimal(10,0) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `currency_value` decimal(11,0) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `payment_flag` int(3) DEFAULT NULL,
  `order_name` varchar(32) DEFAULT NULL,
  `is_active` varchar(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_log`
--

INSERT INTO `order_log` (`order_log_id`, `customer_id`, `currency_id`, `shipping_zone_id`, `payment_zone_id`, `shipping_country_id`, `payment_country_id`, `invoice_no`, `invoice_prefix`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_zone`, `shipping_address_format`, `shipping_method`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_zone`, `payment_address_format`, `payment_method`, `comment`, `total`, `reward`, `order_status_id`, `affiliate_id`, `commision`, `currency_code`, `currency_value`, `ip`, `payment_flag`, `order_name`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(19, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:19:38', NULL),
(20, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:19:38', '2019-02-19 04:54:25'),
(21, 57, NULL, NULL, NULL, NULL, NULL, '54', 'spu', NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, '20.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:20:40', '2019-02-18 04:20:40'),
(22, 57, NULL, NULL, NULL, NULL, NULL, '54', 'spu', NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, '20.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:20:40', '2019-02-19 05:28:09'),
(23, 57, NULL, NULL, NULL, NULL, NULL, '54', 'spu', NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, '20.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:20:40', '2019-02-19 05:28:16'),
(24, 57, NULL, NULL, NULL, NULL, NULL, '54', 'spu', NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, '20.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:20:40', '2019-02-19 05:28:39'),
(25, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:19:38', '2019-02-19 04:55:42'),
(26, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:19:38', '2019-02-19 05:29:59'),
(27, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:19:38', '2019-02-19 05:39:26'),
(28, 67, NULL, NULL, NULL, NULL, NULL, '55', 'spu', NULL, NULL, 'ganesh.picco@gmail.com', '1234567890', NULL, 'ganesh', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, 'ganesh', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, NULL, '120.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-19 08:27:27', '2019-02-19 08:27:27'),
(29, 67, NULL, NULL, NULL, NULL, NULL, '55', 'spu', NULL, NULL, 'ganesh.picco@gmail.com', '1234567890', NULL, 'ganesh', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, 'ganesh', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, NULL, '120.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-19 08:27:27', '2019-02-22 01:35:13'),
(30, 67, NULL, NULL, NULL, NULL, NULL, '57', 'spu', NULL, NULL, 'ganesh.picco@gmail.com', '1234567890', NULL, 'ganesh3', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, 'ganesh3', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, NULL, '120.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-19 08:27:45', '2019-02-19 08:27:45'),
(31, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:19:38', '2019-02-19 06:48:49'),
(32, 57, NULL, NULL, NULL, NULL, NULL, '54', 'spu', NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, '20.0000', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:20:40', '2019-02-19 05:28:48'),
(33, 67, NULL, NULL, NULL, NULL, NULL, '55', 'spu', NULL, NULL, 'ganesh.picco@gmail.com', '1234567890', NULL, 'ganesh', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, 'ganesh', 'v', 'picco', 'chennai', NULL, 'chennai', '601301', 'india', 'IND', '1', NULL, NULL, '120.0000', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-19 08:27:27', '2019-02-22 01:38:39'),
(34, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'veerapandi.picco@gmail.com', '9876543210', NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, 'Mani', 'Kandan', NULL, 'North Street', NULL, 'Chennai', '1234', 'India', 'CH', NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-18 04:19:38', '2019-02-22 06:17:44'),
(35, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 02:31:23'),
(36, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 04:38:53'),
(37, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 04:59:49'),
(38, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:03:31'),
(39, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:04:36'),
(40, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:12:33'),
(41, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:23:35'),
(42, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:24:16'),
(43, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:27:54'),
(44, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:30:16'),
(45, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:34:03'),
(46, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:38:17'),
(47, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 05:42:43'),
(48, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-02-27 06:11:54'),
(49, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-03-01 23:01:49'),
(50, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-03-02 00:08:16'),
(51, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-03-02 00:09:05'),
(52, 92, NULL, NULL, NULL, NULL, NULL, '70', 'spu', NULL, NULL, 'jayaprakash.picco@gmail.com', '9751511373', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'nagercoil', '629501', '22', 'tamilnadu', '', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'nagercoil', '629501', '22', 'tamilnadu', '', NULL, NULL, '44.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-01 23:08:00', '2019-03-01 23:08:01'),
(53, 84, NULL, NULL, NULL, NULL, NULL, '69', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '47800.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-28 05:40:28', '2019-02-28 05:40:28'),
(54, 84, NULL, NULL, NULL, NULL, NULL, '69', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '47800.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-28 05:40:28', '2019-03-02 00:12:15'),
(55, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-03-02 00:09:50'),
(56, 108, NULL, NULL, NULL, NULL, NULL, '72', 'spu', NULL, NULL, 'veer@gmail.com', '1234567890', NULL, 'veer', 'veer', '', 'veer', 'veer', 'chennai', '764567', '22', 'tamilnadu', '', NULL, 'veer', 'veer', '', 'veer', 'veer', 'chennai', '764567', '22', 'tamilnadu', '', NULL, NULL, '30000.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-05 06:50:56', '2019-03-05 06:50:56'),
(57, 108, NULL, NULL, NULL, NULL, NULL, '72', 'spu', NULL, NULL, 'veer@gmail.com', '1234567890', NULL, 'veer', 'veer', '', 'veer', 'veer', 'chennai', '764567', '22', 'tamilnadu', '', NULL, 'veer', 'veer', '', 'veer', 'veer', 'chennai', '764567', '22', 'tamilnadu', '', NULL, NULL, '30000.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-05 06:50:56', '2019-03-05 07:29:08'),
(58, 108, NULL, NULL, NULL, NULL, NULL, '72', 'spu', NULL, NULL, 'veer@gmail.com', '1234567890', NULL, 'veer', 'veer', '', 'veer', 'veer', 'chennai', '764567', '22', 'tamilnadu', '', NULL, 'veer', 'veer', '', 'veer', 'veer', 'chennai', '764567', '22', 'tamilnadu', '', NULL, NULL, '30000.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-05 06:50:56', '2019-03-05 07:29:16'),
(59, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-03-02 01:33:51'),
(60, 84, NULL, NULL, NULL, NULL, NULL, '68', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '47800.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-28 05:38:44', '2019-02-28 05:38:44'),
(61, 83, NULL, NULL, NULL, NULL, NULL, '66', 'spu', NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, '8844.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-27 02:31:22', '2019-03-06 04:17:53'),
(62, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-28 05:33:31', NULL),
(63, 84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'vijayalakshmi.picco@gmail.com', '9756795679', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, 'vijayalakshmi', 's', 'ggg', 'ff', 'fff', 'ffff', '36763', 'cjx', 'dfgj', 'dfgj', NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-02-28 05:33:31', '2019-03-07 00:48:43'),
(64, 138, NULL, NULL, NULL, NULL, NULL, '73', 'spu', NULL, NULL, 'jayaprakash.picco@gmail.com', '9751511373', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, NULL, '38197.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-07 07:11:09', '2019-03-07 07:11:10'),
(65, 145, NULL, NULL, NULL, NULL, NULL, '75', 'spu', NULL, NULL, 'amit.picco@gmail.com', '9771234532', NULL, 'amit', 'bhaiya', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'taminadu', '', NULL, 'amit', 'bhaiya', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'taminadu', '', NULL, NULL, '25000.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-11 08:46:46', '2019-03-11 08:46:46'),
(66, 150, NULL, NULL, NULL, NULL, NULL, '76', 'SPU', NULL, NULL, 'pavithra.picco@gmail.com', '9091192019', NULL, 'Pavithra', 'Test', 'Web', 'Springbrook', 'Springbrook', 'Illinois', '78898', '22', 'Chicago', 'TGM', NULL, 'Pavithra', 'Test', 'Web', 'Springbrook', 'Springbrook', 'Illinois', '78898', '22', 'Chicago', 'TGM', NULL, NULL, '150000.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-03-13 02:07:45', '2019-03-13 02:07:45'),
(67, 138, NULL, NULL, NULL, NULL, NULL, '73', 'SPU', NULL, NULL, 'jayaprakash.picco@gmail.com', '9751511373', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, NULL, '38197.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-07 07:11:09', '2019-03-11 23:45:22'),
(68, 145, NULL, NULL, NULL, NULL, NULL, '80', '002', NULL, NULL, 'ganesh.picco@gmail.com', '1234567890', NULL, 'ganesh', 'v', '', 'chennai', 'chennai', 'chennai', '600044', '22', 'tamilnadu', 'demo', NULL, 'ganesh', 'v', '', 'chennai', 'chennai', 'chennai', '600044', '22', 'tamilnadu', 'demo', NULL, NULL, '1999.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-15 04:17:27', '2019-03-15 04:17:27'),
(69, 138, NULL, NULL, NULL, NULL, NULL, '73', 'SPU', NULL, NULL, 'jayaprakash.picco@gmail.com', '9751511373', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, NULL, '38197.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-07 07:11:09', '2019-03-16 06:42:45'),
(70, 145, NULL, NULL, NULL, NULL, NULL, '75', 'SPU', NULL, NULL, 'amit.picco@gmail.com', '9771234532', NULL, 'amit', 'bhaiya', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'taminadu', '', NULL, 'amit', 'bhaiya', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'taminadu', '', NULL, NULL, '25000.0000', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-11 08:46:46', '2019-03-11 23:45:36'),
(71, 145, NULL, NULL, NULL, NULL, NULL, '80', 'SPU', NULL, NULL, 'ganesh.picco@gmail.com', '1234567890', NULL, 'ganesh', 'v', '', 'chennai', 'chennai', 'chennai', '600044', '22', 'tamilnadu', 'demo', NULL, 'ganesh', 'v', '', 'chennai', 'chennai', 'chennai', '600044', '22', 'tamilnadu', 'demo', NULL, NULL, '1999.0000', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-15 04:17:27', '2019-03-17 20:50:23'),
(72, 149, NULL, NULL, NULL, NULL, NULL, '85', 'SPU', NULL, NULL, 'veerapandi.picco@gmail.com', '888888888888888', NULL, 'Veerapandi', 'M', '', 'No-74,Kattu Kollai Street, Gummidipoondi', 'No-74,Kattu Kollai Street, Gummidipoondi', 'Chennai', '60001', '22', 'Tamil Nadu', 'North', NULL, 'Veerapandi', 'M', '', 'No-74,Kattu Kollai Street, Gummidipoondi', 'No-74,Kattu Kollai Street, Gummidipoondi', 'Chennai', '60001', '22', 'Tamil Nadu', 'North', NULL, NULL, '58999.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-20 00:25:50', '2019-03-20 00:25:50'),
(73, 138, NULL, NULL, NULL, NULL, NULL, '73', 'SPU', NULL, NULL, 'jayaprakash.picco@gmail.com', '9751511373', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, 'jaya', 'prakash', '', 'chennai', 'chennai', 'chennai', '600001', '22', 'tamilnadu', '', NULL, NULL, '38197.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-07 07:11:09', '2019-03-18 05:38:21'),
(74, 150, NULL, NULL, NULL, NULL, NULL, '77', 'SPU', NULL, NULL, 'karthick.picco@gmail.com', '9887766543', NULL, 'karthick', 'G', 'picco soft', 'madipakkam, chennai', 'madipakkam, chennai', 'chennai', '766555', '22', 'tamil nadu', 'pallavaram, chennai', NULL, 'karthick', 'G', 'picco soft', 'madipakkam, chennai', 'madipakkam, chennai', 'chennai', '766555', '22', 'tamil nadu', 'pallavaram, chennai', NULL, NULL, '1200.0000', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-13 06:43:25', '2019-03-13 06:43:26'),
(75, 173, NULL, NULL, NULL, NULL, NULL, '88', 'SPU', NULL, NULL, 'sou.piccosoft@gmail.com', '9874561230', NULL, 'Anu', 'Radha', 'picco', 'no2subramaiyastreetpalakkadkerala.', 'no2subramaiyastreetpalakkadkerala.', 'palakkad', '1456536', '22', 'kerala', '', NULL, 'Anu', 'Radha', 'picco', 'no2subramaiyastreetpalakkadkerala.', 'no2subramaiyastreetpalakkadkerala.', 'palakkad', '1456536', '22', 'kerala', '', NULL, NULL, '335.0000', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-21 00:18:35', '2019-03-21 00:18:35'),
(76, 173, NULL, NULL, NULL, NULL, NULL, '88', 'SPU', NULL, NULL, 'sou.piccosoft@gmail.com', '9874561230', NULL, 'Anu', 'Radha', 'picco', 'no2subramaiyastreetpalakkadkerala.', 'no2subramaiyastreetpalakkadkerala.', 'palakkad', '1456536', '22', 'kerala', '', NULL, 'Anu', 'Radha', 'picco', 'no2subramaiyastreetpalakkadkerala.', 'no2subramaiyastreetpalakkadkerala.', 'palakkad', '1456536', '22', 'kerala', '', NULL, NULL, '335.0000', NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '2019-03-21 00:18:35', '2019-03-21 00:45:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_option`
--

CREATE TABLE `order_option` (
  `order_option_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_product_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_product_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(24) NOT NULL,
  `quantity` int(4) NOT NULL,
  `trace` decimal(15,4) DEFAULT NULL,
  `total` decimal(15,4) NOT NULL,
  `tax` decimal(15,4) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`order_product_id`, `product_id`, `order_id`, `name`, `model`, `quantity`, `trace`, `total`, `tax`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 145, 2, 'Sanyo 138.8 cm (55 Inches) 4K UHD IPS LED Smart Certified Android TV XT', 'samsung', 1, NULL, '15000.0000', NULL, NULL, NULL, NULL, '2019-03-22 16:57:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `color_code` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `name`, `color_code`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 'Pending', '#128dae', 1, NULL, NULL, '2019-02-19 04:04:03', '2019-03-20 03:58:32'),
(2, 'Completed', '#25a006', 0, NULL, NULL, '2019-02-19 04:04:21', '2019-03-15 00:06:24'),
(3, 'Hold', '#f71d1d', 1, NULL, NULL, '2019-02-19 04:04:58', '2019-03-19 08:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_total`
--

CREATE TABLE `order_total` (
  `order_total_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `value` decimal(15,4) NOT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_total`
--

INSERT INTO `order_total` (`order_total_id`, `order_id`, `code`, `title`, `text`, `value`, `sort_order`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 2, NULL, NULL, NULL, '15000.0000', NULL, NULL, NULL, NULL, '2019-03-22 16:57:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` text,
  `full_text` text,
  `page_group_id` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `meta_tag_title` varchar(255) DEFAULT NULL,
  `meta_tag_description` varchar(255) DEFAULT NULL,
  `meta_tag_keywords` varchar(255) DEFAULT NULL,
  `view_page_count` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`page_id`, `title`, `intro`, `full_text`, `page_group_id`, `sort_order`, `meta_tag_title`, `meta_tag_description`, `meta_tag_keywords`, `view_page_count`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(130, 'COMPANY', NULL, '<ul>\n	<li>\n	<p>This InDesign Brochure is Clean &amp; Professional. Create your company&#39;s documentation quick and easy. The template comes with paragraph and character styles, swatches, styles for your spreadsheet / financial info, block quotes, key figures layout, and much more</p>\n	</li>\n</ul>\n', NULL, NULL, 'Company Profile', 'If you continue to have trouble, check out this help file for more tips.', 'company profile', NULL, 0, NULL, NULL, '2019-03-14 06:08:56', '2019-03-21 01:11:19'),
(132, 'RESOURCES', NULL, '<h2><img alt="" src="https://www.google.com/url?sa=i&amp;source=images&amp;cd=&amp;cad=rja&amp;uact=8&amp;ved=2ahUKEwjNqoesyoHhAhUI7HMBHQuNAu8QjRx6BAgBEAU&amp;url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fbeautiful%2F&amp;psig=AOvVaw3BVX6YphWlhIlgpF7S6C_i&amp;ust=1552651106648620" /></h2>\n\n<p>&nbsp;</p>\n\n<h2>a stock or supply of money, materials, staff, and other assets that can be drawn on by a person or organization in order to function effectivel.</h2>\n', NULL, NULL, 'Resources information', 'New Resources Page full of information @2019', ' Resources Page full of information', NULL, 1, NULL, NULL, '2019-03-14 06:16:25', '2019-03-15 00:38:22'),
(133, 'ABOUT US', NULL, '<p><strong>piccocart.com&nbsp;is an Indian e-commerce company based in Chennai, India. Founded by Mr&nbsp;</strong><strong>Suresh Sekar, the company initially focused on software Development, before expanding into other product categories such as consumer electronics, fashion, and lifestyle products.</strong></p>\n', NULL, NULL, 'about us', 'about us', 'The total cost of ownership for software created in this manner is reduced', NULL, 1, NULL, NULL, '2019-03-14 06:30:33', '2019-03-21 00:30:14'),
(138, 'Page Info', NULL, '<p>Description</p>\n', NULL, NULL, '', '', '', NULL, 0, NULL, NULL, '2019-03-21 00:31:43', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_group`
--

CREATE TABLE `page_group` (
  `page_group_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `sku` varchar(64) DEFAULT NULL,
  `upc` varchar(12) DEFAULT NULL,
  `quantity` int(4) DEFAULT NULL,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `image_path` text,
  `manufacturer_id` int(11) DEFAULT NULL,
  `shipping` tinyint(4) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `date_available` date DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `amount` float DEFAULT NULL,
  `meta_tag_title` varchar(255) DEFAULT NULL,
  `meta_tag_description` varchar(255) DEFAULT NULL,
  `meta_tag_keyword` varchar(255) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `subtract_stock` int(11) DEFAULT NULL COMMENT '0->no 1->yes',
  `minimum_quantity` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `wishlist_status` int(11) DEFAULT NULL,
  `delete_flag` int(11) NOT NULL DEFAULT '0',
  `is_featured` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `condition` int(11) DEFAULT NULL COMMENT '1->new 2->used',
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `sku`, `upc`, `quantity`, `stock_status_id`, `image`, `image_path`, `manufacturer_id`, `shipping`, `price`, `date_available`, `sort_order`, `name`, `description`, `amount`, `meta_tag_title`, `meta_tag_description`, `meta_tag_keyword`, `discount`, `subtract_stock`, `minimum_quantity`, `location`, `wishlist_status`, `delete_flag`, `is_featured`, `rating`, `condition`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(145, 'TV -12', '', 2, 2, NULL, NULL, 32, 2, '15000', NULL, 0, 'Sanyo 138.8 cm (55 Inches) 4K UHD IPS LED Smart Certified Android TV XT', '<p>&nbsp;Resolution : Full HD (1920x1080p) | Refresh Rate: 60 hertz<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Connectivity: 3 HDMI ports to connect set top box, Blu Ray players, gaming console, 2 USB ports to connect hard drives and other USB devices<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Sound: 20 W output | DTS-HD sound<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Smart TV features : | PatchWall with Android TV and Set-Top Box Integration | Chromecast built-in | 700,000+ hrs of Content | Mi Remote with Google voice search | Content across 15 languages | Play Store, YouTube, Play Movies, Play Music | Hotstar, Voot, Sony LIV, Hungama, Zee5, Eros Now, Alt Balaji, Sun NXT, Hooq, TVF, Epic ON, Flickstree| Prime Video coming soon | Mi Remote controls TV, set-top box and smart home devices eg. Mi Air Purifier<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Warranty Information: 1 year warranty on product and 1 year extra on Panel<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;For any Warranty related issues/clarifications, please directly call Xiaomi support on 18001036286 and provide product&#39;s model name as well as seller&#39;s details mentioned on the invoice<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Easy returns: This product is eligible for replacement/refund within 10 days of delivery in case of any product defects, damage or features not matching the description provided<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Additional Information : 14+ Content Partners&nbsp;</p>\n', NULL, '', NULL, NULL, NULL, 0, 0, '', 0, 0, 0, NULL, 1, 1, NULL, NULL, '2019-03-18 03:38:01', '2019-03-21 00:52:01'),
(146, 'WH -65', '', 2, 2, NULL, NULL, 32, 2, '23000', NULL, 0, 'Bosch 7 kg Fully Automatic Front Load Washing Machine White', '<p>&nbsp;</p>\n\n<p>Now, you can dress to impress every day in spotless and hygienic garments, thanks to this IFB 6 kg Fully-automatic washing machine. This essential home appliance features the Auto Imbalance Vibration Control technology, the Ball Valve Technology, and a Crescent Moon Drum for quick and efficient washing of your laundry.</p>\n', NULL, '', NULL, NULL, NULL, 0, 0, '', 0, 0, 1, NULL, 2, 1, NULL, NULL, '2019-03-18 03:40:29', '2019-03-21 00:51:34'),
(148, 'S0098', '', 3, 2, NULL, NULL, 30, 1, '30000', '2019-03-16', 1, 'Nikon D5300 24.2MP Digital SLR Camera', '<p>24.2 effective megapixels<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;23.5 x 15.6 mm DX format CMOS sensor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;3.2-inch LCD vari-angle monitor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;EXPEED 4 processor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Built-in WiFi<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Full HD (1920 x 1080) movie, frame rate selectable from 60p/50p/30p/25p/24p<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Comes with a 18-55mm VR kit lens, BF-1B body cap, BS-1 accessory shoe cover, DK-25 rubber eyecup<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Also includes MH-24 battery charger, UC-E17 USB cable, DK-5 eyepiece cap, viewNX 2 CD, EN-EL14a rechargeable Li-ion battery, EG-CP16 audio/video cable, AN-DC3 strap, reference CD, 8GB card and camera bag<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Warranty details: 2 Years</p>\n', NULL, 'camera', NULL, NULL, NULL, 1, 1, 'india', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 04:13:39', '2019-03-20 13:23:03'),
(149, 'S00078', '', 5, 1, NULL, NULL, 33, 1, '8999', '2019-03-23', 1, 'Sony DSC W830 Cyber-shot 20.1 MP Point and Shoot Camera', '<p>Super HAD CCD sensor with 20.1 effective megapixels<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;720p MP4 movie mode the camera shoots 1280 x 720 high definition movies at 30 fps<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;8x optical zoom Carl Zeiss Vario Tessar lens.Refer user manual<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Equipped with sweep panorama, intelligent auto and picture effect<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;2.7-inch (230K dots) clear photo LCD display, Fpr any queries call brand toll free number: 18001037799</p>\n', NULL, 'Camera', NULL, NULL, NULL, 1, 4, 'Bangalore', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 04:17:55', '2019-03-20 13:23:03'),
(150, 'S003', '', 3, 1, NULL, NULL, 22, 2, '499', '2019-03-14', 1, 'Latest Collection 100% Cotton Full Sleeve Plain Men Tshirt ', '<p>100% COTTON MATERIAL || FULL SLEEVE T-SHIRT<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;MFG : Flat Knitting || Wash Care : Dry Clean Only, Do not wring<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;This Product Uniquely designed by SDK Fashion.<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Disclaimer :- PRODUCT COLOR MAY SLIGHTLY VARY DUE TO PHOTOGRAPHIC LIGHTING SOURCES OR YOUR MONITOR SETTINGS.<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;SDK FashionSportsSlippers shoe</p>\n', NULL, 'shirt', NULL, NULL, NULL, 1, 8, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 04:21:54', '2019-03-20 13:23:03'),
(151, 'S0034', '', 6, 2, NULL, NULL, 25, 1, '700', '2019-03-08', 0, 'Jockey Men\'s Cotton T-Shirt', '<p>Product comes in assorted prints. Actual colors and prints might vary for the image shown &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;on the website<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Collection: 24 x 7 ; Style no: 2714<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;80% cotton &amp; 20% poly<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Premium Combed Cotton rich fabric<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Modern fit<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Ribbed crew-neck prevents sagging<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Authentic Jockey logo label<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;To be worn as loungewear leisurewear<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;sportswear and innerwear</p>\n', NULL, 't-shirt sleeve', NULL, NULL, NULL, 1, 4, 'London', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 04:30:54', '2019-03-21 00:51:39'),
(152, 'S0090', '', 5, 1, NULL, NULL, 34, 2, '1299', '2019-03-15', 0, 'Campus Sutra Men Shaded Side Red Stripe Stitching Denim Jeans', '<p>&nbsp;Fit Type: Slim Fit<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Material: denim<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Belt closure<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Machine wash<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Stay True<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Slim Fit<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Low-Rise</p>\n', NULL, 'pant', NULL, NULL, NULL, 1, 3, 'India', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 04:35:15', '2019-03-21 00:51:17'),
(153, 'S001', 'Le-001', 10, 2, NULL, NULL, 23, 1, '46900', '2019-03-17', 1, 'Dell Alienware 15 15.6-inch Laptop', '<p>1.6GHz Intel Core i5-8210Y processor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;8GB LPDDR3 RAM<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;128GB hard drive<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Stunning 13.3-inch Retina display, Intel UHD Graphics 617 Graphics<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1.25kg laptop<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;This model has two Thunderbolt 3 ports; These two ports support charging the notebook, DisplayPort, Thunderbolt (up to 40 Gbps) and USB 3.1 Generation 2 (up to 10 Gbps); It has 3 internal microphones; single 3.5-inch analog audio output/headphone jack<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;This model has a 2560 by 1600 native resolution at 227 ppi and support for millions of colors; It also supports scaled resolutions of 1680 by 1050, 1440 by 900 and 1024 by 640; It has a 16:10 aspect ratio<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Battery and Power: 30W USB-C Power Adapter<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;provides up to 12 hours wireless web and up to 13 hours iTunes movie playback<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Touch ID<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Fast SSD storage<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Stereo speakers with wider stereo sound<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Latest Apple-designed keyboard<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Force Touch trackpad<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;802.11ac Wi-Fi<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;macOS Mojave, inspired by pros but designed for everyone, with Dark Mode, Stacks, easier screenshots, new built-in apps and more</p>\n', NULL, 'lap', NULL, NULL, NULL, 1, 0, 'Chennai', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 04:36:20', '2019-03-20 06:13:32'),
(154, 'S001', 'Le-001', 10, 2, NULL, NULL, 23, 1, '46900', '2019-03-17', 1, 'Dell Alienware 15 15.6-inch Laptop', '<p>1.6GHz Intel Core i5-8210Y processor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;8GB LPDDR3 RAM<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;128GB hard drive<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Stunning 13.3-inch Retina display, Intel UHD Graphics 617 Graphics<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;1.25kg laptop<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;This model has two Thunderbolt 3 ports; These two ports support charging the notebook, DisplayPort, Thunderbolt (up to 40 Gbps) and USB 3.1 Generation 2 (up to 10 Gbps); It has 3 internal microphones; single 3.5-inch analog audio output/headphone jack<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;This model has a 2560 by 1600 native resolution at 227 ppi and support for millions of colors; It also supports scaled resolutions of 1680 by 1050, 1440 by 900 and 1024 by 640; It has a 16:10 aspect ratio<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Battery and Power: 30W USB-C Power Adapter<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;provides up to 12 hours wireless web and up to 13 hours iTunes movie playback<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Touch ID<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Fast SSD storage<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Stereo speakers with wider stereo sound<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Latest Apple-designed keyboard<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Force Touch trackpad<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;802.11ac Wi-Fi<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;macOS Mojave, inspired by pros but designed for everyone, with Dark Mode, Stacks, easier screenshots, new built-in apps and more</p>\n', NULL, 'lap', NULL, NULL, NULL, 1, 0, 'Chennai', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 04:38:14', '2019-03-20 06:16:57'),
(155, 'S440', '', 7, 1, NULL, NULL, 32, 1, '50000', '2019-03-29', 3, 'Apple iPhone X', '<p>Camera: 12+12 MP Dual rear camera with Dual optical image stabilization, Portrait &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Mode, Digital zoom up to 10x, Quad-LED True tone flash and Slow sync, 4K &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Video recording at 24 fps or 30 fps or 60 fps and Slow-motion video recording &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;in 1080p at 120 fps | 7 MP front TrueueeDepth camera with Retina Flash.<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Display: 14.73 centimeters (5.8-inch) Full HD+ capacitive touchscreen display with 2436x1125 pixels<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Memory, Storage &amp; SIM: 3GB RAM | 64GB storage | Single nano SIM<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Operating System and Processor: iOS v11.1.1 operating system with 1.3GHz Apple A11 Bionic hexa core processor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Battery: 2716 mAH lithium ion battery providing talk-time of 21 hours<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Warranty: 1 year manufacturer warranty for device and in-box accessories including batteries from the date of purchase<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Included in box: Ear pods with Lightning connector (wired), Lightning to 3.5mm Headphone jack adaptor, Lightning to USB Cable and USB Power adaptor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Other features: Face ID, Wireless charging, Splash, Water and Dust resistant.</p>\n', NULL, 'samsung A+', NULL, NULL, NULL, 1, 3, 'Bangalore', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 04:44:21', '2019-03-19 06:08:25'),
(156, 'S070', '', 4, 1, NULL, NULL, 34, 1, '699', '2019-03-07', 1, 'Levi\'s Men\'s Slim Fit Chinos', '<p>Color: Brown<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Fit Type: Slim Fit<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;97% Cotton and 3% elastane<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Zip fly with button closure<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Slim fit<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Hand wash<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Made in India</p>\n', NULL, 'slim fit jean', NULL, NULL, NULL, 1, 16, 'Tiruvannamalai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 04:59:43', '2019-03-22 16:51:21'),
(157, 'S0045', '', 5, 1, NULL, NULL, 30, 1, '990', '2019-03-14', 1, 'Addic Analog White Dial Women\'s Watch ', '<p>&nbsp;Dial Color: White, Case Shape: Round, Dial Glass Material: Glass<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Band Color: Rose Gold, Band Material: Stainless Steel<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Watch Movement Type: Quartz, Watch Display Type: Analog<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Case Material: Stainless Steel, Case Diameter: 20 millimeters<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Water Resistance Depth: Mild Resistance, Not for Swimming meters<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;6 months manufacturer warranty on manufacturing defects<br />\n&nbsp;</p>\n', NULL, '', NULL, NULL, NULL, 1, 2, 'Chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 05:12:34', '2019-03-20 06:43:18'),
(158, 'S1100', '', 39, 1, NULL, NULL, 30, 1, '445', '2019-03-23', 1, 'Sonata Analog multicolor Dial Women\'s Watch -NK8048SM04', '<p>100% Safety Strap Comfortable | All Product Is Genuinely tested before dispatching<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Display: Analogue | Strap Material: High Quality Leather | Movement: Quartz | Case : Metal<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Meenakshi Handicraft Emporium New Arrival Special Collection Of Festive Seasons | New Arrival Special Attractive Stylish Collection Of Festive Seasons Classy and Elegant Look | Wrist watches<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Wearability : Casual | Look : Designer &amp; Attractive | Gender : Girls and Women | Designer For Young People &amp; Teenagers of India | Design :Classic &amp; Stylish<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Warranty: 30 Days, Applicable Only On The Mechanism/Movement/Circuit. Please Refer Warranty Terms Conditions.</p>\n', NULL, 'Sonata Analog womens watch', NULL, NULL, NULL, 1, 3, 'Tamilnadu', 0, 0, 0, NULL, 1, 1, NULL, NULL, '2019-03-18 05:19:23', '2019-03-20 06:44:52'),
(159, 'S0090', '', 15, 2, NULL, NULL, 23, 1, '49445', '2019-03-30', 1, 'Mi LED TV 4A PRO 123.2 cm (49) Full HD Android TV (Black)', '<p>Resolution : Full HD (1920x1080p) | Refresh Rate: 60 hertz<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Connectivity: 3 HDMI ports to connect set top box, Blu Ray players, gaming console, 2 USB ports to connect hard drives and other USB devices<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Sound: 20 W output | DTS-HD sound<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Smart TV features : | PatchWall with Android TV and Set-Top Box Integration | Chromecast built-in | 700,000+ hrs of Content | Mi Remote with Google voice search | Content across 15 languages | Play Store, YouTube, Play Movies, Play Music | Hotstar, Voot, Sony LIV, Hungama, Zee5, Eros Now, Alt Balaji, Sun NXT, Hooq, TVF, Epic ON, Flickstree| Prime Video coming soon | Mi Remote controls TV, set-top box and smart home devices eg. Mi Air Purifier<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Warranty Information: 1 year warranty on product and 1 year extra on Panel<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;For any Warranty related issues/clarifications, please directly call Xiaomi support on 18001036286 and provide product&#39;s model name as well as seller&#39;s details mentioned on the invoice<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Easy returns: This product is eligible for replacement/refund within 10 days of delivery in case of any product defects, damage or features not matching the description provided<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Additional Information : 14+ Content Partners&nbsp;</p>\n', NULL, 'LED TV 4A pro', NULL, NULL, NULL, 1, 6, 'Chennai', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 05:28:10', '2019-03-18 05:40:25'),
(160, 'S0046', '', 2, 2, NULL, NULL, 22, 1, '1099', '2019-02-24', 1, 'vaikunth fabrics Women\'s Rayon Embroidered Kurtis', '<ul>\n	<li>Care Instructions: Dry Clean Only</li>\n	<li>Kurti (top) Fabric : Rayon</li>\n	<li>Kurti Type : Gown Style</li>\n	<li>Kurti Color : Blue</li>\n	<li>Sleeve Type : 3/4 Sleeve</li>\n	<li>Length : Long Length Stitched Type : Stitched Kurti Inside The Box : 1 Kurti Wash Care : Dry Clean Only Work Type : Gold Printed and Embroidered Occasion Type : Festive and Party</li>\n</ul>\n', NULL, 'womens dress', NULL, NULL, NULL, 1, 2, 'Chennai', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 05:58:20', '2019-03-20 06:54:34'),
(161, 'S0098', '', 10, 2, NULL, NULL, 25, 2, '899', '2019-03-01', 1, 'Madhuram Textiles Women\'s Rayon Princess Cut Kurta', '<ul>\n	<li>Style : Readymade Full Sleeve Rayon Kurti With Collar</li>\n	<li>Color : Red</li>\n	<li>Wash Care : Easy Wash, Gently Wash, Wash seperately</li>\n	<li>Package Contains : 1 Readymade Long Kurti</li>\n	<li>Colour Declaration : There might be slight variation in the actual color of the product due to different screen resolutions.</li>\n</ul>\n', NULL, 'Madhuram Textiles Women kurta\'s', NULL, NULL, NULL, 1, 9, 'Chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 06:02:24', '2019-03-20 06:56:47'),
(162, 'S00078', '', 2, 1, NULL, NULL, 29, 1, '1220', '2019-03-19', 1, 'Rrimin Portable Ocean Ball Pit Pool', '<p>Set up or put away a playground in seconds with its twist technology. Adult supervision required</p>\n\n<p>Made from extra-sturdy material for a longer life,its small size is easy to fit in compact home or kids room</p>\n\n<p>Cartoon pattern play tent,princess theme play pen for children with safety meshing for child play visibility.great fun for children or pets</p>\n\n<p>It is great for indoor or outdoor use ideal for backyard, parks, parties, day care and more comes complete with sturdy poles for quick and easy assembly</p>\n', NULL, 'Rrimin Portable Ocean Ball Pit Pool', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 06:14:26', '2019-03-20 06:21:26'),
(163, 'S00123', '', 1, 2, NULL, NULL, 29, 1, '990', '2019-03-14', 1, 'Intex Inflatable Kids Bath Tub-3Ft', '<p>Sunset glow baby pool</p>\n\n<p>20mm rings with 18mm floor</p>\n\n<p>It has 3 rings ,Total Size : 86cm * 25cm</p>\n\n<p>Soft inflatable floor</p>\n\n<p>Capacity 17cm of wall height is 68 litre</p>\n\n<p>With repair patch</p>\n\n<p>Age upto 2 years</p>\n', NULL, 'Intex Inflatable Kids Bath Tub-3Ft', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 06:22:47', '2019-03-20 06:25:26'),
(164, 'S0021', '', 1, 1, NULL, NULL, 27, 1, '790', '2019-03-23', 1, 'Building Block Toy For Kids', '<p>Multi-color building block for kids comes with 20 pieces</p>\n\n<p>Children have lively imagination. This building block toy provides tremendous possibilities for a child to develop skill, broaden imagination and use intelligence creatively</p>\n\n<p>Made in india, non-toxic plastic, smooth texture, no sharp edges</p>\n\n<p>Guide book comes with this building block game to help kids assemble different models</p>\n\n<p>Recommended for kids between 2 to 5 years of age</p>\n', NULL, 'Building Block Toy For Kids', NULL, NULL, NULL, 1, 2, 'chennai', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 06:47:14', '2019-03-19 09:22:05'),
(165, 'S10025', '', 1, 1, NULL, NULL, 27, 1, '1999', '2019-03-02', 1, 'Classic Essentials Stainless Steel Handi Set', '<p>CONTENT &amp; CAPACITY: Capacity of each handi is 400 ml, 500 ml, 800 ml,1050 ml, 1700 ml with Lid and 5 Serving spoon</p>\n\n<p>It is for serving purpose not for cooking</p>\n\n<p>All purpose serving handi with lid Aesthetic design with mirror polish steel finishing</p>\n\n<p>Made from 202 non-magnetic stainless steel</p>\n\n<p>Stainless steel lining Won&#39;t change the taste of food or corrode due to acids present in foods</p>\n', NULL, 'Classic Essentials Stainless Steel Handi Set', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-18 07:06:36', '2019-03-19 06:15:35'),
(166, 'S00909', '', 23, 2, NULL, NULL, 27, 1, '2055', '2019-03-21', 1, 'CROCKERY WALA AND COMPANY Laser Stainless Steel Dinner Set', '<p>&quot;Dinner set The 24 pcs Stainless steel Dinner plate set. It is for multipurpose use for in home, offices and restaurants. It is the basic plate which is required everywhere. It is very economical in range, made of food grade stainless steel. It is non breakable, durable, sturdy, rust free and long lasting. PRODUCT DETAILS Brand-King Internatinal Dinner Plate Material - stainless steel Quantity 4-full plate, Dimension :26.5 X26.5 X 2.3 Weight : 160 g 4- Glass, Dimension 7X 7 X 9.5 Weight : 60 g 4-Curry Bowl, Dimension :10.3 X 10.3 X 4 Weight : 4-Desert Bowl, Dimension :12.5 X 12.5 X 2.5 Weight : 40 g 4- Spoon , Dimension :16 X 3.5 X 16 Weight : 4- Quater plates , Dimension :19.3 X 19.3 X 1.5 Weight : 100 g Colour -Mettalics &quot;</p>\n', NULL, 'CROCKERY WALA AND COMPANY Laser Stainless Steel Dinner Set', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 07:13:01', '2019-03-20 06:34:31'),
(169, 'S9901', '', 1, 1, NULL, NULL, 27, 1, '200', '2019-03-08', 1, 'Gold Winner Refined - Sunflower Oil, 1 ltr Pouch', '<p>Gold Winner Refined Sunflower Oil is the result of the companys commitment to quality, health and hygiene. Every drop of Gold winner not only glistens with quality and hygiene but also assures gourmets delight. It is Trans Fat Free and offers Multi-Health Benefits.</p>\n', NULL, 'Gold Winner Refined - Sunflower Oil', NULL, NULL, NULL, 1, 12, '', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 07:25:16', '2019-03-19 02:54:43'),
(170, 'S09091', '', 1, 1, NULL, NULL, 27, 1, '200', '2019-03-21', 1, 'Toor Dal ', '<p>good quality&nbsp;<em>dal online</em>&nbsp;in India @ discounted rates.&nbsp;<em>Shop</em>&nbsp;pulses from a wide products such as Toor&nbsp;<em>Dal</em>, Urad&nbsp;<em>Dal</em>, Organic&nbsp;<em>Dal</em>, Moong&nbsp;<em>Dal</em>&nbsp;&amp; More&nbsp;...</p>\n', NULL, 'Toor Dal ', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-18 07:29:07', '2019-03-19 04:13:42'),
(172, 'S009098', '', 19, 1, NULL, NULL, 30, 1, '7800', '2019-03-14', 1, 'Vivo V11 Pro', '<p>Camera: 12+5 MP Dual pixel rear camera with Ultra HD mode, PPT mode, Professional mode, Slow motion, Time-lapse photography, Camera filter, Live photo, Bokeh mode, HDR mode, AI face beauty, Panorama, Palm capture, Gender detection, Retina flash, AR stickers, AI face shaping, Time watermark, AI selfie lighting, AI scene recognition, Google lens, AI portrait framing | 25 MP front camera<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Display: 16.29 centimetres (6.41-inch) FHD+ Super AMOLED capacitive touchscreen with 2340x1080 pixels, 403 ppi pixel density and 19.5:9 aspect ratio<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Memory, Storage &amp; SIM: 6GB RAM | 64GB storage expandable up to 256GB | Dual nano SIM with dual-standby (4G+4G)<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Operating System and Processor: Android v8.1 Oreo based on Funtouch 4.5 operating system with Qualcomm Snapdragon 660AIE octa core processor<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Battery: 3400 mAH lithium ion battery with Dual-Engine fast charging<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Warranty: 1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase,for any issues, reach out to brand at 18001023388<br />\n&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Included in box: Earphone, Micro USB to USB Cable, USB power adapter, Protective case<br />\n&nbsp;</p>\n', NULL, 'Vivo V11 Pro', NULL, NULL, NULL, 1, 2, 'chennai', 0, 0, 0, NULL, 1, 1, NULL, NULL, '2019-03-18 08:59:49', '2019-03-20 05:29:16'),
(173, 'S20091', '', 22, 3, NULL, NULL, 29, 1, '190', '2019-03-12', 1, 'Royal Organic - Black Pepper/Kali Mirchi', '<p>Black pepper is a dried mature fruit of the topical perennial climbing plant and is known as the king of spices. It is popular in households because of the medicinal value it possesses and the flavor. It can also accelerate the process of metabolism in the human body. Black pepper is also an ingredient in many medicinal : beauty products and everyday cooking use and come with the assurance of no artificial colors : flavours or preservatives. This is cultivated without the use of pesticides ,artificial fertilizers or chemicals :</p>\n', NULL, 'Royal Organic - Black Pepper/Kali Mirchi', NULL, NULL, NULL, 1, 2, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 00:45:28', '2019-03-21 01:10:52'),
(174, 'S20981', '', 2, 2, NULL, NULL, 29, 1, '390', '2019-03-22', 1, 'bb Royal Organic - Idly/Idli Rice', '<p>Idli Rice is a good supply of proteins and carbohydrates. It is nutritious as it is a rich supply of fibers and is simple to healthy and digests. They are light and it can make in jiffy with minimum ingredients. It makes smooth, flaky rice flour idli taste delicious with any sambar, chutney or even podi. It is free from synthetic chemicals and pesticides.</p>\n', NULL, ' Idly/Idli Rice', NULL, NULL, NULL, 1, 31, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 00:49:29', '2019-03-19 02:59:04'),
(175, 'S02391', '', 20, 2, NULL, NULL, 29, 1, '170', '2019-02-24', 1, 'Sakthi Powder - Sambar', '<p>Sakthi Sambar Powder is one of South India&#39;s most coveted dishes, is a soup-based dish made with a base of lentils and vegetables. Sakthi Sambar Powder is world-renown for its authentic mix of spices and is essential in making the most traditional Sambar curry dish.</p>\n', NULL, 'Sakthi Powder - Sambar', NULL, NULL, NULL, 1, 4, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 01:00:16', '2019-03-19 09:24:48'),
(176, 'S08015', '', 90, 2, NULL, NULL, 29, 1, '115', '2019-03-06', 1, 'Catch Masala - Super Garam', '<p>Coriander, Black pepper, Cumin seed, Dry ginger, Cinnamon, Aniseed, Cardamom, Cloves, Nutmeg, Salt.</p>\n\n<h3>NUTRITIONAL FACTS</h3>\n\n<p>per 100g, product (approx) Energy 364Kcal, Protein 11g, Carbohydrate 62g, Total fat 8g, Fatty Acids 2g, Cholesterol Nil, Vitamin A 25mg, Vitamin C 16mg, Calcium 617mg, Iron 11mg.</p>\n', NULL, 'Catch Masala - Super Garam', NULL, NULL, NULL, 1, 3, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 01:03:13', '2019-03-21 00:55:25'),
(177, 'S30701', 'S0001', 25, 2, NULL, NULL, 33, 1, '69000', '2019-03-20', 1, 'HP 15 Core i5 8th gen 15.6-inch FHD Laptop (8GB/1TB HDD/Windows 10 Home/Sparkling Black /2.04 kg), 15q-ds0010TU', '<p>&nbsp;</p>\n\n<p>Designed for long-lasting performance, this stylishly designed HP 15&quot; laptop has a long-lasting battery that keeps you connected, entertained, and productive all day. Speed through tasks, or sit back and socialize &ndash; with the latest processors and a rich HD display. Do it all, all day.</p>\n', NULL, 'hp laptop', NULL, NULL, NULL, 1, 2, 'Chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 02:53:26', '2019-03-20 00:35:55'),
(178, 'S009098', '', 23, 2, NULL, NULL, 22, 1, '300', '2019-03-21', 1, 'Asian Sneakers ', '<p>General</p>\n\n<table>\n	<tbody>\n		<tr>\n			<td>Color</td>\n			<td>\n			<ul>\n				<li>Grey</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Outer Material</td>\n			<td>\n			<ul>\n				<li>Denim</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Ideal For</td>\n			<td>\n			<ul>\n				<li>Men</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Occasion</td>\n			<td>\n			<ul>\n				<li>Casual</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Product Details</p>\n\n<table>\n	<tbody>\n		<tr>\n			<td>Closure</td>\n			<td>\n			<ul>\n				<li>Lace-Ups</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Upper Pattern</td>\n			<td>\n			<ul>\n				<li>Solid</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, 'Asian Sneakers', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 08:36:46', '2019-03-20 06:47:53'),
(180, 'S56654', '', 32, 2, NULL, NULL, 29, 1, '445', '2019-03-22', 1, ' Midi/Knee Length Casual', '<p>KidsDewKids Girls &amp; Kids Wear Gorgeous and Beautiful Dress, Made of Premium Quality Material and Comfortable to Wear</p>\n', NULL, ' Midi/Knee Length Casual', NULL, NULL, NULL, 0, 2, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 08:44:43', '2019-03-20 01:34:30'),
(181, 'S80098', '', 1, 3, NULL, NULL, 22, 1, '220', '2019-03-22', 1, 'Rinku Dungaree For Boys & Girls Self Design Cotton', '<table>\n	<tbody>\n		<tr>\n			<td>Brand</td>\n			<td>\n			<ul>\n				<li>Rinku</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Style Code</td>\n			<td>\n			<ul>\n				<li>CBDR101</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Brand Color</td>\n			<td>\n			<ul>\n				<li>Multicolor</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Size</td>\n			<td>\n			<ul>\n				<li>0 - 6 Months</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Type</td>\n			<td>\n			<ul>\n				<li>Dungaree</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Bottom Type</td>\n			<td>\n			<ul>\n				<li>Ankle Length Skirt</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Primary Color</td>\n			<td>\n			<ul>\n				<li>Multicolor</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Fabric</td>\n			<td>\n			<ul>\n				<li>Cotton</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Pattern</td>\n			<td>\n			<ul>\n				<li>Self Design</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Ideal For</td>\n			<td>\n			<ul>\n				<li>Boys &amp; Girls</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Fabric Details</td>\n			<td>\n			<ul>\n				<li>Cotton</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, 'Rinku Dungaree Self Design Cotton', NULL, NULL, NULL, 1, 2, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 09:02:47', '2019-03-20 07:45:28'),
(182, 'S0034', '', 3, 2, NULL, NULL, 22, 1, '999', '2019-03-27', 1, 'Party, Wedding Kurta and Pyjama Set', '<p>JBN Creation presents this evergreen black jute feel angrakha style indowestern kurta with a cowl cut patiala style multi layered dhoti style pant set. It is inspired by the tradional jodhpuri bandhgala look. The set has many extraordinary details, the kurta is in a jacket style with a fitted look to give your boy a smart sleek swag look. We have given designer buttons as the only shiny aspect to the garment to make it stand out. The best part of the set is its dhoti which looks simple but is very difficult to construct as it has multiple layers generally called as a cowl look in the designer world. It is a perfect outfit for any festival, wedding or a celebration. The set makes you look slimmer and taller. It is very light weight and attractive. Your little boy is sure to attract eyes in this indowestern set. Get him ready to hear compliments such as hero, handsome, cute, smarty, dashing, dapper! We at JBN Creation are striving every day to bring to you the fines quality product for your little ones. We are specialist in Kids apparel with complete in-house manufacturing and quality check team. We have a wide range of ensemble on offer for you including girls dresses, frocks, salwar suit, lehanga choli, jacket lehanga sets. Our boys wear closet has almost everything you can think of in ethnic wear, we have kurta pyjama, sherwani, indo-western, dhoti kurta, modi jackets to name a few.</p>\n', NULL, 'Party, Wedding Kurta and Pyjama Set', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-19 09:15:49', '2019-03-20 07:43:08'),
(185, 'S77890', '', 1, 3, NULL, NULL, 22, 1, '299', '2019-03-27', 1, 'Taat Bellies', '<table>\n	<tbody>\n		<tr>\n			<td>Color</td>\n			<td>\n			<ul>\n				<li>Tan</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Outer Material</td>\n			<td>\n			<ul>\n				<li>Nappa Leather</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Ideal For</td>\n			<td>\n			<ul>\n				<li>Women</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Occasion</td>\n			<td>\n			<ul>\n				<li>Casual</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>School Shoe</td>\n			<td>\n			<ul>\n				<li>NO</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, 'Taat Bellies', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, 1, NULL, 1, 1, NULL, NULL, '2019-03-19 23:57:13', '2019-03-21 00:53:08'),
(186, 'S56422', '', 2, 2, NULL, NULL, 22, 1, '310', '2019-03-14', 1, 'ANSHU ENTERPRISES Women Brown Wedges', '<table>\n	<tbody>\n		<tr>\n			<td>Type</td>\n			<td>\n			<ul>\n				<li>Wedges</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Heel Pattern</td>\n			<td>\n			<ul>\n				<li>Solid</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Upper Pattern</td>\n			<td>\n			<ul>\n				<li>NA</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Type for Flats</td>\n			<td>\n			<ul>\n				<li>Slip-on</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Color</td>\n			<td>\n			<ul>\n				<li>Brown</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, ' Women Brown Wedges', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 00:04:39', '2019-03-20 07:56:12'),
(187, 'S7709', '', 1, 1, NULL, NULL, 22, 1, '345', '2019-03-21', 1, 'Asian Walking Shoes', '<table>\n	<tbody>\n		<tr>\n			<td>Color</td>\n			<td>\n			<ul>\n				<li>Grey</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Outer Material</td>\n			<td>\n			<ul>\n				<li>Mesh</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Ideal For</td>\n			<td>\n			<ul>\n				<li>Women</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Occasion</td>\n			<td>\n			<ul>\n				<li>Sports</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, 'Asian Walking Shoes', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 00:58:49', '2019-03-20 07:58:03'),
(188, 'S889097', '', 21, 2, NULL, NULL, 34, 1, '3990', '2019-04-11', 1, 'Davidoff Cool Water Wave ', '<p>Davidoff Cool Water Wave EDT - a fresh aquatic fragrance so intensely invigorating that it feels like the waves of the ocean crashing onto you. Experience the euphoria of catching the perfect wave with a spritz of this perfume.</p>\n', NULL, 'Davidoff Cool Water Wave Eau de Toilette', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 02:02:40', '2019-03-20 08:53:07'),
(189, 'S08831', '', 14, 2, NULL, NULL, 25, 1, '2150', '2019-03-28', 1, 'Divastri Printed Fashion Khadi Saree', '<table>\n	<tbody>\n		<tr>\n			<td>\n			<ul>\n				<li>Printed saree ,Animal Printed saree Khadi silk saree,Chanderi,Designer saree, ,Paisely saree,Tassel saree, Embellished Saree,Tassel is given Seperatly in saree packages,silk thread are used in Tassel and Golden Beads ,handloom saree,Woven saree,Multicolor saree (Red color,blue Color ,Green Color ,Maroon Color,Yellow color) Daily wear saree,Party wear saree,Wedding saree,fancy saree,Saree Fashion,Saree Collection,Beautiful saree,indian wedding sareeWe are also manufacturing handloom saree,Woven saree,Multicolor saree,Chiffon Solid Printed Saree ,Georgette Saree ,Georgette Printed Saree , Ruffel saree,tant saree ,Plain Georgette Printed Saree ,Chiffon Saree ,Chiffon Lace Border Saree , Chiffon Printed Saree , Cotton Silk Saree , Bhagalpuri Saree , Art Silk saree ,Cotton Saree, Silk Saree ,Half &amp; Half Saree ,Latest Saree ,Banarasi silk saree,kanjivaram saree,Ruffel saree,tant saree,sana silk saree, Patola and Striped Pattern saree, silk,Cotton silk</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, 'Divastri Printed Fashion Khadi Saree', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 02:09:20', '2019-03-20 07:23:06'),
(190, 'S47765', '', 1, 2, NULL, NULL, 27, 1, '2990', '2019-02-28', 1, 'Versace Dylan Blue Deodorant Spray', '<table>\n	<tbody>\n		<tr>\n			<td>Brand</td>\n			<td>\n			<ul>\n				<li>Versace</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Model Name</td>\n			<td>\n			<ul>\n				<li>Dylan Blue</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Ideal For</td>\n			<td>\n			<ul>\n				<li>Men</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Fragrance Classification</td>\n			<td>\n			<ul>\n				<li>Deodorant Spray</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Quantity</td>\n			<td>\n			<ul>\n				<li>100 ml</li>\n			</ul>\n			</td>\n		</tr>\n		<tr>\n			<td>Maximum Shelf Life</td>\n			<td>\n			<ul>\n				<li>36 Months</li>\n			</ul>\n			</td>\n		</tr>\n	</tbody>\n</table>\n', NULL, 'Versace Dylan Blue ', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 04:28:07', '2019-03-20 08:50:16'),
(191, 'S0001', 'S001', 50, 2, NULL, NULL, 30, 1, '11999', '2019-03-20', 1, 'Sony Xperia XA Ultra Dual (Graphite Black, 16 GB)  (3 GB RAM)', '<p>When the perfect moment occurs, you need the right piece of equipment by your side to capture it. And, you can&rsquo;t always carry a bulky DSLR camera around with you while looking to click a magnificent photo. With Sony&rsquo;s Xperia XA Ultra, you can make your aspirations of becoming a professional photographer a reality by being prepared always. Thanks to its cutting-edge photographic technologies, the perfect snapshot is just a click away.</p>\n', NULL, 'sony', NULL, NULL, NULL, 1, 2, 'Chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 04:30:41', '2019-03-20 04:36:49'),
(192, 'oppo mobile', 'S0001', 99, 2, NULL, NULL, 56, 1, '8999', '2019-03-20', 1, 'OPPO A7 (Glaze Blue, 64 GB)  (3 GB RAM)', '<p>Do a lot more than just take calls on the Oppo A7. With a mighty 4230 mAh battery and Qualcomm Snapdragon 450 1.8 GHz Octa-core Processor, along with 3 GB of RAM, this phone can virtually handle any task that you throw at it.</p>\n', NULL, 'oppo', NULL, NULL, NULL, 1, 1, 'chennai', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 04:37:21', '2019-03-20 05:25:22'),
(193, 'S0001', '', 4, 1, NULL, NULL, 35, 2, '444', NULL, 0, 'hp laptop', '', NULL, 'hp', NULL, NULL, NULL, 0, 0, '', 0, 0, NULL, NULL, 1, 1, NULL, NULL, '2019-03-20 05:18:04', '2019-03-20 05:26:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_description`
--

CREATE TABLE `product_description` (
  `product_description_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `meta_description` text,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

CREATE TABLE `product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `priority` int(5) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `container_name` varchar(255) DEFAULT NULL,
  `default_image` int(11) DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `container_name`, `default_image`, `sort_order`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(656, 159, 'Img_1552904835493.jpeg', 'product/TV/', 1, NULL, NULL, NULL, NULL, '2019-03-18 05:28:10', NULL),
(657, 159, 'Img_1552904844447.jpeg', 'product/TV/', 0, NULL, NULL, NULL, NULL, '2019-03-18 05:28:10', NULL),
(658, 159, 'Img_1552904851262.jpeg', 'product/TV/', 0, NULL, NULL, NULL, NULL, '2019-03-18 05:28:10', NULL),
(659, 159, 'Img_1552904858467.jpeg', 'product/TV/', 0, NULL, NULL, NULL, NULL, '2019-03-18 05:28:10', NULL),
(754, 175, 'Img_1552975197627.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-19 01:06:08', NULL),
(814, 152, 'Img_1552726107214.jpeg', '', 1, NULL, NULL, NULL, NULL, '2019-03-19 02:48:57', NULL),
(823, 169, 'Img_1552911833229.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-19 02:54:43', NULL),
(827, 176, 'Img_1552975374880.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-19 02:56:21', NULL),
(831, 174, 'Img_1552974540560.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-19 02:59:04', NULL),
(839, 170, 'Img_1552986805667.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-19 04:13:42', NULL),
(840, 170, 'Img_1552911823746.jpeg', 'product/kitchen/', 0, NULL, NULL, NULL, NULL, '2019-03-19 04:13:42', NULL),
(841, 170, 'Img_1552911816320.jpeg', 'product/kitchen/', 0, NULL, NULL, NULL, NULL, '2019-03-19 04:13:42', NULL),
(869, 155, 'Img_1552898643700.jpeg', '', 1, NULL, NULL, NULL, NULL, '2019-03-19 06:08:25', NULL),
(870, 155, 'Img_1552898698775.jpeg', '', 0, NULL, NULL, NULL, NULL, '2019-03-19 06:08:25', NULL),
(871, 155, 'Img_1552898675975.jpeg', '', 0, NULL, NULL, NULL, NULL, '2019-03-19 06:08:25', NULL),
(872, 148, 'Img_1552900661731.jpeg', 'product/', 1, NULL, NULL, NULL, NULL, '2019-03-19 06:08:47', NULL),
(904, 165, 'Img_1552910741168.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-19 06:15:35', NULL),
(905, 173, 'Img_1552974309126.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-19 06:16:12', NULL),
(937, 164, 'Img_1552909543113.jpeg', 'product/kids/', NULL, NULL, NULL, NULL, NULL, '2019-03-19 09:22:05', NULL),
(938, 164, 'Img_1552909534080.jpeg', 'product/kids/', NULL, NULL, NULL, NULL, NULL, '2019-03-19 09:22:05', NULL),
(939, 164, 'Img_1552909552275.jpeg', 'product/kids/', NULL, NULL, NULL, NULL, NULL, '2019-03-19 09:22:05', NULL),
(940, 164, 'Img_1552909559469.jpeg', 'product/kids/', 1, NULL, NULL, NULL, NULL, '2019-03-19 09:22:05', NULL),
(975, 177, 'Img_1552981557602.jpeg', 'product/Laptops/', 1, NULL, NULL, NULL, NULL, '2019-03-20 00:35:55', NULL),
(976, 177, 'Img_1552981797440.jpeg', 'product/Laptops/', 0, NULL, NULL, NULL, NULL, '2019-03-20 00:35:55', NULL),
(977, 177, 'Img_1551248711958.jpeg', 'product/', 0, NULL, NULL, NULL, NULL, '2019-03-20 00:35:55', NULL),
(981, 145, 'Img_1552631404849.jpeg', '', 1, NULL, NULL, NULL, NULL, '2019-03-20 00:43:13', NULL),
(982, 145, 'Img_1552631409375.jpeg', '', 0, NULL, NULL, NULL, NULL, '2019-03-20 00:43:13', NULL),
(987, 180, 'Img_1553003071801.jpeg', 'product/kids/', 1, NULL, NULL, NULL, NULL, '2019-03-20 01:34:25', NULL),
(999, 150, 'Img_1552900846233.jpeg', 'product/topwear/', 1, NULL, NULL, NULL, NULL, '2019-03-20 01:54:12', NULL),
(1000, 150, 'Img_1552900859382.jpeg', 'product/topwear/', 0, NULL, NULL, NULL, NULL, '2019-03-20 01:54:12', NULL),
(1001, 150, 'Img_1552900869755.jpeg', 'product/topwear/', 0, NULL, NULL, NULL, NULL, '2019-03-20 01:54:12', NULL),
(1020, 191, 'Img_1553073944191.jpeg', 'product/mobiles/Sony/', 0, NULL, NULL, NULL, NULL, '2019-03-20 04:30:41', NULL),
(1021, 191, 'Img_1553073918345.jpeg', 'product/mobiles/Sony/', 1, NULL, NULL, NULL, NULL, '2019-03-20 04:30:41', NULL),
(1022, 191, 'Img_1553073953443.jpeg', 'product/mobiles/Sony/', 0, NULL, NULL, NULL, NULL, '2019-03-20 04:30:41', NULL),
(1023, 191, 'Img_1553073935492.jpeg', 'product/mobiles/Sony/', 0, NULL, NULL, NULL, NULL, '2019-03-20 04:30:41', NULL),
(1029, 146, 'Img_1552898416096.jpeg', '', 1, NULL, NULL, NULL, NULL, '2019-03-20 05:03:52', NULL),
(1031, 193, 'Img_1551243666779.jpeg', '', 1, NULL, NULL, NULL, NULL, '2019-03-20 05:24:49', NULL),
(1032, 192, 'Img_1553073690947.jpeg', 'product/mobiles/samsung/Oppo/', 1, NULL, NULL, NULL, NULL, '2019-03-20 05:25:22', NULL),
(1033, 192, 'Img_1553073660138.jpeg', 'product/mobiles/samsung/Oppo/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 05:25:22', NULL),
(1034, 192, 'Img_1553073703525.jpeg', 'product/mobiles/samsung/Oppo/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 05:25:22', NULL),
(1035, 172, 'Img_1552917512975.jpeg', 'product/sony/', 1, NULL, NULL, NULL, NULL, '2019-03-20 05:29:16', NULL),
(1036, 172, 'Img_1552917496510.jpeg', 'product/sony/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 05:29:16', NULL),
(1038, 151, 'Img_1553079988556.jpeg', 'product/mens-dress/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:07:03', NULL),
(1039, 151, 'Img_1553079998307.jpeg', 'product/mens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:07:03', NULL),
(1040, 151, 'Img_1553080006220.jpeg', 'product/mens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:07:03', NULL),
(1045, 153, 'Img_1553080240797.jpeg', 'product/Laptops/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:13:32', NULL),
(1046, 153, 'Img_1553080253603.jpeg', 'product/Laptops/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:13:32', NULL),
(1047, 153, 'Img_1553080260466.jpeg', 'product/Laptops/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:13:32', NULL),
(1048, 153, 'Img_1553080232481.jpeg', 'product/Laptops/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:13:33', NULL),
(1049, 154, 'Img_1553080522124.jpeg', 'product/mens-watch/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:16:57', NULL),
(1050, 154, 'Img_1553080536610.jpeg', 'product/mens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:16:57', NULL),
(1051, 154, 'Img_1553080578130.jpeg', 'product/mens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:16:57', NULL),
(1052, 154, 'Img_1553080585182.jpeg', 'product/mens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:16:57', NULL),
(1053, 149, 'Img_1552900589469.jpeg', 'product/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:18:50', NULL),
(1054, 149, 'Img_1552900602272.jpeg', 'product/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:18:50', NULL),
(1055, 149, 'Img_1552900661731.jpeg', 'product/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:18:50', NULL),
(1056, 162, 'Img_1552907590269.jpeg', 'product/kids/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:21:26', NULL),
(1057, 162, 'Img_1552907613438.jpeg', 'product/kids/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:21:26', NULL),
(1058, 162, 'Img_1552907598146.jpeg', 'product/kids/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:21:26', NULL),
(1059, 163, 'Img_1552907640809.jpeg', 'product/kids/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:25:26', NULL),
(1060, 163, 'Img_1552907631985.jpeg', 'product/kids/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:25:26', NULL),
(1061, 163, 'Img_1552907622379.jpeg', 'product/kids/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:25:26', NULL),
(1062, 166, 'Img_1552911111270.jpeg', 'product/kitchen/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1063, 166, 'Img_1552911127350.jpeg', 'product/kitchen/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1064, 166, 'Img_1552911134178.jpeg', 'product/kitchen/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1065, 166, 'Img_1552911099981.jpeg', 'product/kitchen/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1066, 157, 'Img_1553082064807.jpeg', 'product/womens-watch/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:43:18', NULL),
(1067, 157, 'Img_1553082076704.jpeg', 'product/womens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:43:18', NULL),
(1068, 157, 'Img_1553082090282.jpeg', 'product/womens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:43:18', NULL),
(1069, 157, 'Img_1553082096913.jpeg', 'product/womens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:43:18', NULL),
(1070, 158, 'Img_1553082137205.jpeg', 'product/womens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1071, 158, 'Img_1553082148667.jpeg', 'product/womens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1072, 158, 'Img_1553082115969.jpeg', 'product/womens-watch/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1073, 158, 'Img_1553082125205.jpeg', 'product/womens-watch/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1074, 178, 'Img_1553082418704.jpeg', 'product/mens-footwear/', 0, NULL, NULL, NULL, NULL, '2019-03-20 06:47:53', NULL),
(1075, 178, 'Img_1553082426898.jpeg', 'product/mens-footwear/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:47:53', NULL),
(1076, 160, 'Img_1553082769367.jpeg', 'product/womens-dress/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:54:34', NULL),
(1077, 160, 'Img_1553082763018.jpeg', 'product/womens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:54:34', NULL),
(1078, 160, 'Img_1553082756084.jpeg', 'product/womens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:54:34', NULL),
(1079, 161, 'Img_1553082835827.jpeg', 'product/womens-dress/', 1, NULL, NULL, NULL, NULL, '2019-03-20 06:56:47', NULL),
(1080, 161, 'Img_1553082785320.jpeg', 'product/womens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:56:47', NULL),
(1081, 161, 'Img_1553082794993.jpeg', 'product/womens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 06:56:47', NULL),
(1083, 189, 'Img_1553082728000.jpeg', 'product/womens-dress/', 1, NULL, NULL, NULL, NULL, '2019-03-20 07:23:06', NULL),
(1084, 189, 'Img_1553082718811.jpeg', 'product/womens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 07:23:06', NULL),
(1094, 182, 'Img_1553004898108.jpeg', 'product/kids/', 0, NULL, NULL, NULL, NULL, '2019-03-20 07:43:09', NULL),
(1095, 182, 'Img_1553004891059.jpeg', 'product/kids/', 0, NULL, NULL, NULL, NULL, '2019-03-20 07:43:09', NULL),
(1096, 182, 'Img_1553004882720.jpeg', 'product/kids/', 1, NULL, NULL, NULL, NULL, '2019-03-20 07:43:09', NULL),
(1097, 181, 'Img_1553004078835.jpeg', 'product/kids/', 1, NULL, NULL, NULL, NULL, '2019-03-20 07:45:28', NULL),
(1098, 181, 'Img_1553004066642.jpeg', 'product/kids/', 0, NULL, NULL, NULL, NULL, '2019-03-20 07:45:28', NULL),
(1100, 186, 'Img_1553086509015.jpeg', 'product/womens-footwear/', 0, NULL, NULL, NULL, NULL, '2019-03-20 07:56:12', NULL),
(1101, 186, 'Img_1553086527703.jpeg', 'product/womens-footwear/', 1, NULL, NULL, NULL, NULL, '2019-03-20 07:56:12', NULL),
(1102, 187, 'Img_1553086451407.jpeg', 'product/womens-footwear/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 07:58:03', NULL),
(1103, 187, 'Img_1553086463148.jpeg', 'product/womens-footwear/', 1, NULL, NULL, NULL, NULL, '2019-03-20 07:58:03', NULL),
(1105, 185, 'Img_1553086483832.jpeg', 'product/womens-footwear/', 1, NULL, NULL, NULL, NULL, '2019-03-20 08:05:25', NULL),
(1107, 156, 'Img_1553087437852.jpeg', 'product/mens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 08:11:26', NULL),
(1108, 156, 'Img_1553087449154.jpeg', 'product/mens-dress/', NULL, NULL, NULL, NULL, NULL, '2019-03-20 08:11:26', NULL),
(1109, 156, 'Img_1553087427331.jpeg', 'product/mens-dress/', 1, NULL, NULL, NULL, NULL, '2019-03-20 08:11:26', NULL),
(1112, 190, 'Img_1553089680742.jpeg', 'product/beauty/', 1, NULL, NULL, NULL, NULL, '2019-03-20 08:50:21', NULL),
(1114, 188, 'Img_1553089691629.jpeg', 'product/beauty/', 1, NULL, NULL, NULL, NULL, '2019-03-20 08:53:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_rating`
--

CREATE TABLE `product_rating` (
  `rating_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `first_name` varchar(512) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `image_path` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_related`
--

CREATE TABLE `product_related` (
  `related_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `related_product_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_related`
--

INSERT INTO `product_related` (`related_id`, `product_id`, `related_product_id`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(208, 159, 145, NULL, NULL, NULL, '2019-03-18 05:28:10', NULL),
(236, 175, 173, NULL, NULL, NULL, '2019-03-19 01:06:08', NULL),
(247, 176, 175, NULL, NULL, NULL, '2019-03-19 02:56:21', NULL),
(248, 174, 173, NULL, NULL, NULL, '2019-03-19 02:59:04', NULL),
(250, 170, 170, NULL, NULL, NULL, '2019-03-19 04:13:42', NULL),
(252, 155, 155, NULL, NULL, NULL, '2019-03-19 06:08:25', NULL),
(253, 148, 149, NULL, NULL, NULL, '2019-03-19 06:08:47', NULL),
(268, 165, 166, NULL, NULL, NULL, '2019-03-19 06:15:35', NULL),
(269, 173, 170, NULL, NULL, NULL, '2019-03-19 06:16:12', NULL),
(280, 164, 163, NULL, NULL, NULL, '2019-03-19 09:22:05', NULL),
(281, 164, 162, NULL, NULL, NULL, '2019-03-19 09:22:05', NULL),
(294, 180, 181, NULL, NULL, NULL, '2019-03-20 01:34:25', NULL),
(310, 172, 192, NULL, NULL, NULL, '2019-03-20 05:29:16', NULL),
(311, 162, 164, NULL, NULL, NULL, '2019-03-20 06:21:26', NULL),
(312, 163, 162, NULL, NULL, NULL, '2019-03-20 06:25:26', NULL),
(313, 163, 162, NULL, NULL, NULL, '2019-03-20 06:25:26', NULL),
(314, 163, 164, NULL, NULL, NULL, '2019-03-20 06:25:26', NULL),
(315, 166, 165, NULL, NULL, NULL, '2019-03-20 06:34:32', NULL),
(316, 166, 166, NULL, NULL, NULL, '2019-03-20 06:34:32', NULL),
(317, 157, 154, NULL, NULL, NULL, '2019-03-20 06:43:18', NULL),
(318, 158, 154, NULL, NULL, NULL, '2019-03-20 06:44:52', NULL),
(319, 158, 157, NULL, NULL, NULL, '2019-03-20 06:44:52', NULL),
(320, 160, 161, NULL, NULL, NULL, '2019-03-20 06:54:34', NULL),
(321, 160, 160, NULL, NULL, NULL, '2019-03-20 06:54:34', NULL),
(322, 161, 160, NULL, NULL, NULL, '2019-03-20 06:56:47', NULL),
(323, 189, 160, NULL, NULL, NULL, '2019-03-20 07:23:06', NULL),
(324, 189, 161, NULL, NULL, NULL, '2019-03-20 07:23:06', NULL),
(331, 182, 181, NULL, NULL, NULL, '2019-03-20 07:43:09', NULL),
(332, 182, 180, NULL, NULL, NULL, '2019-03-20 07:43:09', NULL),
(333, 181, 180, NULL, NULL, NULL, '2019-03-20 07:45:28', NULL),
(335, 186, 185, NULL, NULL, NULL, '2019-03-20 07:56:12', NULL),
(336, 187, 185, NULL, NULL, NULL, '2019-03-20 07:58:03', NULL),
(337, 187, 186, NULL, NULL, NULL, '2019-03-20 07:58:03', NULL),
(338, 185, 178, NULL, NULL, NULL, '2019-03-20 08:05:25', NULL),
(340, 156, 152, NULL, NULL, NULL, '2019-03-20 08:11:26', NULL),
(343, 190, 188, NULL, NULL, NULL, '2019-03-20 08:50:21', NULL),
(346, 188, 184, NULL, NULL, NULL, '2019-03-20 08:53:07', NULL),
(347, 188, 183, NULL, NULL, NULL, '2019-03-20 08:53:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `product_tag_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_tagname` text,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_to_category`
--

CREATE TABLE `product_to_category` (
  `product_to_category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_to_category`
--

INSERT INTO `product_to_category` (`product_to_category_id`, `product_id`, `category_id`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(941, 159, 108, 1, NULL, NULL, '2019-03-18 05:28:10', NULL),
(984, 175, 129, 1, NULL, NULL, '2019-03-19 01:06:08', NULL),
(1010, 152, 164, 1, NULL, NULL, '2019-03-19 02:48:57', NULL),
(1011, 152, 162, 1, NULL, NULL, '2019-03-19 02:48:57', NULL),
(1017, 169, 145, 1, NULL, NULL, '2019-03-19 02:54:43', NULL),
(1018, 169, 141, 1, NULL, NULL, '2019-03-19 02:54:43', NULL),
(1022, 176, 144, 1, NULL, NULL, '2019-03-19 02:56:21', NULL),
(1023, 176, 142, 1, NULL, NULL, '2019-03-19 02:56:21', NULL),
(1024, 176, 141, 1, NULL, NULL, '2019-03-19 02:56:21', NULL),
(1026, 174, 130, 1, NULL, NULL, '2019-03-19 02:59:04', NULL),
(1027, 174, 138, 1, NULL, NULL, '2019-03-19 02:59:04', NULL),
(1028, 174, 137, 1, NULL, NULL, '2019-03-19 02:59:04', NULL),
(1037, 170, 131, 1, NULL, NULL, '2019-03-19 04:13:42', NULL),
(1038, 170, 144, 1, NULL, NULL, '2019-03-19 04:13:42', NULL),
(1039, 170, 145, 1, NULL, NULL, '2019-03-19 04:13:42', NULL),
(1066, 155, 109, 1, NULL, NULL, '2019-03-19 06:08:25', NULL),
(1067, 155, 108, 1, NULL, NULL, '2019-03-19 06:08:25', NULL),
(1092, 165, 136, 1, NULL, NULL, '2019-03-19 06:15:35', NULL),
(1093, 165, 135, 1, NULL, NULL, '2019-03-19 06:15:35', NULL),
(1094, 165, 126, 1, NULL, NULL, '2019-03-19 06:15:35', NULL),
(1095, 165, 134, 1, NULL, NULL, '2019-03-19 06:15:35', NULL),
(1096, 173, 142, 1, NULL, NULL, '2019-03-19 06:16:12', NULL),
(1097, 173, 138, 1, NULL, NULL, '2019-03-19 06:16:12', NULL),
(1098, 173, 137, 1, NULL, NULL, '2019-03-19 06:16:12', NULL),
(1099, 173, 126, 1, NULL, NULL, '2019-03-19 06:16:12', NULL),
(1100, 173, 129, 1, NULL, NULL, '2019-03-19 06:16:12', NULL),
(1156, 164, 121, 1, NULL, NULL, '2019-03-19 09:22:05', NULL),
(1157, 164, 120, 1, NULL, NULL, '2019-03-19 09:22:05', NULL),
(1158, 164, 171, 1, NULL, NULL, '2019-03-19 09:22:05', NULL),
(1159, 164, 170, 1, NULL, NULL, '2019-03-19 09:22:05', NULL),
(1202, 177, 108, 1, NULL, NULL, '2019-03-20 00:35:55', NULL),
(1203, 177, 110, 1, NULL, NULL, '2019-03-20 00:35:55', NULL),
(1204, 177, 172, 1, NULL, NULL, '2019-03-20 00:35:55', NULL),
(1206, 145, 108, 1, NULL, NULL, '2019-03-20 00:43:13', NULL),
(1217, 180, 120, 1, NULL, NULL, '2019-03-20 01:34:25', NULL),
(1218, 180, 168, 1, NULL, NULL, '2019-03-20 01:34:25', NULL),
(1219, 180, 169, 1, NULL, NULL, '2019-03-20 01:34:25', NULL),
(1220, 180, 132, 1, NULL, NULL, '2019-03-20 01:34:25', NULL),
(1239, 150, 163, 1, NULL, NULL, '2019-03-20 01:54:12', NULL),
(1240, 150, 111, 1, NULL, NULL, '2019-03-20 01:54:12', NULL),
(1241, 150, 112, 1, NULL, NULL, '2019-03-20 01:54:12', NULL),
(1274, 191, 108, 1, NULL, NULL, '2019-03-20 04:30:41', NULL),
(1275, 191, 109, 1, NULL, NULL, '2019-03-20 04:30:41', NULL),
(1276, 191, 122, 1, NULL, NULL, '2019-03-20 04:30:41', NULL),
(1293, 146, 156, 1, NULL, NULL, '2019-03-20 05:03:52', NULL),
(1294, 146, 108, 1, NULL, NULL, '2019-03-20 05:03:52', NULL),
(1295, 146, 124, 1, NULL, NULL, '2019-03-20 05:03:52', NULL),
(1296, 193, 108, 1, NULL, NULL, '2019-03-20 05:24:49', NULL),
(1297, 193, 110, 1, NULL, NULL, '2019-03-20 05:24:49', NULL),
(1298, 192, 108, 1, NULL, NULL, '2019-03-20 05:25:22', NULL),
(1299, 192, 109, 1, NULL, NULL, '2019-03-20 05:25:22', NULL),
(1300, 192, 128, 1, NULL, NULL, '2019-03-20 05:25:22', NULL),
(1301, 172, 127, 1, NULL, NULL, '2019-03-20 05:29:16', NULL),
(1305, 151, 163, 1, NULL, NULL, '2019-03-20 06:07:03', NULL),
(1306, 151, 162, 1, NULL, NULL, '2019-03-20 06:07:03', NULL),
(1307, 151, 111, 1, NULL, NULL, '2019-03-20 06:07:03', NULL),
(1311, 153, 108, 1, NULL, NULL, '2019-03-20 06:13:32', NULL),
(1312, 153, 110, 1, NULL, NULL, '2019-03-20 06:13:32', NULL),
(1313, 153, 139, 1, NULL, NULL, '2019-03-20 06:13:32', NULL),
(1314, 154, 110, 1, NULL, NULL, '2019-03-20 06:16:57', NULL),
(1315, 154, 108, 1, NULL, NULL, '2019-03-20 06:16:57', NULL),
(1316, 154, 139, 1, NULL, NULL, '2019-03-20 06:16:57', NULL),
(1317, 149, 143, 1, NULL, NULL, '2019-03-20 06:18:50', NULL),
(1318, 149, 108, 1, NULL, NULL, '2019-03-20 06:18:50', NULL),
(1319, 149, 123, 1, NULL, NULL, '2019-03-20 06:18:50', NULL),
(1320, 162, 120, 1, NULL, NULL, '2019-03-20 06:21:26', NULL),
(1321, 162, 121, 1, NULL, NULL, '2019-03-20 06:21:26', NULL),
(1322, 163, 120, 1, NULL, NULL, '2019-03-20 06:25:26', NULL),
(1323, 163, 121, 1, NULL, NULL, '2019-03-20 06:25:26', NULL),
(1324, 166, 135, 1, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1325, 166, 136, 1, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1326, 166, 134, 1, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1327, 166, 126, 1, NULL, NULL, '2019-03-20 06:34:32', NULL),
(1328, 157, 117, 1, NULL, NULL, '2019-03-20 06:43:18', NULL),
(1329, 157, 150, 1, NULL, NULL, '2019-03-20 06:43:18', NULL),
(1330, 157, 118, 1, NULL, NULL, '2019-03-20 06:43:18', NULL),
(1331, 158, 152, 1, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1332, 158, 151, 1, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1333, 158, 117, 1, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1334, 158, 118, 1, NULL, NULL, '2019-03-20 06:44:52', NULL),
(1335, 178, 111, 1, NULL, NULL, '2019-03-20 06:47:53', NULL),
(1336, 178, 166, 1, NULL, NULL, '2019-03-20 06:47:53', NULL),
(1337, 178, 167, 1, NULL, NULL, '2019-03-20 06:47:53', NULL),
(1338, 160, 153, 1, NULL, NULL, '2019-03-20 06:54:34', NULL),
(1339, 160, 154, 1, NULL, NULL, '2019-03-20 06:54:34', NULL),
(1340, 160, 117, 1, NULL, NULL, '2019-03-20 06:54:34', NULL),
(1341, 160, 119, 1, NULL, NULL, '2019-03-20 06:54:34', NULL),
(1342, 161, 117, 1, NULL, NULL, '2019-03-20 06:56:47', NULL),
(1343, 161, 154, 1, NULL, NULL, '2019-03-20 06:56:47', NULL),
(1344, 161, 153, 1, NULL, NULL, '2019-03-20 06:56:47', NULL),
(1345, 161, 119, 1, NULL, NULL, '2019-03-20 06:56:47', NULL),
(1352, 189, 119, 1, NULL, NULL, '2019-03-20 07:23:06', NULL),
(1353, 189, 117, 1, NULL, NULL, '2019-03-20 07:23:06', NULL),
(1354, 189, 154, 1, NULL, NULL, '2019-03-20 07:23:06', NULL),
(1355, 189, 153, 1, NULL, NULL, '2019-03-20 07:23:06', NULL),
(1375, 182, 120, 1, NULL, NULL, '2019-03-20 07:43:09', NULL),
(1376, 182, 132, 1, NULL, NULL, '2019-03-20 07:43:09', NULL),
(1377, 182, 168, 1, NULL, NULL, '2019-03-20 07:43:09', NULL),
(1378, 182, 169, 1, NULL, NULL, '2019-03-20 07:43:09', NULL),
(1379, 181, 132, 1, NULL, NULL, '2019-03-20 07:45:28', NULL),
(1380, 181, 120, 1, NULL, NULL, '2019-03-20 07:45:28', NULL),
(1381, 181, 168, 1, NULL, NULL, '2019-03-20 07:45:28', NULL),
(1382, 181, 169, 1, NULL, NULL, '2019-03-20 07:45:28', NULL),
(1390, 186, 146, 1, NULL, NULL, '2019-03-20 07:56:12', NULL),
(1391, 186, 147, 1, NULL, NULL, '2019-03-20 07:56:12', NULL),
(1392, 186, 117, 1, NULL, NULL, '2019-03-20 07:56:12', NULL),
(1393, 186, 149, 1, NULL, NULL, '2019-03-20 07:56:12', NULL),
(1394, 186, 148, 1, NULL, NULL, '2019-03-20 07:56:12', NULL),
(1395, 187, 146, 1, NULL, NULL, '2019-03-20 07:58:03', NULL),
(1396, 187, 117, 1, NULL, NULL, '2019-03-20 07:58:03', NULL),
(1397, 187, 147, 1, NULL, NULL, '2019-03-20 07:58:03', NULL),
(1398, 187, 148, 1, NULL, NULL, '2019-03-20 07:58:03', NULL),
(1399, 187, 149, 1, NULL, NULL, '2019-03-20 07:58:03', NULL),
(1400, 185, 117, 1, NULL, NULL, '2019-03-20 08:05:25', NULL),
(1401, 185, 146, 1, NULL, NULL, '2019-03-20 08:05:25', NULL),
(1402, 185, 149, 1, NULL, NULL, '2019-03-20 08:05:25', NULL),
(1403, 185, 148, 1, NULL, NULL, '2019-03-20 08:05:25', NULL),
(1404, 185, 147, 1, NULL, NULL, '2019-03-20 08:05:25', NULL),
(1412, 156, 164, 1, NULL, NULL, '2019-03-20 08:11:26', NULL),
(1413, 156, 111, 1, NULL, NULL, '2019-03-20 08:11:26', NULL),
(1414, 156, 113, 1, NULL, NULL, '2019-03-20 08:11:26', NULL),
(1415, 156, 165, 1, NULL, NULL, '2019-03-20 08:11:26', NULL),
(1428, 190, 175, 1, NULL, NULL, '2019-03-20 08:50:20', NULL),
(1429, 190, 155, 1, NULL, NULL, '2019-03-20 08:50:20', NULL),
(1430, 190, 117, 1, NULL, NULL, '2019-03-20 08:50:20', NULL),
(1431, 190, 111, 1, NULL, NULL, '2019-03-20 08:50:20', NULL),
(1432, 190, 173, 1, NULL, NULL, '2019-03-20 08:50:20', NULL),
(1433, 190, 161, 1, NULL, NULL, '2019-03-20 08:50:20', NULL),
(1434, 190, 157, 1, NULL, NULL, '2019-03-20 08:50:20', NULL),
(1441, 188, 111, 1, NULL, NULL, '2019-03-20 08:53:07', NULL),
(1442, 188, 155, 1, NULL, NULL, '2019-03-20 08:53:07', NULL),
(1443, 188, 161, 1, NULL, NULL, '2019-03-20 08:53:07', NULL),
(1444, 188, 173, 1, NULL, NULL, '2019-03-20 08:53:07', NULL),
(1445, 188, 117, 1, NULL, NULL, '2019-03-20 08:53:07', NULL),
(1446, 188, 159, 1, NULL, NULL, '2019-03-20 08:53:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_view_log`
--

CREATE TABLE `product_view_log` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `mobile` bigint(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `url` varchar(250) DEFAULT NULL,
  `meta_tag_title` varchar(250) DEFAULT NULL,
  `meta_tag_description` text,
  `meta_tag_keywords` varchar(250) DEFAULT NULL,
  `store_name` varchar(250) DEFAULT NULL,
  `store_owner` varchar(250) DEFAULT NULL,
  `store_address` text,
  `country_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `store_email` varchar(250) DEFAULT NULL,
  `store_telephone` varchar(50) DEFAULT NULL,
  `store_fax` varchar(30) DEFAULT NULL,
  `store_logo` varchar(250) DEFAULT NULL,
  `store_logo_path` varchar(255) DEFAULT NULL,
  `maintenance_mode` int(3) DEFAULT NULL,
  `store_language_name` varchar(250) DEFAULT NULL,
  `store_currency_id` int(11) DEFAULT NULL,
  `store_image` varchar(255) DEFAULT NULL,
  `store_image_path` text,
  `google` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `order_status` int(11) NOT NULL DEFAULT '1',
  `invoice_prefix` varchar(255) DEFAULT NULL,
  `items_per_page` int(11) DEFAULT NULL,
  `category_product_count` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `url`, `meta_tag_title`, `meta_tag_description`, `meta_tag_keywords`, `store_name`, `store_owner`, `store_address`, `country_id`, `zone_id`, `store_email`, `store_telephone`, `store_fax`, `store_logo`, `store_logo_path`, `maintenance_mode`, `store_language_name`, `store_currency_id`, `store_image`, `store_image_path`, `google`, `facebook`, `twitter`, `instagram`, `order_status`, `invoice_prefix`, `items_per_page`, `category_product_count`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(2, 'www.spurt.com', '', '', '', 'online shopping sites in india ', 'Admin', 'Chennai, India', 30, 59, 'admin@gmail.com', '0000000000', '1221', 'Img_1552892256556.jpeg', 'storeLogo/', 1, 'English', 46, 'storeImage', NULL, 'https://plus.google.com/106505712715559114904', 'https://www.facebook.com/spurtcommerce/', 'https://twitter.com/Spurtcommerce', 'https://www.instagram.com/spurt_commerce/', 1, 'SPU', 10, 0, 1, '2019-02-13 06:00:00', '2019-03-20 09:29:47', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stock_status`
--

CREATE TABLE `stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `name`, `is_active`, `created_by`, `modified_by`, `created_date`, `modified_date`) VALUES
(1, 'In stock', 1, NULL, NULL, NULL, NULL),
(2, 'out of Stock', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_path` varchar(255) DEFAULT NULL,
  `code` varchar(32) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_group_id`, `username`, `password`, `first_name`, `last_name`, `email`, `avatar`, `avatar_path`, `code`, `ip`, `address`, `phone_number`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(49, 1, 'admin@piccocart.com', '$2a$10$BIXP6H/VAhXn3berp29R7u7aHBb/BCYKkAZIaJPQHAjlFaamaiGg.', 'Admin', ' ', 'admin@piccocart.com', 'Img_1553077645995.jpeg', 'user/', NULL, NULL, 'India', 1234567890, 1, '2019-02-15 04:13:22', '2019-03-20 05:28:25', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `group_id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `slug` varchar(64) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_group`
--

INSERT INTO `user_group` (`group_id`, `name`, `slug`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(1, 'Admin', 'optional', 0, '2019-01-21 10:38:14', '2019-02-18 23:43:56', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `code` varchar(32) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `code`, `name`, `is_active`, `created_date`, `modified_date`, `created_by`, `modified_by`) VALUES
(58, 45, 'JAF', 'Jaffna', 1, '2019-02-17 22:17:27', '2019-03-12 09:10:27', NULL, NULL),
(59, 22, 'MUM', 'Mumbai', 1, '2019-02-17 22:17:49', '2019-02-25 03:14:09', NULL, NULL),
(63, 22, 'KL', 'kerala', 1, '2019-02-18 23:46:22', '2019-03-14 04:44:48', NULL, NULL),
(66, 22, 'GOA', 'Goa', 1, '2019-02-19 07:19:48', '2019-03-12 09:11:16', NULL, NULL),
(67, 22, 'PY', 'Pondy', 1, '2019-02-19 07:24:14', '2019-03-12 09:12:47', NULL, NULL),
(68, 24, 'ss', 'ss', 1, '2019-02-19 07:25:57', NULL, NULL, NULL),
(73, 24, 'Zone', 'Zone', 0, '2019-02-19 07:46:47', NULL, NULL, NULL),
(74, 30, 'ZX', 'YUY', 1, '2019-02-20 06:38:52', NULL, NULL, NULL),
(75, 24, 'Y', 'UIU', 1, '2019-02-20 06:39:04', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `zone_to_geo_zone`
--

CREATE TABLE `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_token`
--
ALTER TABLE `access_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `fk_customer_id_tbl_customer_customer_id` (`customer_id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`),
  ADD KEY `fk_BannerGroup_Banner` (`banner_group_id`);

--
-- Indexes for table `banner_group`
--
ALTER TABLE `banner_group`
  ADD PRIMARY KEY (`banner_group_id`);

--
-- Indexes for table `banner_image`
--
ALTER TABLE `banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Indexes for table `banner_image_description`
--
ALTER TABLE `banner_image_description`
  ADD PRIMARY KEY (`banner_image_description_id`),
  ADD KEY `fk_Banner_BannerImageDescription` (`banner_id`),
  ADD KEY `fk_BannerImage_BannerImageDescription` (`banner_image_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `category_description`
--
ALTER TABLE `category_description`
  ADD PRIMARY KEY (`category_description_id`),
  ADD KEY `fk_Category_CategoryDescription` (`category_id`);

--
-- Indexes for table `category_path`
--
ALTER TABLE `category_path`
  ADD PRIMARY KEY (`category_path_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_group`
--
ALTER TABLE `customer_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_ip`
--
ALTER TABLE `customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`);

--
-- Indexes for table `customer_transaction`
--
ALTER TABLE `customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`),
  ADD KEY `fk_customer_transaction_order1` (`order_id`),
  ADD KEY `fk_customer_transaction_customer1` (`customer_id`);

--
-- Indexes for table `customer_wishlist`
--
ALTER TABLE `customer_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `geo_zone`
--
ALTER TABLE `geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `login_log`
--
ALTER TABLE `login_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_order_customer1` (`customer_id`),
  ADD KEY `fk_order_currency1` (`currency_id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`order_history_id`),
  ADD KEY `fk_order_history_order1` (`order_id`),
  ADD KEY `fk_order_history_order_status1` (`order_status_id`);

--
-- Indexes for table `order_log`
--
ALTER TABLE `order_log`
  ADD PRIMARY KEY (`order_log_id`),
  ADD KEY `fk_order_customer1` (`customer_id`),
  ADD KEY `fk_order_currency1` (`currency_id`);

--
-- Indexes for table `order_option`
--
ALTER TABLE `order_option`
  ADD PRIMARY KEY (`order_option_id`),
  ADD KEY `fk_order_option_order1` (`order_id`),
  ADD KEY `fk_order_option_order_product1` (`order_product_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `fk_order_product_product1` (`product_id`),
  ADD KEY `fk_order_product_order1` (`order_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`order_status_id`);

--
-- Indexes for table `order_total`
--
ALTER TABLE `order_total`
  ADD PRIMARY KEY (`order_total_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `fk_page_page_group1` (`page_group_id`);

--
-- Indexes for table `page_group`
--
ALTER TABLE `page_group`
  ADD PRIMARY KEY (`page_group_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_description`
--
ALTER TABLE `product_description`
  ADD PRIMARY KEY (`product_description_id`);

--
-- Indexes for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `fk_product_discount_product1` (`product_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `fk_product_image_product1` (`product_id`);

--
-- Indexes for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `fk_product_rating_product1` (`product_id`);

--
-- Indexes for table `product_related`
--
ALTER TABLE `product_related`
  ADD PRIMARY KEY (`related_id`),
  ADD KEY `fk_product_related_product1` (`product_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`product_tag_id`);

--
-- Indexes for table `product_to_category`
--
ALTER TABLE `product_to_category`
  ADD PRIMARY KEY (`product_to_category_id`),
  ADD KEY `fk_product_to_category_product1` (`product_id`),
  ADD KEY `fk_product_to_category_category1` (`category_id`);

--
-- Indexes for table `product_view_log`
--
ALTER TABLE `product_view_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_view_log_Cons_product` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`),
  ADD KEY `fk_Country_Settings` (`country_id`);

--
-- Indexes for table `stock_status`
--
ALTER TABLE `stock_status`
  ADD PRIMARY KEY (`stock_status_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_usergroup` (`user_group_id`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`),
  ADD KEY `fk_Zone_Country` (`country_id`);

--
-- Indexes for table `zone_to_geo_zone`
--
ALTER TABLE `zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`),
  ADD KEY `fk_Zone_ZoneGeo` (`zone_id`),
  ADD KEY `fk_Country_ZoneGeo` (`country_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_token`
--
ALTER TABLE `access_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `banner_group`
--
ALTER TABLE `banner_group`
  MODIFY `banner_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banner_image`
--
ALTER TABLE `banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `banner_image_description`
--
ALTER TABLE `banner_image_description`
  MODIFY `banner_image_description_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;
--
-- AUTO_INCREMENT for table `category_description`
--
ALTER TABLE `category_description`
  MODIFY `category_description_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_path`
--
ALTER TABLE `category_path`
  MODIFY `category_path_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=329;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer_group`
--
ALTER TABLE `customer_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_ip`
--
ALTER TABLE `customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_transaction`
--
ALTER TABLE `customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_wishlist`
--
ALTER TABLE `customer_wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `geo_zone`
--
ALTER TABLE `geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `login_log`
--
ALTER TABLE `login_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_log`
--
ALTER TABLE `order_log`
  MODIFY `order_log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `order_option`
--
ALTER TABLE `order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `order_total`
--
ALTER TABLE `order_total`
  MODIFY `order_total_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT for table `page_group`
--
ALTER TABLE `page_group`
  MODIFY `page_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `product_description`
--
ALTER TABLE `product_description`
  MODIFY `product_description_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1115;
--
-- AUTO_INCREMENT for table `product_rating`
--
ALTER TABLE `product_rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_related`
--
ALTER TABLE `product_related`
  MODIFY `related_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=348;
--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `product_tag_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_to_category`
--
ALTER TABLE `product_to_category`
  MODIFY `product_to_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1447;
--
-- AUTO_INCREMENT for table `product_view_log`
--
ALTER TABLE `product_view_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stock_status`
--
ALTER TABLE `stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `user_group`
--
ALTER TABLE `user_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- AUTO_INCREMENT for table `zone`
--
ALTER TABLE `zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `zone_to_geo_zone`
--
ALTER TABLE `zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `fk_customer_id_tbl_customer_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `banner`
--
ALTER TABLE `banner`
  ADD CONSTRAINT `fk_BannerGroup_Banner` FOREIGN KEY (`banner_group_id`) REFERENCES `banner_group` (`banner_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `banner_image_description`
--
ALTER TABLE `banner_image_description`
  ADD CONSTRAINT `fk_BannerImage_BannerImageDescription` FOREIGN KEY (`banner_image_id`) REFERENCES `banner_image` (`banner_image_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Banner_BannerImageDescription` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`banner_id`) ON DELETE CASCADE;

--
-- Constraints for table `category_description`
--
ALTER TABLE `category_description`
  ADD CONSTRAINT `fk_Category_CategoryDescription` FOREIGN KEY (`category_id`) REFERENCES `oldcategory` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_transaction`
--
ALTER TABLE `customer_transaction`
  ADD CONSTRAINT `fk_customer_transaction_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_customer_transaction_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_wishlist`
--
ALTER TABLE `customer_wishlist`
  ADD CONSTRAINT `customer_wishlist_Cons_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_wishlist_Cons_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_currency1` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`currency_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_history`
--
ALTER TABLE `order_history`
  ADD CONSTRAINT `fk_order_history_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_history_order_status1` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`order_status_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_option`
--
ALTER TABLE `order_option`
  ADD CONSTRAINT `fk_order_option_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_option_order_product1` FOREIGN KEY (`order_product_id`) REFERENCES `order_product` (`order_product_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `fk_order_product_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_product_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `page`
--
ALTER TABLE `page`
  ADD CONSTRAINT `fk_page_page_group1` FOREIGN KEY (`page_group_id`) REFERENCES `page_group` (`page_group_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD CONSTRAINT `fk_product_discount_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `fk_product_image_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_rating`
--
ALTER TABLE `product_rating`
  ADD CONSTRAINT `fk_product_rating_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_related`
--
ALTER TABLE `product_related`
  ADD CONSTRAINT `fk_product_related_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_to_category`
--
ALTER TABLE `product_to_category`
  ADD CONSTRAINT `fk_product_to_category_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_to_category_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `product_view_log`
--
ALTER TABLE `product_view_log`
  ADD CONSTRAINT `product_view_log_Cons_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_usergroup` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`group_id`) ON DELETE CASCADE;

--
-- Constraints for table `zone`
--
ALTER TABLE `zone`
  ADD CONSTRAINT `fk_Zone_Country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE;

--
-- Constraints for table `zone_to_geo_zone`
--
ALTER TABLE `zone_to_geo_zone`
  ADD CONSTRAINT `fk_Country_ZoneGeo` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_Zone_ZoneGeo` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`zone_id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
