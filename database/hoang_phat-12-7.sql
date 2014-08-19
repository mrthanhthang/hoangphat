-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 12, 2014 at 10:40 AM
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
  `date_created` date NOT NULL,
  `status` tinyint(4) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `home` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `slug` (`slug`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `cat_id`, `slug`, `title`, `keyword`, `description`, `detail`, `viewed`, `date_created`, `status`, `properties`, `position`, `home`) VALUES
(7, 18, '', 'Dự án mũi né', '', '', '', 0, '0000-00-00', 1, 'a:2:{s:4:"file";a:3:{i:0;s:26:"artcat15331_1401440948.jpg";i:1;s:26:"artcat52163_1401440948.jpg";i:2;s:25:"artcat7891_1401440948.jpg";}s:5:"avata";s:27:"artcat341127_1401858378.jpg";}', 0, 1),
(2, 18, '', 'Thượng viện Mỹ nhất trí thông qua Nghị quyết về Biển Đông', '', '<p>&nbsp;</p>\r\n<div style="text-align: justify;">Cụ thể, ng&agrave;y 1/5 vừa qua, Tổng c&ocirc;ng ty Dầu kh&iacute; Hải dương Trung Quốc (CNOOC), với sự th&aacute;p t&ugrave;ng của hơn 25 t&agrave;u, đ&atilde; hạ đặt tr&aacute;i ph&eacute;p gi&agrave;n khoan Hải Dương-981 (Haiyang Shiyou-981) tại l&ocirc; 143, c&aacute;ch bờ biển Việt Nam 120 hải l&yacute;.</div>', '<header class="article-header">\r\n<h1>Thượng viện Mỹ nhất tr&iacute; th&ocirc;ng qua Nghị quyết về Biển Đ&ocirc;ng</h1>\r\n<p class="meta"><span class="author"> (TTXVN/Vietnam+)</span> <time>l&uacute;c : 11/07/14 11:35 </time></p>\r\n</header>\r\n<div style="text-align: justify;">\r\n<div class="article-photo"><a href="http://img.vietnamplus.vn/t660/Uploaded/obvunua/2014_07_11/ttxvn_tau_ca.jpg" rel="photoslide"><img src="http://img.vietnamplus.vn/t660/Uploaded/obvunua/2014_07_11/ttxvn_tau_ca.jpg" alt="" /></a>T&agrave;u c&aacute; ĐNa 90152 bị t&agrave;u Trung Quốc tấn c&ocirc;ng đ&acirc;m ch&igrave;m tr&ecirc;n v&ugrave;ng biển Việt Nam. (Ảnh: Trần L&ecirc; L&acirc;m/TTXVN)</div>\r\n<br /> Ng&agrave;y 10/7, với to&agrave;n bộ phiếu thuận, Thượng viện Mỹ đ&atilde; nhất tr&iacute; th&ocirc;ng qua Nghị quyết mang m&atilde; số S.RES.412 về Biển Đ&ocirc;ng y&ecirc;u cầu Trung Quốc quay lại nguy&ecirc;n trạng trước ng&agrave;y 1/5/2014.</div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Theo ph&oacute;ng vi&ecirc;n TTXVN tại Washington, Nghị quyết S.RES.412 được một số thượng nghị sỹ c&oacute; ảnh hưởng bảo trợ như Chủ tịch thường trực Thượng viện Patrick Leahy; Thượng nghị sỹ John McCain; Thượng nghị sỹ Robert Menendez; Chủ tịch Ủy ban đối ngoại Thượng viện Benjamin Cardin; Thượng nghị sỹ James Risch; Thượng nghị sỹ Marco Rubio; Thượng nghị sỹ Dianne Feinstein v&agrave; Thượng nghị sỹ John Cronyn.</div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Nghị quyết khẳng định sự ủng hộ của ch&iacute;nh phủ Mỹ đối với quyền tự do h&agrave;ng hải, sử dụng c&aacute;c v&ugrave;ng biển v&agrave; kh&ocirc;ng phận ở khu vực ch&acirc;u &Aacute;-Th&aacute;i B&igrave;nh Dương theo đ&uacute;ng quy định của luật ph&aacute;p quốc tế.</div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Nghị quyết n&ecirc;u r&otilde; mặc d&ugrave; kh&ocirc;ng phải l&agrave; một b&ecirc;n c&oacute; y&ecirc;u s&aacute;ch ở Biển Đ&ocirc;ng nhưng Mỹ l&agrave; một cường quốc ch&acirc;u &Aacute;-Th&aacute;i B&igrave;nh Dương, c&oacute; lợi &iacute;ch quốc gia trong việc khuyến kh&iacute;ch v&agrave; ủng hộ c&aacute;c quốc gia trong khu vực hợp t&aacute;c với nhau để giải quyết c&aacute;c tranh chấp bằng con đường ngoại giao v&agrave; h&ograve;a b&igrave;nh; phản đối việc cưỡng bức, h&ugrave; dọa, đe dọa hoặc sử dụng vũ lực.</div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Nghị quyết nhấn mạnh tầm quan trọng sống c&ograve;n của tuyến h&agrave;ng hải qua Biển Đ&ocirc;ng, cho rằng việc gia tăng c&aacute;c hoạt động tuần tra v&agrave; đưa ra c&aacute;c quy định đối với c&aacute;c v&ugrave;ng biển v&agrave; kh&ocirc;ng phận c&oacute; tranh chấp ở Biển Đ&ocirc;ng đang l&agrave;m gia tăng căng thẳng cũng như nguy cơ đối đầu. </div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Nghị quyết S.RES.412 liệt k&ecirc; một loạt h&agrave;nh động của Trung Quốc vi phạm luật ph&aacute;p quốc tế, trong đ&oacute; c&oacute; C&ocirc;ng ước Li&ecirc;n hợp quốc về Luật biển năm 1982 (UNCLOS). </div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Cụ thể, ng&agrave;y 1/5 vừa qua, Tổng c&ocirc;ng ty Dầu kh&iacute; Hải dương Trung Quốc (CNOOC), với sự th&aacute;p t&ugrave;ng của hơn 25 t&agrave;u, đ&atilde; hạ đặt tr&aacute;i ph&eacute;p gi&agrave;n khoan Hải Dương-981 (Haiyang Shiyou-981) tại l&ocirc; 143, c&aacute;ch bờ biển Việt Nam 120 hải l&yacute;. </div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Sau đ&oacute;, Trung Quốc điều động th&ecirc;m hơn 80 t&agrave;u, trong đ&oacute; c&oacute; 7 t&agrave;u qu&acirc;n sự, v&agrave; sử dụng m&aacute;y bay trực thăng, v&ograve;i rồng để ngăn chặn hoặc c&oacute; những h&agrave;nh động đe dọa, nhiều lần cố t&igrave;nh đ&acirc;m h&uacute;c t&agrave;u của Việt Nam. Trung Quốc cũng thiết lập v&ugrave;ng bất khả x&acirc;m phạm xung quanh gi&agrave;n khoan Hải Dương-981&hellip;</div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Nghị quyết cho rằng c&aacute;c y&ecirc;u s&aacute;ch l&atilde;nh thổ v&agrave; h&agrave;nh động tr&ecirc;n đ&acirc;y của Trung Quốc l&agrave; kh&ocirc;ng thể biện minh theo luật ph&aacute;p quốc tế như đ&atilde; được n&ecirc;u r&otilde; trong UNCLOS v&agrave; l&agrave; một h&agrave;nh động đơn phương nhằm thay đổi nguy&ecirc;n trạng bằng vũ lực, vi phạm Tuy&ecirc;n bố về c&aacute;ch ứng xử của c&aacute;c b&ecirc;n tại Biển Đ&ocirc;ng (DOC) m&agrave; Trung Quốc đ&atilde; k&yacute; với Hiệp hội c&aacute;c quốc gia Đ&ocirc;ng Nam &Aacute; (ASEAN) năm 2002. </div>\r\n<p>&nbsp;</p>\r\n<div style="text-align: justify;">Nghị quyết cũng l&ecirc;n &aacute;n việc cưỡng chế, sử dụng hoặc đe dọa sử dụng vũ lực g&acirc;y cản trở c&aacute;c hoạt động h&agrave;ng hải, hối th&uacute;c ch&iacute;nh phủ Trung Quốc r&uacute;t gi&agrave;n khoan Hải Dương-981 c&ugrave;ng c&aacute;c lực lượng ra khỏi c&aacute;c vị tr&iacute; hiện nay, ngay lập tức trả mọi việc trở về nguy&ecirc;n trạng trước ng&agrave;y 1/5/2014.</div>\r\n<p><br /> Li&ecirc;n quan đến căng thẳng ở biển Hoa Đ&ocirc;ng, Nghị quyết S.RES.412 chỉ tr&iacute;ch việc Trung Quốc đơn phương &aacute;p đặt V&ugrave;ng nhận dạng ph&ograve;ng kh&ocirc;ng (ADIZ) ở v&ugrave;ng biển n&agrave;y từ ng&agrave;y 23/11/2013, coi đ&acirc;y l&agrave; h&agrave;nh động vi phạm c&ocirc;ng ước về h&agrave;ng kh&ocirc;ng d&acirc;n dụng, g&acirc;y căng thẳng quan hệ với c&aacute;c nước trong khu vực như Nhật Bản v&agrave; H&agrave;n Quốc./.</p>', 0, '0000-00-00', 1, 'a:1:{s:4:"file";a:0:{}}', 1, 1),
(8, 14, '', 'tin tuc', '', '<p>tin tuc</p>', '14', 0, '0000-00-00', 1, 'a:0:{}', 2, 1),
(9, 16, '', 'Chuyên gia nước ngoài nói về sức mạnh quốc phòng Việt Nam', '', '<h2 class="sapo">Sau khi Bồ Đ&agrave;o Nha dừng bước từ v&ograve;ng bảng, Ronaldo đ&atilde; tranh thủ những ng&agrave;y nghỉ giữa m&ugrave;a giải đến Hy Lạp để qu&ecirc;n một kỳ World Cup thất bại. Đi c&ugrave;ng Ronaldo c&ograve;n c&oacute; c&ocirc; đ&agrave;o n&oacute;ng bỏng Irina Shayk. Mới đ&acirc;y, ch&agrave;ng tiền đạo của Real Madrid đ&atilde; đăng tải bức ảnh cặp đ&ocirc;i tươi cười b&ecirc;n chiếc trực thăng</h2>', '<h1>Si&ecirc;u mẫu n&oacute;ng bỏng d&ugrave;ng trực thăng đưa CR7 đi giải sầu để qu&ecirc;n World Cup</h1>\r\n<div class="meta"><span id="ctl00_mainContent_lblContentPrefix">(LĐO)</span> <span id="ctl00_mainContent_divAuthor"> <a class="author" href="http://laodong.com.vn/the-thao/sieu-mau-nong-bong-dung-truc-thang-dua-cr7-di-giai-sau-de-quen-world-cup-224289.bld">B&iacute;ch H&agrave;</a> </span> <time>- 1:30 PM, 12/07/2014</time>\r\n<ul class="story-tools clearfix" style="float: right;">\r\n<li><a class="sendsocial" rel="facebook">Facebook</a></li>\r\n<li><a href="http://laodong.com.vn/the-thao/sieu-mau-nong-bong-dung-truc-thang-dua-cr7-di-giai-sau-de-quen-world-cup-224289.bld#FeedbackForm">Viết b&igrave;nh luận</a></li>\r\n<li><a class="sendprint" rel="print">Bản in</a></li>\r\n</ul>\r\n</div>\r\n<div id="ctl00_mainContent_divAvatar" class="article-photo inlinephoto"><img src="http://laodong.com.vn/Uploaded/DangThiChung/2014_07_12/78vbnm_OSZU.jpg.ashx?width=660" alt="" width="660" border="0" /></div>\r\n<h2 class="sapo">Sau khi Bồ Đ&agrave;o Nha dừng bước từ v&ograve;ng bảng, Ronaldo đ&atilde; tranh thủ những ng&agrave;y nghỉ giữa m&ugrave;a giải đến Hy Lạp để qu&ecirc;n một kỳ World Cup thất bại. Đi c&ugrave;ng Ronaldo c&ograve;n c&oacute; c&ocirc; đ&agrave;o n&oacute;ng bỏng Irina Shayk. Mới đ&acirc;y, ch&agrave;ng tiền đạo của Real Madrid đ&atilde; đăng tải bức ảnh cặp đ&ocirc;i tươi cười b&ecirc;n chiếc trực thăng &ndash; l&agrave; phương tiện họ sử dụng để di chuyển trong kỳ nghỉ v&agrave; dường như Ronaldo đ&atilde; ngu&ocirc;i ngoai sau những thất bại để t&igrave;nh tứ, vui vẻ đi du h&iacute; c&ugrave;ng ch&acirc;n d&agrave;i đ&igrave;nh đ&aacute;m trong l&agrave;ng mẫu thế giới.</h2>', 0, '0000-00-00', 0, 'a:0:{}', 1, 0),
(10, 16, '', 'Về thông tin sát thủ Lê Văn Luyện đào thoát khỏi trại giam', '', '<p><strong>(PetroTimes) &ndash; V&agrave;i ng&agrave;y h&ocirc;m nay, tr&ecirc;n mạng internet rộ l&ecirc;n tin đồn L&ecirc; Văn Luyện, s&aacute;t thủ trong vụ &aacute;n giết người cướp của ở tiệm v&agrave;ng Ngọc B&iacute;ch (Bắc Giang) đ&atilde; trốn khỏi trại giam số 3 của Bộ C&ocirc;ng an.</strong></p>', '<div class="lead-post">\r\n<p style="text-align: justify;"><strong>(PetroTimes) &ndash; V&agrave;i ng&agrave;y h&ocirc;m nay, tr&ecirc;n mạng internet rộ l&ecirc;n tin đồn L&ecirc; Văn Luyện, s&aacute;t thủ trong vụ &aacute;n giết người cướp của ở tiệm v&agrave;ng Ngọc B&iacute;ch (Bắc Giang) đ&atilde; trốn khỏi trại giam số 3 của Bộ C&ocirc;ng an.</strong></p>\r\n</div>\r\n<p style="text-align: justify;"><a href="http://petrotimes.vn/news/vn/phap-luat/ve-thong-tin-sat-thu-le-van-luyen-bi-thu-tieu-trong-trai-giam.html" target="_blank"><em><strong><span style="color: #0000ff;">&gt;&gt; </span></strong></em></a><em><strong><a href="http://petrotimes.vn/news/vn/phap-luat/ve-thong-tin-sat-thu-le-van-luyen-bi-thu-tieu-trong-trai-giam.html" target="_blank"><span style="color: #0000ff;">Về th&ocirc;ng tin s&aacute;t thủ L&ecirc; Văn Luyện bị thủ ti&ecirc;u trong trại giam</span></a></strong></em></p>\r\n<p style="text-align: justify;">Suốt một thời gian d&agrave;i, kể từ khi g&acirc;y ra vụ thảm s&aacute;t tại tiệm v&agrave;ng Ngọc B&iacute;ch (phố S&agrave;n, huyện Lục Nam, tỉnh Bắc Giang), L&ecirc; Văn Luyện l&agrave; nh&acirc;n vật được dư luận, b&aacute;o ch&iacute; theo d&otilde;i nhiều nhất. Từ khi Luyện được chuyển về trại giam số 3 (Tổng cục VIII - Bộ C&ocirc;ng an), đ&oacute;ng tại huyện T&acirc;n Kỳ, Nghệ An th&igrave; c&aacute;i t&ecirc;n n&agrave;y cũng dần lắng xuống.</p>\r\n<p style="text-align: justify;">Tuy nhi&ecirc;n, những ng&agrave;y gần đ&acirc;y, tr&ecirc;n nhiều trang mạng x&atilde; hội rộ l&ecirc;n tin đồn L&ecirc; Văn Luyện đ&atilde; bỏ trốn khỏi trại giam. Th&ocirc;ng tin n&agrave;y khiến nhiều người giật m&igrave;nh lo lắng, đặc biệt đối với địa phương qu&ecirc; của Luyện ở tỉnh Bắc Giang.</p>\r\n<p style="text-align: justify;">Trưa 12/7, trao đổi qua điện thoại với ph&oacute;ng vi&ecirc;n <strong>PetroTimes</strong>, Trung t&aacute; Nguyễn Sỹ Chương, Đội trưởng Đội trinh s&aacute;t (Trại giam số 3) tỏ ra ngạc nhi&ecirc;n trước th&ocirc;ng tin L&ecirc; Văn Luyện bỏ trốn.</p>\r\n<p style="text-align: justify;">Trung t&aacute; Chương cho biết: &ldquo;Hiện tại phạm nh&acirc;n L&ecirc; Văn Luyện đang thụ &aacute;n tại ph&acirc;n trại 1, trại giam số 3. Cũng như c&aacute;c phạm nh&acirc;n mới kh&aacute;c, Luyện được tạo điều kiện học gi&aacute;o dục c&ocirc;ng d&acirc;n. C&ocirc;ng việc lao động h&agrave;ng ng&agrave;y của Luyện l&agrave; l&agrave;m mi mắt giả&rdquo;.</p>\r\n<p style="text-align: center;"><a class="facny_box" href="http://petrotimes.vn/stores/news_dataimages/hoangchienthang/072014/12/11/ph250ttrail242ngcual234vanluyentrongtraicaitaojpg1346517674.jpg" target="_blank" rel="gallery"><img src="http://petrotimes.vn/stores/news_dataimages/hoangchienthang/072014/12/11/ph250ttrail242ngcual234vanluyentrongtraicaitaojpg1346517674.jpg" alt="" /></a></p>\r\n<p style="text-align: center;"><em>Từ khi thụ &aacute;n, L&ecirc; Văn Luyện đ&atilde; tự gi&aacute;c hơn trong sinh hoạt, cải tạo.</em></p>\r\n<p style="text-align: center;">&nbsp;</p>\r\n<p style="text-align: justify;">Hồi th&aacute;ng 2/2014, cũng đ&atilde; xuất hiện tin đồn L&ecirc; Văn Luyện bị đ&aacute;nh chết trong trại giam, PetroTimes đ&atilde; nhanh ch&oacute;ng x&aacute;c minh qua c&aacute;c c&aacute;n bộ trại giam v&agrave; khẳng định th&ocirc;ng tin n&agrave;y l&agrave; thất thiệt.</p>\r\n<p style="text-align: justify;">C&aacute;n bộ trại giam số 3 cũng cho biết, những tin đồn thất thiệt như L&ecirc; Văn Luyện bị đ&aacute;nh chết hoặc bỏ trốn khỏi trại giam kh&ocirc;ng loại trừ mục đ&iacute;ch vu c&aacute;o c&ocirc;ng t&aacute;c quản l&yacute; của trại giam, hoặc do một số trang mạng bịa đặt để nhằm mục đ&iacute;ch xấu. Do vậy, mọi người phải hết sức tỉnh t&aacute;o trước tin đồn thất thiệt để tr&aacute;nh bị kẻ xấu lợi dụng.</p>\r\n<p style="text-align: justify;">Trung t&aacute; Nguyễn Sỹ Chương cho biết th&ecirc;m: &ldquo;Hiện L&ecirc; Văn Luyện sức khỏe b&igrave;nh thường, chỉ c&oacute; điều rất &iacute;t được bố mẹ v&agrave; người th&acirc;n v&agrave;o thăm. Thời gian gần đ&acirc;y, Luyện thường nhắn muốn gửi lời xin lỗi đến to&agrave;n thể mọi người v&agrave; hứa sẽ cải tạo tốt&rdquo;.</p>\r\n<p style="text-align: justify;">L&ecirc; Văn Luyện sau khi bị x&eacute;t xử mức &aacute;n 18 năm t&ugrave; giam đ&atilde; được đưa về giam tại trại giam số 3 của Bộ C&ocirc;ng an. Trại 3 trực thuộc sự quản l&yacute; của Tổng cục VIII - Bộ C&ocirc;ng an, trước đ&acirc;y l&agrave; trại giam loại 1 (giam giữ c&aacute;c phạm nh&acirc;n chịu &aacute;n nặng, 20 năm, chung th&acirc;n).</p>\r\n<p style="text-align: justify;">Trại giam số 3 nằm tr&ecirc;n địa b&agrave;n huyện T&acirc;n Kỳ, tỉnh Nghệ An, c&aacute;ch th&agrave;nh phố Vinh khoảng 100 km, điều kiện đi lại kh&aacute; kh&oacute; khăn.</p>\r\n<p style="text-align: justify;">Nguy&ecirc;n nh&acirc;n cũng c&oacute; thể l&agrave; do trại 3 l&agrave; trại nằm ở v&ugrave;ng n&uacute;i, xa x&ocirc;i, điều kiện thăm nom, đi lại kh&oacute; khăn. Hơn nữa, gia đ&igrave;nh L&ecirc; Văn Luyện cũng gần như tan t&aacute;c, lụn bại, kh&ocirc;ng c&oacute; ai v&agrave;o thăm Luyện. Từ khi về thụ &aacute;n ở trại 3, L&ecirc; Văn Luyện cũng chưa tiếp x&uacute;c với c&aacute;c cơ quan truyền th&ocirc;ng, b&aacute;o ch&iacute;, n&ecirc;n c&oacute; thể đ&atilde; l&agrave;m nảy sinh những tin đồn ti&ecirc;u cực như vậy.</p>', 0, '0000-00-00', 1, 'a:0:{}', 2, 0),
(11, 16, '', 'Shakira tươi tắn bế con trai Milan đến Brazil', '', '<h2 class="sapo">Nữ ca sĩ người Colombia đ&atilde; hạ c&aacute;nh xuống Rio de Janeiro để chuẩn bị cho ng&agrave;y bế mạc World Cup.</h2>\r\n<p>Thứ 4 tuần n&agrave;y, c&aacute;nh săn ảnh đ&atilde; bắt gặp <span style="font-weight: bold;">Shakira</span> xuất hiện ở s&acirc;n bay Rio de Janeiro. Trong chiếc &aacute;o thun</p>', '<h2 class="sapo">Nữ ca sĩ người Colombia đ&atilde; hạ c&aacute;nh xuống Rio de Janeiro để chuẩn bị cho ng&agrave;y bế mạc World Cup.</h2>\r\n<div class="content">\r\n<div>\r\n<p>Thứ 4 tuần n&agrave;y, c&aacute;nh săn ảnh đ&atilde; bắt gặp <span style="font-weight: bold;">Shakira</span> xuất hiện ở s&acirc;n bay Rio de Janeiro. Trong chiếc &aacute;o thun đơn giản đi k&egrave;m với quần jeans, nữ ca sĩ 37 tuổi tr&ocirc;ng v&ocirc; c&ugrave;ng tươi tắn b&ecirc;n cạnh con trai cưng <span style="font-weight: bold;">Milan</span>. Được biết, <span style="font-weight: bold;">Shakira</span> đến Brazil l&agrave; để chuẩn bị cho buổi tr&igrave;nh diễn kh&eacute;p lại World Cup v&agrave;o rạng s&aacute;ng ng&agrave;y 14 th&aacute;ng 7 (giờ Việt Nam). Bạn g&aacute;i của <span style="font-weight: bold;">Pique</span> sẽ biểu diễn ca kh&uacute;c &ldquo;La La La&rdquo; đang g&acirc;y sốt của m&igrave;nh c&ugrave;ng với <span style="font-weight: bold;">Carlinhos Brown</span>. &nbsp;&nbsp;</p>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 863px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_201407111614419252.jpg" alt="" /></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">Shakira đ&atilde; c&oacute; mặt ở Brazil.</span></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">&nbsp;</span></div>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 886px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_201407111614362904.jpg" alt="" /></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">B&eacute; Milan xinh xắn trong chiếc &aacute;o chuột Mickey.</span>&nbsp;</div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 708px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_201407111614468704.jpg" alt="" /></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">Nữ ca sĩ ăn mặc v&ocirc; c&ugrave;ng giản dị v&agrave; thoải m&aacute;i.</span></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">&nbsp;</span></div>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 800px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_201407111619377012.jpg" alt="" /></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">Chuyến đi n&agrave;y thiếu vắng Gerard Pique bởi đội tuyển TBN của anh đ&atilde; phải về nước từ rất sớm.</span></div>\r\n<p>Trước khi l&ecirc;n đường đến Brazil,<span style="font-weight: bold;"> Shakira</span>&nbsp;đ&atilde; tranh thủ&nbsp;xuất hiện trong chương tr&igrave;nh Despierta America ở Miami. Trong bộ trang phục tương tự, bạn g&aacute;i của trung&nbsp;vệ Barcelona&nbsp;rất th&iacute;ch th&uacute; khi được &ocirc;m một ch&uacute; ch&oacute; nhỏ. &nbsp;</p>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 808px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_201407111629419204.jpg" alt="" /></div>\r\n<div style="text-align: center;">&nbsp;</div>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 795px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_20140711162944666.jpg" alt="" /></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">C&ocirc; ca sĩ "Hips Don''t Lie" tr&ocirc;ng rất phấn kh&iacute;ch.&nbsp;</span></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">&nbsp;</span></div>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 863px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_201407111629417768.jpg" alt="" /></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">Nụ cười rạng rỡ quen thuộc của nữ ca sĩ 37 tuổi.</span></div>\r\n<p>Đ&acirc;y sẽ l&agrave; lần thứ 3 <span style="font-weight: bold;">Shakira </span>biểu diễn tại World Cup. N&oacute;i về vinh dự được biểu diễn tại ng&agrave;y hội b&oacute;ng đ&aacute; lớn nhất h&agrave;nh tinh, nữ ca sĩ chia sẻ:<span style="font-style: italic;"> "T&ocirc;i c&oacute; một mối quan hệ phức tạp với b&oacute;ng đ&aacute; v&igrave; nhiều l&yacute; do, v&agrave; t&ocirc;i hiểu rằng World Cup c&oacute; &yacute; nghĩa thế n&agrave;o với mọi người, kể cả t&ocirc;i nữa."</span></p>\r\n<div style="text-align: center;"><img style="max-width: 100%; height: 888px; width: 600px; cursor: none;" src="http://kenh14.vcmedia.vn/thumb_w/600/QuickNewsK14/2126236/2014/07/img_201407111625304612.jpg" alt="" /></div>\r\n<div style="text-align: center;"><span style="font-style: italic;">Shakira rực rỡ trong buổi bế mạc World Cup 4 năm trước tại Johannesburg.</span>&nbsp;</div>\r\n</div>\r\n</div>', 0, '0000-00-00', 1, 'a:0:{}', 1, 0),
(12, 16, '', 'Tuyển thủ Đức vén quần trêu đùa ', '', '<h2 class="lead">Podolski, Khedira v&agrave; Ozil khiến c&aacute;c đồng đội bật cười khi xắn quần l&ecirc;n cao trong buổi tập trước chung kết.</h2>', '<h1 class="title">Tuyển thủ Đức v&eacute;n quần tr&ecirc;u đ&ugrave;a</h1>\r\n<h2 class="lead">Podolski, Khedira v&agrave; Ozil khiến c&aacute;c đồng đội bật cười khi xắn quần l&ecirc;n cao trong buổi tập trước chung kết.</h2>\r\n<div class="reference_news">\r\n<ul class="list_news_dot_3x3_300">\r\n<li><a href="http://ngoisao.net/tin-tuc/the-thao/wags-duc-phan-khich-tren-khan-dai-3015213.html">WAGs Đức phấn kh&iacute;ch tr&ecirc;n kh&aacute;n đ&agrave;i</a></li>\r\n<li><a href="http://ngoisao.net/tin-tuc/the-thao/tham-bai-truoc-duc-brazil-vo-mong-vo-dich-3015036.html">Thảm bại trước Đức, Brazil vỡ mộng v&ocirc; địch</a></li>\r\n</ul>\r\n</div>\r\n<table class="tplCaption" border="0" width="1" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://c0.f21.img.vnecdn.net/2014/07/12/duc1-6858-1405139843.jpg" alt="duc1-6858-1405139843.jpg" data-natural-width="600" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="tplCaption" border="0" width="1" cellspacing="0" cellpadding="3" align="center">\r\n<tbody>\r\n<tr>\r\n<td><img src="http://c0.f21.img.vnecdn.net/2014/07/12/duc2-9932-1405139844.jpg" alt="duc2-9932-1405139844.jpg" data-natural-width="600" /></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p class="Image">Sau khi vượt qua chủ nh&agrave; Brazil với tỷ số kh&ocirc;ng tưởng, c&aacute;c tuyển thủ Đức bước v&agrave;o buổi tập với t&acirc;m trạng phấn kh&iacute;ch v&agrave; h&aacute;o hức. Kh&ocirc;ng kh&iacute; buổi tập của thầy tr&ograve; HLV Joachim Low rất s&ocirc;i động, rộn r&atilde; tiếng cười.</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', 0, '0000-00-00', 1, 'a:1:{s:5:"avata";s:26:"artcat42523_1405154230.jpg";}', 4, 0);

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
  `level` int(11) NOT NULL,
  `properties` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `article_category`
