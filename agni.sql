-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 14, 2012 at 01:33 PM
-- Server version: 5.5.23
-- PHP Version: 5.3.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `v_agni`
--

-- --------------------------------------------------------

--
-- Table structure for table `an_accounts`
--

CREATE TABLE IF NOT EXISTS `an_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_username` varchar(255) DEFAULT NULL,
  `account_email` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT NULL,
  `account_fullname` varchar(255) DEFAULT NULL,
  `account_birthdate` date DEFAULT NULL,
  `account_avatar` varchar(255) DEFAULT NULL,
  `account_signature` text,
  `account_timezone` varchar(10) NOT NULL DEFAULT 'UP7',
  `account_language` varchar(10) DEFAULT NULL,
  `account_create` datetime DEFAULT NULL COMMENT 'local time',
  `account_create_gmt` datetime DEFAULT NULL COMMENT 'gmt0, utc0',
  `account_last_login` datetime DEFAULT NULL,
  `account_last_login_gmt` datetime DEFAULT NULL,
  `account_online_code` varchar(255) DEFAULT NULL COMMENT 'store session code for check dubplicate log in if enabled.',
  `account_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `account_status_text` varchar(255) DEFAULT NULL,
  `account_new_email` varchar(255) DEFAULT NULL,
  `account_new_password` varchar(255) DEFAULT NULL,
  `account_confirm_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `an_accounts`
--

