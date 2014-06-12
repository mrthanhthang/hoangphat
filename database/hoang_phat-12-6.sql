-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 12, 2014 at 10:35 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hoang_phat`
--
CREATE DATABASE IF NOT EXISTS `hoang_phat` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `hoang_phat`;

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` longtext COLLATE utf8_unicode_ci NOT NULL,
  `viewed` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `home` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `slug` (`slug`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `cat_id`, `slug`, `title`, `keyword`, `description`, `detail`, `viewed`, `date_created`, `status`, `properties`, `position`, `home`) VALUES
(7, 14, '', 'Dự án mũi né', '', '', '', 0, '0000-00-00 00:00:00', 0, 'a:2:{s:4:"file";a:3:{i:0;s:26:"artcat15331_1401440948.jpg";i:1;s:26:"artcat52163_1401440948.jpg";i:2;s:25:"artcat7891_1401440948.jpg";}s:5:"avata";s:27:"artcat341127_1401858378.jpg";}', 0, 1),
(2, 16, '', 'Tàu Trung Quốc tấn công vòi rồng, tàu Việt Nam đáp trả thích đáng', '', '<p>T&agrave;u Trung Quốc tấn c&ocirc;ng v&ograve;i rồng, t&agrave;u Việt Nam đ&aacute;p trả th&iacute;ch đ&aacute;ng</p>', '16', 0, '0000-00-00 00:00:00', 1, 'a:1:{s:4:"file";a:0:{}}', 1, 1),
(8, 16, '', 'tin tuc', '', '<p>tin tuc</p>', '16', 0, '0000-00-00 00:00:00', 0, 'a:0:{}', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `article_category`
--

CREATE TABLE IF NOT EXISTS `article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `properties` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `parent_id`, `slug`, `name`, `description`, `position`, `properties`, `status`) VALUES
(14, 0, 'du-an-tieu-bieu', 'Dự Án Tiêu Biểu', '<p>Dự &Aacute;n Ti&ecirc;u Biểu</p>', 1, 'a:0:{}', 0),
(15, 0, 'gioi-thieu', 'Giới Thiệu', '<p>Giới Thiệu</p>', 2, 'a:0:{}', 0),
(16, 0, 'tin-tuc', 'Tin Tức', '<p>Tin Tức</p>', 3, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `parent_id`, `level`) VALUES
(1, 'Ly thủy tinh', 'cat_29496_1374388957.jpg', 0, 0),
(2, 'Thố thủy tinh', 'cat_48752_1374389292.jpg', 0, 0),
(3, 'Đĩa thủy tinh', 'cat_17855_1374484875.jpg', 0, 0),
(4, 'Chén thủy tinh', 'cat_21619_1374484858.jpg', 0, 0),
(5, 'Tô thủy tinh', 'cat_258828_1388027308.jpg', 0, 0),
(6, 'test', '', 1, 0),
(7, 'tesst', 'cat_15331_1401441300.jpg', 0, 0),
(8, 'test', '', 1, 0),
(9, 'con test', '', 6, 0),
(10, 'nua', '', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `email` (`email`),
  KEY `username` (`username`),
  KEY `fullname` (`fullname`),
  KEY `type_2` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `password`, `fullname`, `address`, `email`, `tel`, `date_created`, `type`, `status`) VALUES
(1, 'mrthanhthang', '202cb962ac59075b964b07152d234b70', 'Dang Cong Tu', 'Go vap', 'mrthanhthang@gmail.com', '0974436059', '2013-12-26 00:00:00', '1', 1),
(2, 'nguyenthiphuong', '202cb962ac59075b964b07152d234b70', 'Nguyen Buoi', 'Thu Duc', 'peten1304@gmail.com', '01655984794', '2013-12-26 00:00:00', '1', 1),
(3, 'mrthanhthang10', '123', 'Đặng Công Tử', 'go vap', 'anhthangfacebook@gmail.com', '0974436059', '0000-00-00 00:00:00', '', 0),
(4, 'mrthanhthang3', '123456', 'Đặng Công Tử 2', 'go vap', 'peten1304@gmail.com', '0974436059', '0000-00-00 00:00:00', '', 0),
(5, 'mrthanhthang3sua', '1234560', 'Đặng Công Tử 2 sua', 'go vap sua', 'peten1304@gmail.comsua', '09744360590', '0000-00-00 00:00:00', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `arr_images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_create` datetime NOT NULL,
  `is_active` smallint(6) NOT NULL,
  `price` int(11) NOT NULL,
  `discount_percent` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `home` tinyint(4) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=27 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `category_id`, `description`, `arr_images`, `date_create`, `is_active`, `price`, `discount_percent`, `view`, `status`, `home`, `position`) VALUES
(1, 'Chén sọc cao cấp', 4, '', 'a:4:{i:0;s:25:"item_40948_1375085787.jpg";i:1;s:25:"item_66542_1375089077.jpg";i:2;s:25:"item_57293_1375089077.jpg";i:3;s:25:"item_38445_1375089077.jpg";}', '2014-02-21 04:11:33', 1, 0, 0, 57, 1, 1, 0),
(2, 'Tô chấm bi', 5, '', 'a:1:{i:0;s:25:"item_66542_1375085846.jpg";}', '2013-10-28 22:18:06', 1, 0, 0, 40, 0, 0, 0),
(3, 'Đĩa 8 inch', 3, '', 'a:1:{i:0;s:25:"item_65111_1375085911.jpg";}', '2013-10-28 22:18:07', 1, 0, 0, 41, 0, 0, 0),
(4, 'Thố thủy tinh', 2, '', 'a:1:{i:0;s:25:"item_42523_1375085988.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 26, 0, 0, 0),
(5, 'Chén cườm', 4, '', 'a:1:{i:0;s:25:"item_57293_1375086952.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 49, 0, 0, 0),
(6, 'Chén chấm bi', 4, '', 'a:1:{i:0;s:25:"item_87021_1375087005.jpg";}', '2013-10-28 22:18:10', 1, 0, 0, 45, 0, 0, 0),
(8, 'Đĩa 9 inch', 3, '', 'a:3:{i:0;s:25:"item_93363_1375087131.jpg";i:1;s:26:"item_179494_1401432794.jpg";i:2;s:26:"item_225183_1401432832.jpg";}', '2014-05-30 06:53:52', 1, 1, 0, 0, 1, 1, 0),
(9, 'Tô 8 trơn', 5, '', 'a:1:{i:0;s:25:"item_38445_1375087174.jpg";}', '2013-10-29 04:18:32', 1, 0, 0, 46, 0, 0, 0),
(10, 'Ly bầu cao', 1, '', 'a:1:{i:0;s:25:"item_35802_1375087220.jpg";}', '2013-10-29 03:23:21', 1, 0, 0, 51, 0, 0, 0),
(12, 'VS-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0161 M3</p>\r\n<p>13.31 KG</p>\r\n<p>20FT = 8,334 DOZ</p>\r\n<p>UPC : 088629027431</p>', 'a:1:{i:0;s:24:"item_8386_1383009823.jpg";}', '2013-10-29 04:17:23', 1, 0, 0, 2, 0, 0, 0),
(13, 'TUL-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0192 M3</p>\r\n<p>13.50 KG</p>\r\n<p>20FT = 8,220 DOZ</p>\r\n<p>UPC : 088629429747</p>', 'a:1:{i:0;s:24:"item_6502_1383010011.jpg";}', '2013-10-29 04:18:22', 1, 0, 0, 1, 0, 0, 0),
(14, 'SK-03B', 3, '<p>150 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0188 M3</p>\r\n<p>11.20 KG</p>\r\n<p>20FT = 9,264 DOZ</p>\r\n<p>UPC : 088629424896</p>', 'a:1:{i:0;s:24:"item_3700_1383010505.jpg";}', '2013-10-29 04:18:04', 1, 0, 0, 1, 0, 0, 0),
(15, 'RB-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0191 M3</p>\r\n<p>14.25 KG</p>\r\n<p>20FT = 7,788 DOZ</p>\r\n<p>UPC : 088629310137</p>', 'a:1:{i:0;s:24:"item_4074_1383010745.jpg";}', '2013-10-29 04:17:22', 1, 0, 0, 7, 0, 0, 0),
(16, 'PM-03B', 3, '<p>126 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0157 M3</p>\r\n<p>10.75 KG</p>\r\n<p>20FT = 10,320 DOZ</p>\r\n<p>UPC : 088629408759</p>', 'a:1:{i:0;s:24:"item_4185_1383010818.jpg";}', '2013-10-29 04:17:13', 1, 0, 0, 1, 0, 0, 0),
(17, 'PM-01B', 3, '<p>139 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0198 M3</p>\r\n<p>12.55 KG</p>\r\n<p>20FT = 8,802 DOZ</p>\r\n<p>UPC : 088629307571</p>', 'a:1:{i:0;s:24:"item_3915_1383010899.jpg";}', '2013-10-29 04:16:27', 1, 0, 0, 1, 0, 0, 0),
(19, 'RH-5B', 5, '', 'a:1:{i:0;s:25:"item_30546_1383011470.jpg";}', '2013-10-29 04:17:23', 1, 0, 0, 6, 0, 1, 0),
(20, 'GPH-5B', 5, '', 'a:1:{i:0;s:25:"item_23103_1383011509.jpg";}', '2013-10-29 04:16:42', 1, 0, 0, 1, 0, 0, 0),
(21, 'GPC-5B', 5, '', 'a:1:{i:0;s:25:"item_21834_1383011612.jpg";}', '2013-10-29 04:16:42', 1, 0, 0, 1, 0, 0, 0),
(22, 'NBB-5B', 5, '', 'a:1:{i:0;s:25:"item_18496_1383011676.jpg";}', '2013-10-29 04:16:34', 1, 0, 0, 1, 0, 0, 0),
(26, 'girl', 0, '', 'a:3:{i:0;s:24:"item_6502_1401433784.jpg";i:1;s:24:"item_3700_1401439414.jpg";i:2;s:24:"item_4185_1401439431.jpg";}', '2014-05-30 08:43:51', 1, 1, 1, 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_order` datetime NOT NULL,
  `order_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_phone` int(11) NOT NULL,
  `order_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `itemt_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `username`, `password`) VALUES
(1, 'Chanh Tay Admin', 'admin', '202cb962ac59075b964b07152d234b70');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
