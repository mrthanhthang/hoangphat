-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 12, 2014 at 09:39 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chanh_tay`
--
CREATE DATABASE IF NOT EXISTS `chanh_tay` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `chanh_tay`;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `cat_id`, `slug`, `title`, `keyword`, `description`, `detail`, `viewed`, `date_created`, `status`, `properties`, `position`, `home`) VALUES
(1, 5, '<p>10g s&aacute;ng 11-5, một hồi c&ograve;i d&agrave;i b&aacute;o động vang l&ecirc;n từ buồng l&aacute;i, thuyền trưởng Cao Duy ph&aacute;t lệnh: &ldquo;Đ&atilde; ph&aacute;t hiện mục ti&ecirc;u, to&agrave;n t&agrave;u v&agrave;o vị tr&iacute; chiến đấu&', 'Tàu Trung Quốc liên tục tấn công tàu Việt Nam da sua', '<p>10g s&aacute;ng 11-5, một hồi c&ograve;i d&agrave;i b&aacute;o động vang l&ecirc;n từ buồng l&aacute;i, thuyền trưởng Cao Duy ph&aacute;t lệnh: &ldquo;Đ&atilde; ph&aacute;t hiện mục ti&ecirc;u, to&agrave;n t&agrave;u v&agrave;o vị tr&iacute; chiến đấu&', '<p>10g s&aacute;ng 11-5, một hồi c&ograve;i d&agrave;i b&aacute;o động vang l&ecirc;n từ buồng l&aacute;i, thuyền trưởng Cao Duy ph&aacute;t lệnh: &ldquo;Đ&atilde; ph&aacute;t hiện mục ti&ecirc;u, to&agrave;n t&agrave;u v&agrave;o vị tr&iacute; chiến đấu&rdquo;.&nbsp; da sua</p>', '<p>10g s&aacute;ng 11-5, một hồi c&ograve;i d&agrave;i b&aacute;o động vang l&ecirc;n từ buồng l&aacute;i, thuyền trưởng Cao Duy ph&aacute;t lệnh: &ldquo;Đ&atilde; ph&aacute;t hiện mục ti&ecirc;u, to&agrave;n t&agrave;u v&agrave;o vị tr&iacute; chiến đấu&rdquo;.&nbsp; da sua lan2</p>', 10, '2014-05-12 00:00:00', 0, 'a:1:{s:5:"avata";s:27:"artcat529760_1399883537.png";}', 2, 1),
(2, 2, '', 'Tàu Trung Quốc tấn công vòi rồng, tàu Việt Nam đáp trả thích đáng', '', '<p>T&agrave;u Trung Quốc tấn c&ocirc;ng v&ograve;i rồng, t&agrave;u Việt Nam đ&aacute;p trả th&iacute;ch đ&aacute;ng</p>', '<p>T&agrave;u Trung Quốc tấn c&ocirc;ng v&ograve;i rồng, t&agrave;u Việt Nam đ&aacute;p trả th&iacute;ch đ&aacute;ng</p>', 0, '0000-00-00 00:00:00', 0, 'a:1:{s:5:"avata";s:27:"artcat112235_1399887231.jpg";}', 1, 0),
(3, 2, '', 'Tin tức 2', '', '<p>1111111111</p>', '2', 0, '0000-00-00 00:00:00', 0, 'a:1:{s:5:"avata";s:27:"artcat112235_1399887479.jpg";}', 3, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `parent_id`, `slug`, `name`, `description`, `position`, `properties`, `status`) VALUES
(1, 0, 'Gioithieu', 'Gioi Thieu', '', 1, '', 0),
(2, 0, 'TinTuc', 'Tin Tuc', '', 0, '', 0),
(3, 0, 'Tuyen DUng', 'Tuyen DUng', '', 0, '', 0),
(4, 1, 'GioiThieuCongTy', 'Giới Thiệu Công Ty', '', 0, '', 0),
(5, 2, '', 'Tin Xã Hội', '', 0, '', 0),
(6, 5, '', 'Tin Bão lụt', '', 0, '', 0),
(7, 4, '', 'Gioi thieu cong ty', 'khong co gi', 1, 'N;', 0),
(8, 4, '', 'So luoc cong ty', '<p>Moo tar</p>', 1, 'N;', 0),
(9, 8, '', 'Giày Butterfly su tiep', '<p>tht su tiep</p>', 10, 'a:1:{s:5:"avata";s:27:"artcat529760_1399864672.png";}', 0),
(10, 0, '', 'Them cai coi sua', '<p>th&ecirc; &nbsp;sua</p>', 10, 'a:1:{s:5:"avata";s:26:"artcat16035_1393492512.jpg";}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `parent_id`) VALUES
(1, 'Ly thủy tinh', 'cat_29496_1374388957.jpg', 0),
(2, 'Thố thủy tinh', 'cat_48752_1374389292.jpg', 0),
(3, 'Đĩa thủy tinh', 'cat_17855_1374484875.jpg', 0),
(4, 'Chén thủy tinh', 'cat_21619_1374484858.jpg', 0),
(5, 'Tô thủy tinh', 'cat_258828_1388027308.jpg', 0),
(6, 'test', '', 1);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `category_id`, `description`, `arr_images`, `date_create`, `is_active`, `price`, `discount_percent`, `view`) VALUES
(1, 'Chén sọc cao cấp', 4, '', 'a:4:{i:0;s:25:"item_40948_1375085787.jpg";i:1;s:25:"item_66542_1375089077.jpg";i:2;s:25:"item_57293_1375089077.jpg";i:3;s:25:"item_38445_1375089077.jpg";}', '2014-02-21 04:11:33', 1, 0, 0, 57),
(2, 'Tô chấm bi', 5, '', 'a:1:{i:0;s:25:"item_66542_1375085846.jpg";}', '2013-10-28 22:18:06', 1, 0, 0, 40),
(3, 'Đĩa 8 inch', 3, '', 'a:1:{i:0;s:25:"item_65111_1375085911.jpg";}', '2013-10-28 22:18:07', 1, 0, 0, 41),
(4, 'Thố thủy tinh', 2, '', 'a:1:{i:0;s:25:"item_42523_1375085988.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 26),
(5, 'Chén cườm', 4, '', 'a:1:{i:0;s:25:"item_57293_1375086952.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 49),
(6, 'Chén chấm bi', 4, '', 'a:1:{i:0;s:25:"item_87021_1375087005.jpg";}', '2013-10-28 22:18:10', 1, 0, 0, 45),
(7, 'Thố thủy tinh 5 inch', 2, '', 'a:1:{i:0;s:25:"item_93930_1375087058.jpg";}', '2014-02-21 04:11:09', 1, 0, 0, 33),
(8, 'Đĩa 9 inch', 3, '', 'a:1:{i:0;s:25:"item_93363_1375087131.jpg";}', '2013-10-29 04:25:11', 1, 0, 0, 61),
(9, 'Tô 8 trơn', 5, '', 'a:1:{i:0;s:25:"item_38445_1375087174.jpg";}', '2013-10-29 04:18:32', 1, 0, 0, 46),
(10, 'Ly bầu cao', 1, '', 'a:1:{i:0;s:25:"item_35802_1375087220.jpg";}', '2013-10-29 03:23:21', 1, 0, 0, 51),
(11, 'Thố thủy tinh 7 inch', 2, '', 'a:1:{i:0;s:25:"item_93930_1375087318.jpg";}', '2014-02-21 04:11:43', 1, 0, 0, 55),
(12, 'VS-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0161 M3</p>\r\n<p>13.31 KG</p>\r\n<p>20FT = 8,334 DOZ</p>\r\n<p>UPC : 088629027431</p>', 'a:1:{i:0;s:24:"item_8386_1383009823.jpg";}', '2013-10-29 04:17:23', 1, 0, 0, 2),
(13, 'TUL-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0192 M3</p>\r\n<p>13.50 KG</p>\r\n<p>20FT = 8,220 DOZ</p>\r\n<p>UPC : 088629429747</p>', 'a:1:{i:0;s:24:"item_6502_1383010011.jpg";}', '2013-10-29 04:18:22', 1, 0, 0, 1),
(14, 'SK-03B', 3, '<p>150 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0188 M3</p>\r\n<p>11.20 KG</p>\r\n<p>20FT = 9,264 DOZ</p>\r\n<p>UPC : 088629424896</p>', 'a:1:{i:0;s:24:"item_3700_1383010505.jpg";}', '2013-10-29 04:18:04', 1, 0, 0, 1),
(15, 'RB-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0191 M3</p>\r\n<p>14.25 KG</p>\r\n<p>20FT = 7,788 DOZ</p>\r\n<p>UPC : 088629310137</p>', 'a:1:{i:0;s:24:"item_4074_1383010745.jpg";}', '2013-10-29 04:17:22', 1, 0, 0, 7),
(16, 'PM-03B', 3, '<p>126 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0157 M3</p>\r\n<p>10.75 KG</p>\r\n<p>20FT = 10,320 DOZ</p>\r\n<p>UPC : 088629408759</p>', 'a:1:{i:0;s:24:"item_4185_1383010818.jpg";}', '2013-10-29 04:17:13', 1, 0, 0, 1),
(17, 'PM-01B', 3, '<p>139 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0198 M3</p>\r\n<p>12.55 KG</p>\r\n<p>20FT = 8,802 DOZ</p>\r\n<p>UPC : 088629307571</p>', 'a:1:{i:0;s:24:"item_3915_1383010899.jpg";}', '2013-10-29 04:16:27', 1, 0, 0, 1),
(18, 'FM-360P', 1, '', 'a:2:{i:0;s:25:"item_23085_1383011372.jpg";i:1;s:26:"item_179494_1393489275.jpg";}', '2014-02-27 08:21:15', 1, 1, 0, 0),
(19, 'RH-5B', 5, '', 'a:1:{i:0;s:25:"item_30546_1383011470.jpg";}', '2013-10-29 04:17:23', 1, 0, 0, 6),
(20, 'GPH-5B', 5, '', 'a:1:{i:0;s:25:"item_23103_1383011509.jpg";}', '2013-10-29 04:16:42', 1, 0, 0, 1),
(21, 'GPC-5B', 5, '', 'a:1:{i:0;s:25:"item_21834_1383011612.jpg";}', '2013-10-29 04:16:42', 1, 0, 0, 1),
(22, 'NBB-5B', 5, '', 'a:1:{i:0;s:25:"item_18496_1383011676.jpg";}', '2013-10-29 04:16:34', 1, 0, 0, 1),
(23, 'NRB-7B', 5, '', 'a:1:{i:0;s:25:"item_18353_1383011750.jpg";}', '2014-02-21 04:11:50', 1, 0, 0, 3),
(24, 'Giày Butterfly', 1, '<p>m&ocirc; tả</p>', 'a:1:{i:0;s:27:"item_2348502_1387939954.JPG";}', '2013-12-25 03:11:33', 1, 550000, 0, 4),
(25, 'test', 1, '', 'a:0:{}', '2014-02-21 07:44:53', 1, 1, 0, 0);

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