INSERT INTO `an_accounts` (`account_id`, `account_username`, `account_email`, `account_password`, `account_fullname`, `account_birthdate`, `account_avatar`, `account_signature`, `account_timezone`, `account_language`, `account_create`, `account_create_gmt`, `account_last_login`, `account_last_login_gmt`, `account_online_code`, `account_status`, `account_status_text`, `account_new_email`, `account_new_password`, `account_confirm_code`) VALUES
(0, 'Guest', 'none@localhost', NULL, 'Guest', NULL, NULL, NULL, 'UP7', NULL, '2012-04-03 19:25:44', '2012-04-03 12:25:44', NULL, NULL, NULL, 0, 'You can''t login with this account.', NULL, NULL, NULL),
(1, 'admin', 'admin@localhost.com', '6e6f59d20ef87183781895cb20d13c6663f3890c', NULL, NULL, NULL, NULL, 'UP7', NULL, '2011-04-20 19:20:04', '2011-04-20 12:20:04', '2012-06-14 12:58:08', '2012-06-14 05:58:08', '1d5b1fa0cb9c364a3442e526f590e25e', 1, NULL, NULL, NULL, NULL),
(2, 'v', 'v@localhost.com', '4494062feb662a2eb1bfb1ee1ea196ec460bb7d9', NULL, NULL, 'public/upload/avatar/30c042987041d605b6dbabf290e52c3b.jpg', NULL, 'UP7', NULL, '2012-04-11 04:13:50', '2012-04-10 21:13:50', '2012-06-09 05:41:13', '2012-06-08 22:41:13', '9b928c82083a8385a023f9355e36de8c', 1, NULL, NULL, NULL, NULL),
(10, 'user', 'user@localhost.com', 'd74453871076682cdcdc28c5708793af9e89a2ec', NULL, NULL, 'public/upload/avatar/7cfbd2b5e92a1913740b04034b72f6c6.jpg', NULL, 'UP7', NULL, '2012-04-22 16:27:19', '2012-04-22 09:27:19', '2012-05-19 09:39:37', '2012-05-19 02:39:37', '4effbb8a8f9b639fd37dcc31b53a25ad', 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `an_account_level`
--

CREATE TABLE IF NOT EXISTS `an_account_level` (
  `level_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_group_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`level_id`),
  KEY `level_group_id` (`level_group_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `an_account_level`
--

INSERT INTO `an_account_level` (`level_id`, `level_group_id`, `account_id`) VALUES
(1, 4, 0),
(2, 1, 1),
(3, 2, 2),
(4, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `an_account_level_group`
--

CREATE TABLE IF NOT EXISTS `an_account_level_group` (
  `level_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_name` varchar(255) DEFAULT NULL,
  `level_description` text,
  `level_priority` int(5) NOT NULL DEFAULT '1' COMMENT 'lower is more higher priority',
  PRIMARY KEY (`level_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `an_account_level_group`
--

INSERT INTO `an_account_level_group` (`level_group_id`, `level_name`, `level_description`, `level_priority`) VALUES
(1, 'Super administrator', 'Site owner.', 1),
(2, 'Administrator', NULL, 2),
(3, 'Member', 'For registered user.', 999),
(4, 'Guest', 'For non register user.', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `an_account_level_permission`
--

CREATE TABLE IF NOT EXISTS `an_account_level_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `level_group_id` int(11) NOT NULL,
  `permission_page` varchar(255) NOT NULL,
  `permission_action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `level_group_id` (`level_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- Dumping data for table `an_account_level_permission`
--

INSERT INTO `an_account_level_permission` (`permission_id`, `level_group_id`, `permission_page`, `permission_action`) VALUES
(1, 1, 'account_perm', 'account_manage_perm'),
(2, 2, 'account_perm', 'account_manage_perm'),
(3, 1, 'account_perm', 'account_add_perm'),
(4, 1, 'account_perm', 'account_edit_perm'),
(5, 1, 'account_perm', 'account_delete_perm'),
(6, 1, 'account_perm', 'account_viewlog_perm'),
(7, 2, 'account_perm', 'account_viewlog_perm'),
(8, 1, 'account_perm', 'account_deletelog_perm'),
(9, 1, 'account_lv_perm', 'account_lv_manage_perm'),
(10, 1, 'account_lv_perm', 'account_lv_add_perm'),
(11, 1, 'account_lv_perm', 'account_lv_edit_perm'),
(12, 1, 'account_lv_perm', 'account_lv_delete_perm'),
(13, 1, 'account_lv_perm', 'account_lv_sort_perm'),
(14, 1, 'account_permission_perm', 'account_permission_manage_perm'),
(15, 1, 'post_article_perm', 'post_article_viewall_perm'),
(16, 2, 'post_article_perm', 'post_article_viewall_perm'),
(17, 1, 'post_article_perm', 'post_article_add_perm'),
(18, 2, 'post_article_perm', 'post_article_add_perm'),
(19, 1, 'post_article_perm', 'post_article_publish_unpublish_perm'),
(20, 1, 'post_article_perm', 'post_article_edit_own_perm'),
(21, 2, 'post_article_perm', 'post_article_edit_own_perm'),
(22, 1, 'post_article_perm', 'post_article_edit_other_perm'),
(23, 1, 'post_article_perm', 'post_article_delete_own_perm'),
(24, 2, 'post_article_perm', 'post_article_delete_own_perm'),
(25, 1, 'post_article_perm', 'post_article_delete_other_perm'),
(26, 1, 'post_article_perm', 'post_article_sort_perm'),
(27, 1, 'post_article_perm', 'post_revert_revision'),
(28, 1, 'post_article_perm', 'post_delete_revision'),
(29, 1, 'block_perm', 'block_viewall_perm'),
(30, 1, 'block_perm', 'block_add_perm'),
(31, 1, 'block_perm', 'block_edit_perm'),
(32, 1, 'block_perm', 'block_delete_perm'),
(33, 1, 'block_perm', 'block_sort_perm'),
(34, 1, 'category_perm', 'category_viewall_perm'),
(35, 2, 'category_perm', 'category_viewall_perm'),
(36, 1, 'category_perm', 'category_add_perm'),
(37, 1, 'category_perm', 'category_edit_perm'),
(38, 1, 'category_perm', 'category_delete_perm'),
(39, 1, 'category_perm', 'category_sort_perm'),
(40, 1, 'comment_perm', 'comment_viewall_perm'),
(41, 1, 'comment_perm', 'comment_approve_unapprove_perm'),
(42, 1, 'comment_perm', 'comment_edit_own_perm'),
(43, 2, 'comment_perm', 'comment_edit_own_perm'),
(44, 3, 'comment_perm', 'comment_edit_own_perm'),
(45, 4, 'comment_perm', 'comment_edit_own_perm'),
(46, 1, 'comment_perm', 'comment_edit_other_perm'),
(47, 1, 'comment_perm', 'comment_delete_own_perm'),
(48, 2, 'comment_perm', 'comment_delete_own_perm'),
(49, 1, 'comment_perm', 'comment_delete_other_perm'),
(50, 1, 'comment_perm', 'comment_allowpost_perm'),
(51, 2, 'comment_perm', 'comment_allowpost_perm'),
(52, 3, 'comment_perm', 'comment_allowpost_perm'),
(53, 4, 'comment_perm', 'comment_allowpost_perm'),
(54, 1, 'comment_perm', 'comment_nomoderation_perm'),
(55, 2, 'comment_perm', 'comment_nomoderation_perm'),
(56, 3, 'comment_perm', 'comment_nomoderation_perm'),
(57, 1, 'config_global', 'config_global'),
(58, 2, 'config_global', 'config_global'),
(59, 1, 'account_admin_login', 'account_admin_login'),
(60, 2, 'account_admin_login', 'account_admin_login'),
(61, 3, 'account_admin_login', 'account_admin_login'),
(62, 1, 'menu_perm', 'menu_viewall_group_perm'),
(63, 1, 'menu_perm', 'menu_add_group_perm'),
(64, 1, 'menu_perm', 'menu_edit_group_perm'),
(65, 1, 'menu_perm', 'menu_delete_group_perm'),
(66, 1, 'menu_perm', 'menu_viewall_menu_perm'),
(67, 1, 'menu_perm', 'menu_add_perm'),
(68, 1, 'menu_perm', 'menu_edit_perm'),
(69, 1, 'menu_perm', 'menu_delete_perm'),
(70, 1, 'menu_perm', 'menu_sort_perm'),
(71, 1, 'modules_manage_perm', 'modules_viewall_perm'),
(72, 1, 'modules_manage_perm', 'modules_add_perm'),
(73, 1, 'modules_manage_perm', 'modules_activate_deactivate_perm'),
(74, 1, 'modules_manage_perm', 'modules_delete_perm'),
(75, 1, 'post_page_perm', 'post_page_viewall_perm'),
(76, 1, 'post_page_perm', 'post_page_add_perm'),
(77, 1, 'post_page_perm', 'post_page_publish_unpublish_perm'),
(78, 1, 'post_page_perm', 'post_page_edit_own_perm'),
(79, 1, 'post_page_perm', 'post_page_edit_other_perm'),
(80, 1, 'post_page_perm', 'post_page_delete_own_perm'),
(81, 1, 'post_page_perm', 'post_page_delete_other_perm'),
(82, 1, 'post_page_perm', 'post_revert_revision'),
(83, 1, 'post_page_perm', 'post_delete_revision'),
(84, 1, 'tag_perm', 'tag_viewall_perm'),
(85, 1, 'tag_perm', 'tag_add_perm'),
(86, 1, 'tag_perm', 'tag_edit_perm'),
(87, 1, 'tag_perm', 'tag_delete_perm'),
(88, 1, 'themes_manage_perm', 'themes_viewall_perm'),
(89, 1, 'themes_manage_perm', 'themes_add_perm'),
(90, 1, 'themes_manage_perm', 'themes_enable_disable_perm'),
(91, 1, 'themes_manage_perm', 'themes_set_default_perm'),
(92, 1, 'themes_manage_perm', 'themes_delete_perm');

-- --------------------------------------------------------

--
-- Table structure for table `an_account_logins`
--

CREATE TABLE IF NOT EXISTS `an_account_logins` (
  `account_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `login_ua` varchar(255) DEFAULT NULL,
  `login_os` varchar(255) DEFAULT NULL,
  `login_browser` varchar(255) DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `login_time_gmt` datetime DEFAULT NULL,
  `login_attempt` int(1) NOT NULL DEFAULT '0' COMMENT '0=fail, 1=success',
  `login_attempt_text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_login_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- Dumping data for table `an_account_logins`
--

INSERT INTO `an_account_logins` (`account_login_id`, `account_id`, `login_ua`, `login_os`, `login_browser`, `login_ip`, `login_time`, `login_time_gmt`, `login_attempt`, `login_attempt_text`) VALUES
(6, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-05-24 12:28:16', '2012-05-24 05:28:16', 1, 'Success'),
(15, 2, 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', 'Windows', 'Internet Explorer 9.0', '::1', '2012-05-30 06:21:59', '2012-05-29 23:21:59', 1, 'Success'),
(21, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-06-06 12:20:31', '2012-06-06 05:20:31', 1, 'Success'),
(24, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-06-06 09:18:19', '2012-06-06 14:18:19', 1, 'Success'),
(25, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-07 02:12:38', '2012-06-07 07:12:38', 1, 'Success'),
(26, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-07 08:14:11', '2012-06-07 13:14:11', 1, 'Success'),
(27, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 03:22:31', '2012-06-07 20:22:31', 1, 'Success'),
(28, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 03:22:41', '2012-06-07 20:22:41', 1, 'Success'),
(29, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 01:56:18', '2012-06-08 06:56:18', 1, 'Success'),
(30, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 01:56:30', '2012-06-08 06:56:30', 1, 'Success'),
(31, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 01:58:20', '2012-06-08 06:58:20', 1, 'Success'),
(32, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-06-08 02:16:17', '2012-06-08 07:16:17', 0, 'Wrong username or password'),
(33, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 02:33:11', '2012-06-08 07:33:11', 1, 'Success'),
(34, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 02:33:36', '2012-06-08 07:33:36', 1, 'Success'),
(35, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 02:33:50', '2012-06-08 07:33:50', 1, 'Success'),
(36, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 02:33:56', '2012-06-08 07:33:56', 1, 'Success'),
(37, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 02:34:06', '2012-06-08 07:34:06', 1, 'Success'),
(38, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-08 08:11:19', '2012-06-08 13:11:19', 1, 'Success'),
(39, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-06-09 04:17:38', '2012-06-08 21:17:38', 1, 'Success'),
(40, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-06-09 04:17:43', '2012-06-08 21:17:43', 1, 'Success'),
(41, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-09 05:37:05', '2012-06-08 22:37:05', 1, 'Success'),
(42, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-06-09 05:41:10', '2012-06-08 22:41:10', 1, 'Success'),
(43, 2, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 'Windows', 'Chrome 19.0.1084.52', '::1', '2012-06-09 05:41:14', '2012-06-08 22:41:14', 1, 'Success'),
(44, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-09 02:52:11', '2012-06-09 07:52:11', 1, 'Success'),
(45, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-11 12:27:37', '2012-06-11 05:27:37', 1, 'Success'),
(46, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-11 01:33:21', '2012-06-11 06:33:21', 1, 'Success'),
(47, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-11 06:22:51', '2012-06-11 11:22:51', 1, 'Success'),
(48, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-12 12:35:34', '2012-06-11 17:35:34', 1, 'Success'),
(49, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-12 12:06:53', '2012-06-12 05:06:53', 1, 'Success'),
(50, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-12 03:46:09', '2012-06-12 08:46:09', 1, 'Success'),
(51, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-12 04:20:22', '2012-06-12 09:20:22', 1, 'Success'),
(52, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-12 06:19:17', '2012-06-12 11:19:17', 1, 'Success'),
(53, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-13 01:50:57', '2012-06-12 18:50:57', 1, 'Success'),
(54, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-13 03:29:04', '2012-06-13 08:29:04', 1, 'Success'),
(55, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:57:37', '2012-06-13 17:57:37', 1, 'Success'),
(56, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 11:31:05', '2012-06-14 04:31:05', 1, 'Success'),
(57, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:48:21', '2012-06-14 05:48:21', 1, 'Success'),
(58, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:48:32', '2012-06-14 05:48:32', 1, 'Success'),
(59, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:48:37', '2012-06-14 05:48:37', 1, 'Success'),
(60, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:48:50', '2012-06-14 05:48:50', 1, 'Success'),
(61, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:51:43', '2012-06-14 05:51:43', 1, 'Success'),
(62, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:57:49', '2012-06-14 05:57:49', 1, 'Success'),
(63, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:58:03', '2012-06-14 05:58:03', 1, 'Success'),
(64, 1, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 'Windows', 'Firefox 13.0', '::1', '2012-06-14 12:58:08', '2012-06-14 05:58:08', 1, 'Success');

-- --------------------------------------------------------

--
-- Table structure for table `an_blocks`
--

CREATE TABLE IF NOT EXISTS `an_blocks` (
  `block_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `area_name` varchar(255) DEFAULT NULL,
  `position` int(5) NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  `block_name` varchar(255) DEFAULT NULL,
  `block_file` varchar(255) DEFAULT NULL,
  `block_values` text,
  `block_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=disable, 1=enable',
  `block_except_uri` text,
  PRIMARY KEY (`block_id`),
  KEY `theme_system_name` (`theme_system_name`),
  KEY `area_name` (`area_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `an_blocks`
--

INSERT INTO `an_blocks` (`block_id`, `theme_system_name`, `area_name`, `position`, `language`, `block_name`, `block_file`, `block_values`, `block_status`, `block_except_uri`) VALUES
(2, 'system', 'sidebar', 1, 'th', 'corelangswitch', 'core/widgets/corelangswitch/corelangswitch.php', 'a:1:{s:11:"block_title";s:12:"ภาษา";}', 1, NULL),
(4, 'system', 'sidebar', 4, 'th', 'corecategories', 'core/widgets/corecategories/corecategories.php', 'a:2:{s:11:"block_title";s:24:"หมวดหมู่";s:12:"block_nohome";s:1:"1";}', 1, NULL),
(7, 'system', 'sidebar', 3, 'th', 'corelogin', 'core/widgets/corelogin/corelogin.php', 'a:2:{s:11:"block_title";s:18:"สมาชิก";s:15:"show_admin_link";s:1:"1";}', 1, NULL),
(9, 'system', 'sidebar', 5, 'th', 'corerecentarticle', 'core/widgets/corerecentarticle/corerecentarticle.php', 'a:2:{s:11:"block_title";s:36:"บทความล่าสุด";s:10:"recent_num";s:2:"10";}', 1, NULL),
(10, 'system', 'sidebar', 2, 'th', 'coresearch', 'core/widgets/coresearch/coresearch.php', 'a:1:{s:11:"block_title";s:15:"ค้นหา";}', 1, 'search'),
(13, 'system', 'navigation', 1, 'th', 'corelinks', 'core/widgets/corelinks/corelinks.php', 'a:2:{s:11:"block_title";s:0:"";s:5:"mg_id";s:1:"1";}', 1, NULL),
(14, 'system', 'footer', 1, 'th', 'corehtmlbox', 'core/widgets/corehtmlbox/corehtmlbox.php', 'a:2:{s:11:"block_title";s:0:"";s:4:"html";s:22:"footer html in htmlbox";}', 1, NULL),
(17, 'system', 'breadcrumb', 1, 'th', 'corebreadcrumb', 'core/widgets/corebreadcrumb/corebreadcrumb.php', NULL, 1, NULL),
(18, 'system', 'sidebar', 6, 'th', 'corelinks', 'core/widgets/corelinks/corelinks.php', 'a:2:{s:11:"block_title";s:4:"Menu";s:5:"mg_id";s:1:"2";}', 1, NULL),
(19, 'quick-start', 'sidebar', 2, 'th', 'corelogin', 'core/widgets/corelogin/corelogin.php', 'a:2:{s:11:"block_title";s:6:"Member";s:15:"show_admin_link";s:1:"1";}', 1, NULL),
(20, 'quick-start', 'sidebar', 1, 'th', 'corelangswitch', 'core/widgets/corelangswitch/corelangswitch.php', NULL, 1, NULL),
(21, 'quick-start', 'navigation', 1, 'th', 'corelinks', 'core/widgets/corelinks/corelinks.php', 'a:2:{s:11:"block_title";s:0:"";s:5:"mg_id";s:1:"1";}', 1, NULL),
(22, 'quick-start', 'sidebar', 3, 'th', 'corelinks', 'core/widgets/corelinks/corelinks.php', 'a:2:{s:11:"block_title";s:4:"Menu";s:5:"mg_id";s:1:"2";}', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `an_blog`
--

CREATE TABLE IF NOT EXISTS `an_blog` (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `blog_title` varchar(255) DEFAULT NULL,
  `blog_content` text,
  `blog_date` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `an_blog`
--

INSERT INTO `an_blog` (`blog_id`, `account_id`, `blog_title`, `blog_content`, `blog_date`) VALUES
(1, 1, 'frist blog post', '<p>this is my first blog post.</p>', NULL),
(3, 1, 'test rich text in blog.', '<p>cat <strong>cat</strong> <em>cat <span style="text-decoration: underline; color: #ff6600;"><strong>cat</strong></span></em> <span style="color: #339966;"><strong>cat</strong></span></p>\r\n<p>&nbsp;</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `an_ci_sessions`
--

CREATE TABLE IF NOT EXISTS `an_ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(50) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `an_ci_sessions`
--

INSERT INTO `an_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('c02e74db6c7a18e59c1dbd542c4c0328', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 1339655432, '');

-- --------------------------------------------------------

--
-- Table structure for table `an_comments`
--

CREATE TABLE IF NOT EXISTS `an_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `post_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'comment author''s name',
  `subject` varchar(255) DEFAULT NULL,
  `comment_body_value` longtext,
  `email` varchar(255) DEFAULT NULL COMMENT 'comment author''s email',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'comment author''s homepage',
  `comment_status` int(1) NOT NULL DEFAULT '0' COMMENT '0=not publish, 1=published',
  `comment_spam_status` varchar(100) NOT NULL DEFAULT 'normal' COMMENT 'comment spam status (normal, spam, ham, what ever)',
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `comment_add` bigint(20) DEFAULT NULL,
  `comment_add_gmt` bigint(20) DEFAULT NULL,
  `comment_update` bigint(20) DEFAULT NULL,
  `comment_update_gmt` bigint(20) DEFAULT NULL,
  `thread` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `account_id` (`account_id`),
  KEY `post_id` (`post_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `an_comments`
--

INSERT INTO `an_comments` (`comment_id`, `parent_id`, `post_id`, `account_id`, `name`, `subject`, `comment_body_value`, `email`, `homepage`, `comment_status`, `comment_spam_status`, `ip_address`, `user_agent`, `comment_add`, `comment_add_gmt`, `comment_update`, `comment_update_gmt`, `thread`) VALUES
(2, 0, 43, 2, 'v', '1', '1', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.46 Safari/536.5', 1337557722, 1337532522, 1337562258, 1337537058, '01/'),
(3, 0, 43, 2, 'v', '2', '2', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.46 Safari/536.5', 1337557724, 1337532524, 1337557724, 1337532524, '02/'),
(4, 0, 43, 2, 'v', '3', '3', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.46 Safari/536.5', 1337557726, 1337532526, 1337562274, 1337537074, '03/'),
(20, 0, 44, 1, 'admin', 'ha ha', 'ha ha', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0', 1337562518, 1337537318, 1337562518, 1337537318, '01/'),
(23, 2, 43, 1, 'admin', '1.1', '1.1', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0', 1337572549, 1337547349, 1337572549, 1337547349, '01.00/'),
(26, 0, 43, 2, 'v', 'asdfsda sdaf fsg afs wer wtr sra', 'asdfsda sdaf fsg afs wer wtr sra\r\n\r\nsadf asd sadf as.', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.46 Safari/536.5', 1337600121, 1337574921, 1337626622, 1337601422, '05/'),
(28, 23, 43, 1, 'admin', 'ตอบ: 1.1', '1.1.1', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0', 1337608121, 1337582921, 1337608121, 1337582921, '01.00.00/'),
(29, 28, 43, 1, 'admin', 'ตอบ: 1.1', '1.1.1.1', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0', 1337608735, 1337583535, 1337608735, 1337583535, '01.00.00.00/'),
(32, 0, 44, 2, 'v', 'sdf sdf a asdasd', 'sdf sdf a asdasd', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 1337837300, 1337812100, 1337837300, 1337812100, '02/'),
(33, 0, 44, 0, 'v', 'as guest', 'as guest', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.52 Safari/536.5', 1337837375, 1337812175, 1337837410, 1337812210, '03/'),
(34, 29, 43, 1, 'admin', 'ตอบ: 1.1', '1.1.1.1.1', NULL, NULL, 1, 'normal', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:13.0) Gecko/20100101 Firefox/13.0', 1339652443, 1339627243, 1339652443, 1339627243, '01.00.00.00.00/');

-- --------------------------------------------------------

--
-- Table structure for table `an_config`
--

CREATE TABLE IF NOT EXISTS `an_config` (
  `config_name` varchar(255) DEFAULT NULL,
  `config_value` varchar(255) DEFAULT NULL,
  `config_core` int(1) DEFAULT '0' COMMENT '0=no, 1=yes. if config core then please do not delete from db.',
  `config_description` text,
  KEY `config_name` (`config_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `an_config`
--

INSERT INTO `an_config` (`config_name`, `config_value`, `config_core`, `config_description`) VALUES
('site_name', 'Agni CMS', 1, 'website name'),
('page_title_separator', ' &rsaquo; ', 1, 'page title separator. eg. site name | page'),
('site_timezone', 'UP7', 1, 'website default timezone'),
('duplicate_login', '0', 1, 'allow log in more than 1 place, session? set to 1/0 to allow/disallow.'),
('allow_avatar', '1', 1, 'set to 1 if use avatar or set to 0 if not use it.'),
('avatar_size', '200', 1, 'set file size in Kilobyte.'),
('avatar_allowed_types', 'gif|jpg|png', 1, 'avatar allowe file types (see reference from codeigniter)\r\neg. gif|jpg|png'),
('avatar_path', 'public/upload/avatar/', 1, 'path to directory for upload avatar'),
('member_allow_register', '1', 1, 'allow users to register'),
('member_register_notify_admin', '0', 1, 'send email to notify admin when new member register?'),
('member_verification', '1', 1, 'member verification method.\r\n1 = verify by email\r\n2 = wait for admin verify'),
('member_admin_verify_emails', 'admin@localhost.com', 1, 'emails of administrators to notice them when new member registration'),
('mail_protocol', 'mail', 1, 'The mail sending protocol.\r\nmail, sendmail, smtp'),
('mail_mailpath', '/usr/sbin/sendmail', 1, 'The server path to Sendmail.'),
('mail_smtp_host', 'localhost', 1, 'SMTP Server Address.'),
('mail_smtp_user', 'no-reply@localhost.com', 1, 'SMTP Username.'),
('mail_smtp_pass', '', 1, 'SMTP Password.'),
('mail_smtp_port', '25', 1, 'SMTP Port.'),
('mail_sender_email', 'no-reply@localhost.com', 1, 'Email for ''sender'''),
('content_show_title', '1', 1, 'show h1 content title'),
('content_show_time', '1', 1, 'show content time. (publish, update, ...)'),
('content_show_author', '1', 1, 'show content author.'),
('content_items_perpage', '10', 1, 'number of posts per page.'),
('comment_allow', NULL, 1, 'allow site-wide new comment?\r\n0=no, 1=yes, null=up to each post''s setting'),
('comment_show_notallow', '0', 1, 'list old comments even if comment setting change to not allow new comment?\r\n0=not show, 1=show\r\nif 0 the system will not show comments when setting to not allow new comment.'),
('comment_perpage', '40', 1, 'number of comments per page'),
('comment_new_notify_admin', '1', 1, 'notify admin when new comment?\r\n0=no, 1=yes(require moderation only), 2=yes(all)'),
('comment_admin_notify_emails', 'admin@localhost.com', 1, 'emails of administrators to notify when new comment or moderation required ?'),
('media_allowed_types', '7z|aac|ace|ai|aif|aifc|aiff|avi|bmp|css|csv|doc|docx|eml|flv|gif|gz|h264|h.264|htm|html|jpeg|jpg|js|json|log|mid|midi|mov|mp3|mpeg|mpg|pdf|png|ppt|psd|swf|tar|text|tgz|tif|tiff|txt|wav|webm|word|xls|xlsx|xml|xsl|zip', 1, 'media upload allowed file types.\r\nthese types must specified mime-type in config/mimes.php');

-- --------------------------------------------------------

--
-- Table structure for table `an_files`
--

CREATE TABLE IF NOT EXISTS `an_files` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `language` varchar(5) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_client_name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(255) DEFAULT NULL,
  `file_ext` varchar(50) DEFAULT NULL,
  `file_size` int(11) NOT NULL DEFAULT '0',
  `media_name` varchar(255) DEFAULT NULL COMMENT 'name this file for use in frontend.',
  `media_description` text,
  `media_keywords` varchar(255) DEFAULT NULL,
  `file_add` bigint(20) DEFAULT NULL,
  `file_add_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `an_files`
--


-- --------------------------------------------------------

--
-- Table structure for table `an_frontpage_category`
--

CREATE TABLE IF NOT EXISTS `an_frontpage_category` (
  `tid` int(11) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `an_frontpage_category`
--

INSERT INTO `an_frontpage_category` (`tid`, `language`) VALUES
(NULL, 'en'),
(15, 'th');

-- --------------------------------------------------------

--
-- Table structure for table `an_menu_groups`
--

CREATE TABLE IF NOT EXISTS `an_menu_groups` (
  `mg_id` int(11) NOT NULL AUTO_INCREMENT,
  `mg_name` varchar(255) DEFAULT NULL,
  `mg_description` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `an_menu_groups`
--

INSERT INTO `an_menu_groups` (`mg_id`, `mg_name`, `mg_description`, `language`) VALUES
(1, 'นำทาง', 'navigation', 'th'),
(2, 'เมนูหลัก', NULL, 'th');

-- --------------------------------------------------------

--
-- Table structure for table `an_menu_items`
--

CREATE TABLE IF NOT EXISTS `an_menu_items` (
  `mi_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `mg_id` int(11) DEFAULT NULL COMMENT 'menu group id',
  `position` int(5) NOT NULL DEFAULT '1',
  `language` varchar(5) DEFAULT NULL,
  `mi_type` varchar(255) DEFAULT NULL COMMENT 'refer to post_type, tax_type, link, custom_link',
  `type_id` int(11) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_text` varchar(255) DEFAULT NULL,
  `custom_link` text COMMENT 'when normal link field doesn''t fullfill your need',
  `nlevel` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mi_id`),
  KEY `mg_id` (`mg_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `an_menu_items`
--

INSERT INTO `an_menu_items` (`mi_id`, `parent_id`, `mg_id`, `position`, `language`, `mi_type`, `type_id`, `link_url`, `link_text`, `custom_link`, `nlevel`) VALUES
(16, 33, 1, 15, 'th', 'category', 19, 'cat2', 'cat2', '', 2),
(17, 29, 1, 18, 'th', 'tag', 21, 'tag1', 'tag1', '', 2),
(18, 29, 1, 19, 'th', 'tag', 22, 'tag2', 'tag2', '', 2),
(19, 30, 1, 22, 'th', 'article', 55, 'p-6', 'test', '', 2),
(21, 30, 1, 21, 'th', 'article', 43, '%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B9%84%E0%B8%97%E0%B8%A2', 'บทความไทย', '', 2),
(22, 29, 1, 17, 'th', 'tag', 20, '%E0%B9%81%E0%B8%97%E0%B9%87%E0%B8%81%E0%B9%84%E0%B8%97%E0%B8%A2', 'แท็กไทย', '', 2),
(23, 31, 1, 26, 'th', 'page', 56, '%E0%B9%80%E0%B8%81%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A7%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%80%E0%B8%A3%E0%B8%B2', 'เกี่ยวกับเรา', '', 2),
(25, 31, 1, 27, 'th', 'page', 58, '%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%95%E0%B8%81%E0%B8%A5%E0%B8%87', 'ข้อตกลง', '', 2),
(29, 0, 1, 16, 'th', 'custom_link', NULL, NULL, NULL, '<a href="#" onclick="return false;">TAG</a>', 1),
(30, 0, 1, 20, 'th', 'custom_link', NULL, NULL, NULL, '<a href="#" onclick="return false;">ARTICLE</a>', 1),
(31, 0, 1, 23, 'th', 'custom_link', NULL, NULL, NULL, '<a href="#" onclick="return false;">PAGE</a>', 1),
(33, 0, 1, 13, 'th', 'custom_link', NULL, NULL, NULL, '<a href="#" onclick="return false;">CATEGORY</a>', 1),
(35, 0, 1, 28, 'th', 'custom_link', NULL, NULL, NULL, '#LINK#', 1),
(36, 35, 1, 29, 'th', 'link', NULL, 'http://www.google.com', 'google', '', 2),
(38, 0, 2, 1, 'th', 'link', NULL, '/', 'หน้าแรก', '', 1),
(40, 33, 1, 14, 'th', 'category', 16, 'cat1', 'cat1', '', 2),
(44, 55, 1, 2, 'th', 'category', 16, 'cat1', 'cat1', '', 2),
(45, 44, 1, 3, 'th', 'category', 17, 'cat1/cat1.1', 'cat1.1', '', 3),
(46, 45, 1, 4, 'th', 'category', 18, 'cat1/cat1.1/cat1.1.1', 'cat1.1.1', '', 4),
(47, 46, 1, 5, 'th', 'page', 59, '%E0%B8%99%E0%B9%82%E0%B8%A2%E0%B8%9A%E0%B8%B2%E0%B8%A2', 'นโยบาย', '', 5),
(48, 47, 1, 6, 'th', 'page', 58, '%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%95%E0%B8%81%E0%B8%A5%E0%B8%87', 'ข้อตกลง', '', 6),
(49, 48, 1, 7, 'th', 'page', 56, '%E0%B9%80%E0%B8%81%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A7%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%80%E0%B8%A3%E0%B8%B2', 'เกี่ยวกับเรา', '', 7),
(50, 46, 1, 8, 'th', 'page', 59, '%E0%B8%99%E0%B9%82%E0%B8%A2%E0%B8%9A%E0%B8%B2%E0%B8%A2', 'นโยบาย', '', 5),
(51, 50, 1, 9, 'th', 'page', 58, '%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%95%E0%B8%81%E0%B8%A5%E0%B8%87', 'ข้อตกลง', '', 6),
(52, 51, 1, 10, 'th', 'page', 56, '%E0%B9%80%E0%B8%81%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A7%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%80%E0%B8%A3%E0%B8%B2', 'เกี่ยวกับเรา', '', 7),
(53, 44, 1, 11, 'th', 'category', 19, 'cat2', 'cat2', '', 3),
(54, 44, 1, 12, 'th', 'category', 15, '%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%E0%B9%81%E0%B8%A3%E0%B8%81', 'หน้าแรก', '', 3),
(55, 0, 1, 1, 'th', 'custom_link', NULL, NULL, NULL, '#TEST NESTED UL#', 1),
(56, 31, 1, 24, 'th', 'page', 59, '%E0%B8%99%E0%B9%82%E0%B8%A2%E0%B8%9A%E0%B8%B2%E0%B8%A2', 'นโยบาย', '', 2),
(57, 31, 1, 25, 'th', 'page', 62, '%E0%B8%97%E0%B8%94%E0%B8%A5%E0%B8%AD%E0%B8%87%E0%B8%81%E0%B8%B3%E0%B8%AB%E0%B8%99%E0%B8%94%E0%B8%AA%E0%B9%84%E0%B8%95%E0%B8%A5%E0%B9%8C', 'ทดลองกำหนดสไตล์', '', 2),
(58, 0, 2, 2, 'th', 'link', NULL, 'blog', 'Blog', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `an_modules`
--

CREATE TABLE IF NOT EXISTS `an_modules` (
  `module_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module_system_name` varchar(255) NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `module_version` varchar(30) DEFAULT NULL,
  `module_description` text,
  `module_author` varchar(255) DEFAULT NULL,
  `module_author_url` varchar(255) DEFAULT NULL,
  `module_enable` int(1) NOT NULL DEFAULT '0',
  `module_install` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_system_name` (`module_system_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `an_modules`
--

INSERT INTO `an_modules` (`module_id`, `module_system_name`, `module_name`, `module_url`, `module_version`, `module_description`, `module_author`, `module_author_url`, `module_enable`, `module_install`) VALUES
(19, 'core', 'Agni core module.', 'http://www.agnicms.org', NULL, 'Agni cms core module.', 'vee w.', 'http://okvee.net', 1, 0),
(24, 'blog', 'Blog', 'http://agnicms.org/blog', '1.0', 'Sample module that works on its own table, show how component menu works.', 'vee w.', 'http://okvee.net', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `an_plugins`
--

CREATE TABLE IF NOT EXISTS `an_plugins` (
  `plugin_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_system_name` varchar(255) NOT NULL,
  `plugin_name` varchar(255) NOT NULL,
  `plugin_url` varchar(255) DEFAULT NULL,
  `plugin_version` varchar(30) DEFAULT NULL,
  `plugin_description` text,
  `plugin_author` varchar(255) DEFAULT NULL,
  `plugin_author_url` varchar(255) DEFAULT NULL,
  `plugin_active` int(1) DEFAULT '0',
  PRIMARY KEY (`plugin_id`),
  UNIQUE KEY `plugin_system_name` (`plugin_system_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Deprecated, use modules plug instead' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `an_plugins`
--


-- --------------------------------------------------------

--
-- Table structure for table `an_posts`
--

CREATE TABLE IF NOT EXISTS `an_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `revision_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `post_type` varchar(255) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `post_name` varchar(255) DEFAULT NULL,
  `post_uri` varchar(255) NOT NULL,
  `post_uri_encoded` tinytext,
  `post_feature_image` int(11) DEFAULT NULL COMMENT 'refer to file id',
  `post_comment` int(1) NOT NULL DEFAULT '0' COMMENT 'allow comment? 0=no, 1=yes',
  `post_status` int(1) NOT NULL DEFAULT '1' COMMENT 'published? 0=no, 1=yes',
  `post_add` bigint(20) DEFAULT NULL,
  `post_add_gmt` bigint(20) DEFAULT NULL,
  `post_update` bigint(20) DEFAULT NULL,
  `post_update_gmt` bigint(20) DEFAULT NULL,
  `post_publish_date` bigint(20) DEFAULT NULL,
  `post_publish_date_gmt` bigint(20) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `content_settings` text COMMENT 'store serialize array of settings',
  `comment_count` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`post_id`),
  UNIQUE KEY `post_uri` (`post_uri`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='for content-type article, pages, static content.' AUTO_INCREMENT=65 ;

--
-- Dumping data for table `an_posts`
--

INSERT INTO `an_posts` (`post_id`, `revision_id`, `account_id`, `post_type`, `language`, `theme_system_name`, `post_name`, `post_uri`, `post_uri_encoded`, `post_feature_image`, `post_comment`, `post_status`, `post_add`, `post_add_gmt`, `post_update`, `post_update_gmt`, `post_publish_date`, `post_publish_date_gmt`, `meta_title`, `meta_description`, `meta_keywords`, `content_settings`, `comment_count`) VALUES
(43, 48, 1, 'article', 'th', NULL, 'บทความไทย', 'บทความไทย', '%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B9%84%E0%B8%97%E0%B8%A2', NULL, 1, 1, 1337409077, 1337383877, 1337409077, 1337383877, 1337409077, 1337383877, NULL, NULL, NULL, NULL, 8),
(44, 49, 1, 'article', 'th', NULL, '2nd บทความ', '2nd-บทความ', '2nd-%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1', NULL, 1, 1, 1337409147, 1337383947, 1337409147, 1337383947, 1337409147, 1337383947, NULL, NULL, NULL, NULL, 3),
(45, 50, 1, 'article', 'th', 'quick-start', 'กำหนดธีมในบทความ', 'กำหนดธีมในบทความ', '%E0%B8%81%E0%B8%B3%E0%B8%AB%E0%B8%99%E0%B8%94%E0%B8%98%E0%B8%B5%E0%B8%A1%E0%B9%83%E0%B8%99%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1', NULL, 1, 1, 1337409194, 1337383994, 1337635046, 1337609846, 1337409194, 1337383994, NULL, NULL, NULL, NULL, 0),
(46, 52, 1, 'article', 'th', NULL, 'ใช้ธีมที่อยู่กับหมวดหมู่', 'ใช้ธีมที่อยู่กับหมวดหมู่', '%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B8%98%E0%B8%B5%E0%B8%A1%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%AD%E0%B8%A2%E0%B8%B9%E0%B9%88%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%AB%E0%B8%A1%E0%B8%A7%E0%B8%94%E0%B8%AB%E0%B8%A1%E0%B8%B9%E0%B9%88', NULL, 1, 1, 1337409278, 1337384078, 1337410227, 1337385027, 1337409278, 1337384078, NULL, NULL, NULL, NULL, 0),
(47, 53, 1, 'article', 'th', NULL, 'เพิ่มแทกจากในบทความ', 'เพิ่มแทกจากในบทความ', '%E0%B9%80%E0%B8%9E%E0%B8%B4%E0%B9%88%E0%B8%A1%E0%B9%81%E0%B8%97%E0%B8%81%E0%B8%88%E0%B8%B2%E0%B8%81%E0%B9%83%E0%B8%99%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1', NULL, 1, 1, 1337409467, 1337384267, 1337410211, 1337385011, 1337409467, 1337384267, NULL, NULL, NULL, NULL, 0),
(48, 54, 1, 'article', 'th', NULL, 'test', 'test', 'test', NULL, 1, 1, 1337410044, 1337384844, 1337410044, 1337384844, 1337410044, 1337384844, NULL, NULL, NULL, NULL, 0),
(49, 55, 1, 'article', 'th', NULL, 'test', 'p', 'p', NULL, 1, 1, 1337410047, 1337384847, 1338288187, 1338262987, 1337410047, 1337384847, NULL, NULL, NULL, NULL, 0),
(53, 59, 1, 'article', 'th', NULL, 'test', 'p-4', 'p-4', NULL, 1, 1, 1337410062, 1337384862, 1337410062, 1337384862, 1337410062, 1337384862, NULL, NULL, NULL, NULL, 0),
(55, 61, 1, 'article', 'th', NULL, 'test', 'p-6', 'p-6', NULL, 1, 1, 1337410070, 1337384870, 1337410070, 1337384870, 1337410070, 1337384870, NULL, NULL, NULL, NULL, 0),
(56, 62, 1, 'page', 'th', NULL, 'เกี่ยวกับเรา', 'เกี่ยวกับเรา', '%E0%B9%80%E0%B8%81%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A7%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%80%E0%B8%A3%E0%B8%B2', NULL, 0, 1, 1337410597, 1337385397, 1337410597, 1337385397, 1337410597, 1337385397, NULL, NULL, NULL, NULL, 0),
(57, 63, 2, 'article', 'th', NULL, 'asdf', 'asdf', 'asdf', NULL, 1, 1, 1337599092, 1337573892, 1339501183, 1339475983, 1337634576, 1337609376, NULL, NULL, NULL, NULL, 0),
(58, 64, 1, 'page', 'th', NULL, 'ข้อตกลง', 'ข้อตกลง', '%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%95%E0%B8%81%E0%B8%A5%E0%B8%87', NULL, 0, 1, 1338204594, 1338179394, 1338204594, 1338179394, 1338204594, 1338179394, NULL, NULL, NULL, NULL, 0),
(59, 65, 1, 'page', 'th', NULL, 'นโยบาย', 'นโยบาย', '%E0%B8%99%E0%B9%82%E0%B8%A2%E0%B8%9A%E0%B8%B2%E0%B8%A2', NULL, 0, 1, 1338204609, 1338179409, 1338204609, 1338179409, 1338204609, 1338179409, NULL, NULL, NULL, NULL, 0),
(60, 70, 1, 'article', 'th', NULL, 'ทดสอบใช้ฟิลด์ script &amp; style', 'ทดสอบใช้ฟิลด์-script-style', '%E0%B8%97%E0%B8%94%E0%B8%AA%E0%B8%AD%E0%B8%9A%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B8%9F%E0%B8%B4%E0%B8%A5%E0%B8%94%E0%B9%8C-script-style', NULL, 1, 1, 1339197735, 1339172535, 1339228372, 1339203172, 1339197735, 1339172535, NULL, NULL, NULL, NULL, 0),
(61, 67, 1, 'article', 'th', NULL, 'test style &amp; script 2', 'test-style-script-2', 'test-style-script-2', NULL, 1, 1, 1339197889, 1339172689, 1339198099, 1339172899, 1339197889, 1339172689, NULL, NULL, NULL, NULL, 0),
(62, 68, 1, 'page', 'th', NULL, 'ทดลองกำหนดสไตล์', 'ทดลองกำหนดสไตล์', '%E0%B8%97%E0%B8%94%E0%B8%A5%E0%B8%AD%E0%B8%87%E0%B8%81%E0%B8%B3%E0%B8%AB%E0%B8%99%E0%B8%94%E0%B8%AA%E0%B9%84%E0%B8%95%E0%B8%A5%E0%B9%8C', NULL, 0, 1, 1339198379, 1339173179, 1339591800, 1339566600, 1339198379, 1339173179, NULL, NULL, NULL, NULL, 0),
(63, 71, 1, 'article', 'th', NULL, 'ไก่กับไข่', 'ไก่กับไข่', '%E0%B9%84%E0%B8%81%E0%B9%88%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%84%E0%B8%82%E0%B9%88', NULL, 1, 1, 1339491732, 1339466532, 1339491732, 1339466532, 1339491732, 1339466532, NULL, NULL, NULL, NULL, 0),
(64, 73, 1, 'article', 'th', NULL, 'test richtext', 'test-richtext', 'test-richtext', NULL, 1, 1, 1339588536, 1339563336, 1339655454, 1339630254, 1339588536, 1339563336, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `an_post_fields`
--

CREATE TABLE IF NOT EXISTS `an_post_fields` (
  `post_id` int(11) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `field_value` text,
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='store each field of posts';

--
-- Dumping data for table `an_post_fields`
--


-- --------------------------------------------------------

--
-- Table structure for table `an_post_revision`
--

CREATE TABLE IF NOT EXISTS `an_post_revision` (
  `revision_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `header_value` text,
  `body_value` longtext,
  `body_summary` text,
  `log` text COMMENT 'explain that what was changed',
  `revision_date` bigint(20) DEFAULT NULL,
  `revision_date_gmt` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`revision_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `an_post_revision`
--

INSERT INTO `an_post_revision` (`revision_id`, `post_id`, `account_id`, `header_value`, `body_value`, `body_summary`, `log`, `revision_date`, `revision_date_gmt`) VALUES
(48, 43, 1, NULL, 'ทดสอบภาษาไทย', NULL, NULL, 1337409077, 1337383877),
(49, 44, 1, NULL, 'ฟหกด ฟหกด ฟหกด ฟหกด\r\n<p>รนยบ</p>\r\n<p>ผปอทม</p>', NULL, NULL, 1337409147, 1337383947),
(50, 45, 1, NULL, 'บทความนี้กำหนดธีมในตัวมันเอง', NULL, NULL, 1337409194, 1337383994),
(51, 46, 1, NULL, 'บทความนี้ไม่กำหนดธีมเอง แต่ใช้ธีมจากหมวดหมู่', NULL, NULL, 1337409278, 1337384078),
(52, 46, 1, NULL, '<p>บทความนี้ไม่กำหนดธีมเอง แต่ใช้ธีมจากหมวดหมู่</p>\r\n\r\n<p>ต้องเปิดดูจากหมวดหมู่ c2 มาก่อนเท่านั้น</p>', NULL, 'อธิบายรายละเอียด', 1337409323, 1337384123),
(53, 47, 1, NULL, '<p>ทดลองเพิ่มแทกที่ไม่มีอยู่เข้าไปจากในบทความเลย</p>', NULL, NULL, 1337409467, 1337384267),
(54, 48, 1, NULL, '<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>', NULL, NULL, 1337410044, 1337384844),
(55, 49, 1, NULL, '<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>', NULL, NULL, 1337410047, 1337384847),
(59, 53, 1, NULL, '<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>', NULL, NULL, 1337410062, 1337384862),
(61, 55, 1, NULL, '<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>\r\n<p>test test test test</p>', NULL, NULL, 1337410070, 1337384870),
(62, 56, 1, NULL, '<p>เนื้อหาหน้าเกี่ยวกับเรา</p>\r\n<p>asdf asdf qweqrew tert we</p>', NULL, NULL, 1337410597, 1337385397),
(63, 57, 2, NULL, 'fdsa', NULL, NULL, 1337599092, 1337573892),
(64, 58, 1, NULL, 'ฟหกดฟหกด ฟหกด หกฟด หกฟด กหฟด หกฟ กหฟ หกฟ', NULL, NULL, 1338204594, 1338179394),
(65, 59, 1, NULL, 'กฟหกดกห ฟดหกฟ หกด หกฟด กหฟ หกฟ หกฟ', NULL, NULL, 1338204609, 1338179409),
(66, 60, 1, NULL, 'ทดลองใช้ field <span class="test-style-custom">style</span> & script', NULL, NULL, 1339197735, 1339172535),
(67, 61, 1, '<style>\r\n.custom-style {color: #f54; font-size:15px; font-weight: bolder;}\r\n</style>', '<span class="custom-style">test</span> &lt; custom style', NULL, NULL, 1339197889, 1339172689),
(68, 62, 1, '<style>\r\n.custom-style {color: #f0f;}\r\n</style>', '<p><span class="custom-style">กำหนด</span> style เอาเอง</p>', NULL, NULL, 1339198380, 1339173180),
(69, 60, 1, '<style>\r\n.test-style-custom {color: #ff0;}\r\n</style>', 'ทดลองใช้ field <span class="test-style-custom">style</span> & script', NULL, 'add style', 1339198697, 1339173497),
(70, 60, 1, '<style>\r\n.test-style-custom {color: #0c9; font-size: 20px;}\r\n</style>', 'ทดลองใช้ field <span class="test-style-custom">style</span> &amp; script', NULL, 'modify style', 1339198901, 1339173701),
(71, 63, 1, NULL, 'อะไรเกิดทีหลัง', NULL, NULL, 1339491732, 1339466532),
(72, 64, 1, NULL, '<p>dsf <strong>bold</strong> <em>italic</em> <span style="text-decoration: underline;">underline</span> <em><strong>mixed <span style="text-decoration: underline;">all</span></strong></em>&nbsp;</p>\r\n<p>aaaa <span style="color: #ff6600; background-color: #0000ff;">aaaa</span> aaaa</p>\r\n<h3><img src="http://localhost/agni-cms/public/upload/media/th/537032-bigthumbnail1.jpg" alt="" /> cat</h3>\r\n<p>ffff ffff ffff</p>\r\n<p><a href="http://localhost/agni-cms/public/upload/media/th/bd315c6034a85edf3d7d269e49540923dc54759e.jpg"><img src="http://localhost/agni-cms/public/upload/media/th/bd315c6034a85edf3d7d269e49540923dc54759e(1).jpg" alt="" /></a></p>', '<p>test tinymce + insert media</p>\r\n<p>&nbsp;</p>', NULL, 1339588536, 1339563336),
(73, 64, 1, NULL, '<p>dsf <strong>bold</strong> <em>italic</em> <span style="text-decoration: underline;">underline</span> <em><strong>mixed <span style="text-decoration: underline;">all</span></strong></em>&nbsp;</p>\r\n<p>aaaa <span style="color: #ff6600; background-color: #0000ff;">aaaa</span> aaaa</p>\r\n<div style="background-color: #333333;">\r\n<h3><span style="font-size: x-large;"><span style="color: #ff00ff;">c</span><span style="color: #ff9900;">o</span><span style="color: #ffff00;">l</span><span style="color: #00ff00;">o</span><span style="color: #993366;">r</span><span style="color: #8c9ff6;">e</span><span style="color: #fd5252;">d</span></span></h3>\r\n</div>\r\n<p>ffff ffff ffff</p>', '<p>test tinymce+media</p>\r\n<p>&nbsp;</p>', NULL, 1339591603, 1339566403);

-- --------------------------------------------------------

--
-- Table structure for table `an_taxonomy_index`
--

CREATE TABLE IF NOT EXISTS `an_taxonomy_index` (
  `index_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT 'post id',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'term id',
  `position` int(9) NOT NULL DEFAULT '1',
  `create` bigint(20) DEFAULT NULL COMMENT 'local date time',
  PRIMARY KEY (`index_id`),
  KEY `post_id` (`post_id`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='store id between taxonomy/posts' AUTO_INCREMENT=193 ;

--
-- Dumping data for table `an_taxonomy_index`
--

INSERT INTO `an_taxonomy_index` (`index_id`, `post_id`, `tid`, `position`, `create`) VALUES
(162, 43, 16, 1, 1337409077),
(163, 43, 15, 11, 1337409077),
(164, 43, 20, 1, 1337409077),
(165, 44, 18, 1, 1337409147),
(166, 44, 15, 10, 1337409147),
(167, 44, 22, 1, 1337409147),
(168, 45, 17, 1, 1337409194),
(169, 45, 15, 9, 1337409195),
(170, 45, 20, 1, 1337409195),
(171, 46, 19, 1, 1337409278),
(172, 47, 23, 1, 1337409467),
(173, 48, 15, 1, 1337410044),
(174, 48, 21, 1, 1337410044),
(175, 49, 15, 2, 1337410047),
(179, 53, 15, 6, 1337410062),
(181, 55, 15, 8, 1337410070),
(182, 47, 19, 2, 1337410211),
(183, 46, 15, 12, 1337410227),
(184, 57, 17, 2, 1337599106),
(185, 49, 16, 2, 1338288141),
(186, 60, 19, 3, 1339197754),
(187, 60, 15, 13, 1339197754),
(188, 61, 17, 3, 1339197911),
(189, 61, 15, 14, 1339197911),
(190, 63, 16, 3, 1339491732),
(191, 64, 19, 4, 1339588548),
(192, 64, 15, 15, 1339588548);

-- --------------------------------------------------------

--
-- Table structure for table `an_taxonomy_term_data`
--

CREATE TABLE IF NOT EXISTS `an_taxonomy_term_data` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(5) DEFAULT NULL,
  `t_type` varchar(255) DEFAULT NULL COMMENT 'type of taxonomy. eg. tag, category',
  `t_total` int(11) NOT NULL DEFAULT '0' COMMENT 'total posts relate to this.',
  `t_name` varchar(255) DEFAULT NULL,
  `t_description` longtext,
  `t_uri` varchar(255) DEFAULT NULL,
  `t_uri_encoded` tinytext,
  `t_uris` text COMMENT 'full path of uri, eg. animal/4legs/cat (no end slash and must uri encoded) ',
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `theme_system_name` varchar(255) DEFAULT NULL,
  `nlevel` int(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `an_taxonomy_term_data`
--

INSERT INTO `an_taxonomy_term_data` (`tid`, `parent_id`, `language`, `t_type`, `t_total`, `t_name`, `t_description`, `t_uri`, `t_uri_encoded`, `t_uris`, `meta_title`, `meta_description`, `meta_keywords`, `theme_system_name`, `nlevel`) VALUES
(15, 0, 'th', 'category', 11, 'หน้าแรก', NULL, 'หน้าแรก', '%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%E0%B9%81%E0%B8%A3%E0%B8%81', '%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%E0%B9%81%E0%B8%A3%E0%B8%81', NULL, NULL, NULL, NULL, 1),
(16, 0, 'th', 'category', 3, 'cat1', NULL, 'cat1', 'cat1', 'cat1', NULL, NULL, NULL, NULL, 1),
(17, 16, 'th', 'category', 3, 'cat1.1', NULL, 'cat1.1', 'cat1.1', 'cat1/cat1.1', NULL, NULL, NULL, NULL, 2),
(18, 17, 'th', 'category', 1, 'cat1.1.1', NULL, 'cat1.1.1', 'cat1.1.1', 'cat1/cat1.1/cat1.1.1', NULL, NULL, NULL, NULL, 3),
(19, 0, 'th', 'category', 4, 'cat2', 'หมวดหมู่นี้มีธีมที่กำหนดเองต่างหากจากธีมหลัก', 'cat2', 'cat2', 'cat2', NULL, NULL, NULL, NULL, 1),
(20, 0, 'th', 'tag', 2, 'แท็กไทย', NULL, 'แท็กไทย', '%E0%B9%81%E0%B8%97%E0%B9%87%E0%B8%81%E0%B9%84%E0%B8%97%E0%B8%A2', '%E0%B9%81%E0%B8%97%E0%B9%87%E0%B8%81%E0%B9%84%E0%B8%97%E0%B8%A2', NULL, NULL, NULL, NULL, 1),
(21, 0, 'th', 'tag', 1, 'tag1', NULL, 'tag1', 'tag1', 'tag1', NULL, NULL, NULL, NULL, 1),
(22, 0, 'th', 'tag', 1, 'tag2', NULL, 'tag2', 'tag2', 'tag2', NULL, NULL, NULL, NULL, 1),
(23, 0, 'th', 'tag', 1, 'tag3', NULL, 'tag3', 'tag3', 'tag3', NULL, NULL, NULL, NULL, 1),
(24, 0, 'en', 'category', 0, 'category1', NULL, 'category1', 'category1', 'category1', NULL, NULL, NULL, NULL, 1),
(25, 24, 'en', 'category', 0, 'category1.1', NULL, 'category1.1', 'category1.1', 'category1/category1.1', NULL, NULL, NULL, NULL, 2),
(26, 25, 'en', 'category', 0, 'category1.1.1', NULL, 'category1.1.1', 'category1.1.1', 'category1/category1.1/category1.1.1', NULL, NULL, NULL, NULL, 3),
(27, 26, 'en', 'category', 0, 'category1.1.1.1', NULL, 'category1.1.1-1', 'category1.1.1-1', 'category1/category1.1/category1.1.1/category1.1.1-1', NULL, NULL, NULL, NULL, 4),
(28, 0, 'en', 'category', 0, 'category2', NULL, 'category2', 'category2', 'category2', NULL, NULL, NULL, NULL, 1),
(29, 0, 'en', 'category', 0, 'category3', NULL, 'category3', 'category3', 'category3', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `an_themes`
--

CREATE TABLE IF NOT EXISTS `an_themes` (
  `theme_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_system_name` varchar(255) NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_url` varchar(255) DEFAULT NULL,
  `theme_version` varchar(30) DEFAULT NULL,
  `theme_description` text,
  `theme_enable` int(1) NOT NULL DEFAULT '0',
  `theme_default` int(1) NOT NULL DEFAULT '0',
  `theme_default_admin` int(1) NOT NULL DEFAULT '0',
  `theme_settings` text,
  PRIMARY KEY (`theme_id`),
  UNIQUE KEY `theme_system_name` (`theme_system_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `an_themes`
--

INSERT INTO `an_themes` (`theme_id`, `theme_system_name`, `theme_name`, `theme_url`, `theme_version`, `theme_description`, `theme_enable`, `theme_default`, `theme_default_admin`, `theme_settings`) VALUES
(1, 'system', 'System', 'http://www.agnicms.org', '1.0', 'Agni system theme.', 1, 1, 1, NULL),
(4, 'quick-start', 'quick-start', NULL, NULL, NULL, 1, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `an_url_alias`
--

CREATE TABLE IF NOT EXISTS `an_url_alias` (
  `alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_type` varchar(255) DEFAULT NULL COMMENT 'content type eg. article, page, category, tag, ...etc...',
  `c_id` int(11) DEFAULT NULL COMMENT 'those content id',
  `uri` varchar(255) DEFAULT NULL,
  `uri_encoded` tinytext,
  `language` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`alias_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `an_url_alias`
--

INSERT INTO `an_url_alias` (`alias_id`, `c_type`, `c_id`, `uri`, `uri_encoded`, `language`) VALUES
(1, 'category', 15, 'หน้าแรก', '%E0%B8%AB%E0%B8%99%E0%B9%89%E0%B8%B2%E0%B9%81%E0%B8%A3%E0%B8%81', 'th'),
(2, 'category', 16, 'cat1', 'cat1', 'th'),
(3, 'category', 17, 'cat1.1', 'cat1.1', 'th'),
(4, 'category', 18, 'cat1.1.1', 'cat1.1.1', 'th'),
(5, 'category', 19, 'cat2', 'cat2', 'th'),
(6, 'tag', 20, 'แท็กไทย', '%E0%B9%81%E0%B8%97%E0%B9%87%E0%B8%81%E0%B9%84%E0%B8%97%E0%B8%A2', 'th'),
(7, 'tag', 21, 'tag1', 'tag1', 'th'),
(8, 'tag', 22, 'tag2', 'tag2', 'th'),
(9, 'article', 43, 'บทความไทย', '%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B9%84%E0%B8%97%E0%B8%A2', 'th'),
(10, 'article', 44, '2nd-บทความ', '2nd-%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1', 'th'),
(11, 'article', 45, 'กำหนดธีมในบทความ', '%E0%B8%81%E0%B8%B3%E0%B8%AB%E0%B8%99%E0%B8%94%E0%B8%98%E0%B8%B5%E0%B8%A1%E0%B9%83%E0%B8%99%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1', 'th'),
(12, 'article', 46, 'ใช้ธีมที่อยู่กับหมวดหมู่', '%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B8%98%E0%B8%B5%E0%B8%A1%E0%B8%97%E0%B8%B5%E0%B9%88%E0%B8%AD%E0%B8%A2%E0%B8%B9%E0%B9%88%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%AB%E0%B8%A1%E0%B8%A7%E0%B8%94%E0%B8%AB%E0%B8%A1%E0%B8%B9%E0%B9%88', 'th'),
(13, 'tag', 23, 'tag3', 'tag3', 'th'),
(14, 'article', 47, 'เพิ่มแทกจากในบทความ', '%E0%B9%80%E0%B8%9E%E0%B8%B4%E0%B9%88%E0%B8%A1%E0%B9%81%E0%B8%97%E0%B8%81%E0%B8%88%E0%B8%B2%E0%B8%81%E0%B9%83%E0%B8%99%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1', 'th'),
(15, 'article', 48, 'test', 'test', 'th'),
(16, 'article', 49, 'p', 'p', 'th'),
(20, 'article', 53, 'p-4', 'p-4', 'th'),
(22, 'article', 55, 'p-6', 'p-6', 'th'),
(23, 'page', 56, 'เกี่ยวกับเรา', '%E0%B9%80%E0%B8%81%E0%B8%B5%E0%B9%88%E0%B8%A2%E0%B8%A7%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%80%E0%B8%A3%E0%B8%B2', 'th'),
(26, 'article', 57, 'asdf', 'asdf', 'th'),
(27, 'category', 24, 'category1', 'category1', 'en'),
(28, 'category', 25, 'category1.1', 'category1.1', 'en'),
(29, 'category', 26, 'category1.1.1', 'category1.1.1', 'en'),
(30, 'category', 27, 'category1.1.1-1', 'category1.1.1-1', 'en'),
(31, 'category', 28, 'category2', 'category2', 'en'),
(32, 'category', 29, 'category3', 'category3', 'en'),
(33, 'page', 58, 'ข้อตกลง', '%E0%B8%82%E0%B9%89%E0%B8%AD%E0%B8%95%E0%B8%81%E0%B8%A5%E0%B8%87', 'th'),
(34, 'page', 59, 'นโยบาย', '%E0%B8%99%E0%B9%82%E0%B8%A2%E0%B8%9A%E0%B8%B2%E0%B8%A2', 'th'),
(35, 'article', 60, 'ทดสอบใช้ฟิลด์-script-style', '%E0%B8%97%E0%B8%94%E0%B8%AA%E0%B8%AD%E0%B8%9A%E0%B9%83%E0%B8%8A%E0%B9%89%E0%B8%9F%E0%B8%B4%E0%B8%A5%E0%B8%94%E0%B9%8C-script-style', 'th'),
(36, 'article', 61, 'test-style-script-2', 'test-style-script-2', 'th'),
(37, 'page', 62, 'ทดลองกำหนดสไตล์', '%E0%B8%97%E0%B8%94%E0%B8%A5%E0%B8%AD%E0%B8%87%E0%B8%81%E0%B8%B3%E0%B8%AB%E0%B8%99%E0%B8%94%E0%B8%AA%E0%B9%84%E0%B8%95%E0%B8%A5%E0%B9%8C', 'th'),
(38, 'article', 63, 'ไก่กับไข่', '%E0%B9%84%E0%B8%81%E0%B9%88%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B9%84%E0%B8%82%E0%B9%88', 'th'),
(39, 'article', 64, 'test-richtext', 'test-richtext', 'th');
