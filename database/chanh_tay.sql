-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 29, 2013 at 04:44 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `chanh_tay`
--

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
(5, 'Tô thủy tinh', 'cat_40948_1375087759.jpg', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=24 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `category_id`, `description`, `arr_images`, `date_create`, `is_active`, `price`, `discount_percent`, `view`) VALUES
(1, 'Chén sọc cao cấp', 4, '', 'a:4:{i:0;s:25:"item_40948_1375085787.jpg";i:1;s:25:"item_66542_1375089077.jpg";i:2;s:25:"item_57293_1375089077.jpg";i:3;s:25:"item_38445_1375089077.jpg";}', '2013-10-29 04:14:29', 1, 0, 0, 56),
(2, 'Tô chấm bi', 5, '', 'a:1:{i:0;s:25:"item_66542_1375085846.jpg";}', '2013-10-28 22:18:06', 1, 0, 0, 40),
(3, 'Đĩa 8 inch', 3, '', 'a:1:{i:0;s:25:"item_65111_1375085911.jpg";}', '2013-10-28 22:18:07', 1, 0, 0, 41),
(4, 'Thố thủy tinh', 2, '', 'a:1:{i:0;s:25:"item_42523_1375085988.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 26),
(5, 'Chén cườm', 4, '', 'a:1:{i:0;s:25:"item_57293_1375086952.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 49),
(6, 'Chén chấm bi', 4, '', 'a:1:{i:0;s:25:"item_87021_1375087005.jpg";}', '2013-10-28 22:18:10', 1, 0, 0, 45),
(7, 'Thố thủy tinh 5 inch', 2, '', 'a:1:{i:0;s:25:"item_93930_1375087058.jpg";}', '2013-10-29 04:18:38', 1, 0, 0, 31),
(8, 'Đĩa 9 inch', 3, '', 'a:1:{i:0;s:25:"item_93363_1375087131.jpg";}', '2013-10-29 04:25:11', 1, 0, 0, 61),
(9, 'Tô 8 trơn', 5, '', 'a:1:{i:0;s:25:"item_38445_1375087174.jpg";}', '2013-10-29 04:18:32', 1, 0, 0, 46),
(10, 'Ly bầu cao', 1, '', 'a:1:{i:0;s:25:"item_35802_1375087220.jpg";}', '2013-10-29 03:23:21', 1, 0, 0, 51),
(11, 'Thố thủy tinh 7 inch', 2, '', 'a:1:{i:0;s:25:"item_93930_1375087318.jpg";}', '2013-10-29 04:18:31', 1, 0, 0, 54),
(12, 'VS-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0161 M3</p>\r\n<p>13.31 KG</p>\r\n<p>20FT = 8,334 DOZ</p>\r\n<p>UPC : 088629027431</p>', 'a:1:{i:0;s:24:"item_8386_1383009823.jpg";}', '2013-10-29 04:17:23', 1, 0, 0, 2),
(13, 'TUL-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0192 M3</p>\r\n<p>13.50 KG</p>\r\n<p>20FT = 8,220 DOZ</p>\r\n<p>UPC : 088629429747</p>', 'a:1:{i:0;s:24:"item_6502_1383010011.jpg";}', '2013-10-29 04:18:22', 1, 0, 0, 1),
(14, 'SK-03B', 3, '<p>150 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0188 M3</p>\r\n<p>11.20 KG</p>\r\n<p>20FT = 9,264 DOZ</p>\r\n<p>UPC : 088629424896</p>', 'a:1:{i:0;s:24:"item_3700_1383010505.jpg";}', '2013-10-29 04:18:04', 1, 0, 0, 1),
(15, 'RB-02B', 3, '<p>140 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0191 M3</p>\r\n<p>14.25 KG</p>\r\n<p>20FT = 7,788 DOZ</p>\r\n<p>UPC : 088629310137</p>', 'a:1:{i:0;s:24:"item_4074_1383010745.jpg";}', '2013-10-29 04:17:22', 1, 0, 0, 7),
(16, 'PM-03B', 3, '<p>126 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0157 M3</p>\r\n<p>10.75 KG</p>\r\n<p>20FT = 10,320 DOZ</p>\r\n<p>UPC : 088629408759</p>', 'a:1:{i:0;s:24:"item_4185_1383010818.jpg";}', '2013-10-29 04:17:13', 1, 0, 0, 1),
(17, 'PM-01B', 3, '<p>139 MM</p>\r\n<p>6 DOZ-6</p>\r\n<p>0.0198 M3</p>\r\n<p>12.55 KG</p>\r\n<p>20FT = 8,802 DOZ</p>\r\n<p>UPC : 088629307571</p>', 'a:1:{i:0;s:24:"item_3915_1383010899.jpg";}', '2013-10-29 04:16:27', 1, 0, 0, 1),
(18, 'FM-360P', 1, '', 'a:1:{i:0;s:25:"item_23085_1383011372.jpg";}', '2013-10-29 04:16:48', 1, 0, 0, 1),
(19, 'RH-5B', 5, '', 'a:1:{i:0;s:25:"item_30546_1383011470.jpg";}', '2013-10-29 04:17:23', 1, 0, 0, 6),
(20, 'GPH-5B', 5, '', 'a:1:{i:0;s:25:"item_23103_1383011509.jpg";}', '2013-10-29 04:16:42', 1, 0, 0, 1),
(21, 'GPC-5B', 5, '', 'a:1:{i:0;s:25:"item_21834_1383011612.jpg";}', '2013-10-29 04:16:42', 1, 0, 0, 1),
(22, 'NBB-5B', 5, '', 'a:1:{i:0;s:25:"item_18496_1383011676.jpg";}', '2013-10-29 04:16:34', 1, 0, 0, 1),
(23, 'NRB-7B', 5, '', 'a:1:{i:0;s:25:"item_18353_1383011750.jpg";}', '2013-10-29 04:15:50', 1, 0, 0, 2);

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
(1, 'Chanh Tay Admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