--

INSERT INTO `article_category` (`id`, `parent_id`, `slug`, `name`, `description`, `position`, `level`, `properties`, `status`) VALUES
(19, 14, '', 'Biet thu', '', 4, 0, 'a:0:{}', 0),
(18, 14, '', 'Khu resort', '', 2, 0, 'a:0:{}', 0),
(17, 14, '', 'Khách sạn', '', 7, 0, 'a:0:{}', 0),
(14, 0, 'du-an-tieu-bieu', 'Dự Án Tiêu Biểu', '<p>Dự &Aacute;n Ti&ecirc;u Biểu</p>', 1, 0, 'a:0:{}', 0),
(15, 0, 'gioi-thieu', 'Giới Thiệu', '<p>Giới Thiệu</p>', 2, 0, 'a:0:{}', 0),
(16, 0, 'tin-tuc', 'Tin Tức', '<p>Tin Tức</p>', 3, 0, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `position` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `parent_id`, `description`, `position`) VALUES
(1, 'Phòng Ngủ', 'cat_29496_1374388957.jpg', 0, '', 10),
(2, 'Phòng Khách', 'cat_48752_1374389292.jpg', 0, '', 10),
(3, 'Phòng Bếp', 'cat_17855_1374484875.jpg', 0, '', 10),
(4, 'Chén thủy tinh', 'cat_21619_1374484858.jpg', 0, '', 10),
(5, 'Tô thủy tinh', 'cat_258828_1388027308.jpg', 0, '', 10),
(6, 'Phòng Bố mẹ', '', 1, '<p>Moo tar phng bo me</p>', 1),
(7, 'tesst', 'cat_15331_1401441300.jpg', 0, '', 10),
(8, 'Phòng Trẻ Em', '', 1, '', 10),
(10, 'nua', '', 2, '', 10),
(11, 'Phòng Ngủ Khách', 'cat_179494_1404553254.jpg', 1, '<p>Ph&ograve;ng Ngủ Kh&aacute;ch</p>', 10),
(12, '111111111111', '', 10, '', 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`id`, `name`, `category_id`, `description`, `arr_images`, `date_create`, `is_active`, `price`, `discount_percent`, `view`, `status`, `home`, `position`) VALUES
(1, 'Chén sọc cao cấp', 6, '', 'a:4:{i:0;s:26:"item_179494_1404550705.jpg";i:1;s:25:"item_66542_1375089077.jpg";i:2;s:25:"item_57293_1375089077.jpg";i:3;s:25:"item_38445_1375089077.jpg";}', '2014-07-05 08:58:25', 1, 111, 0, 0, 1, 1, 0),
(2, 'Tô chấm bi', 5, '', 'a:1:{i:0;s:25:"item_66542_1375085846.jpg";}', '2013-10-28 22:18:06', 1, 0, 0, 40, 0, 0, 0),
(3, 'Đĩa 8 inch', 3, '', 'a:1:{i:0;s:25:"item_65111_1375085911.jpg";}', '2013-10-28 22:18:07', 1, 0, 0, 41, 0, 0, 0),
(4, 'Thố thủy tinh', 2, '', 'a:1:{i:0;s:25:"item_42523_1375085988.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 26, 0, 0, 0),
(5, 'Chén cườm', 4, '', 'a:1:{i:0;s:25:"item_57293_1375086952.jpg";}', '2013-10-28 22:18:08', 1, 0, 0, 49, 0, 0, 0),
(6, 'Chén chấm bi', 4, '', 'a:1:{i:0;s:25:"item_87021_1375087005.jpg";}', '2013-10-28 22:18:10', 1, 0, 0, 45, 0, 0, 0),
(8, 'Đĩa 9 inch', 6, '', 'a:3:{i:0;s:26:"item_403232_1404550383.png";i:1;s:26:"item_179494_1401432794.jpg";i:2;s:26:"item_225183_1401432832.jpg";}', '2014-07-05 08:55:44', 1, 1, 0, 0, 1, 1, 0),
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
(26, 'girl', 0, '', 'a:3:{i:0;s:26:"item_403232_1404550334.png";i:1;s:24:"item_3700_1401439414.jpg";i:2;s:24:"item_4185_1401439431.jpg";}', '2014-07-05 08:52:14', 1, 1, 1, 0, 1, 1, 0),
(27, 'ttttt', 10, '', 'a:0:{}', '2014-07-11 04:07:27', 1, 1, 0, 0, 0, 0, 0);

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
