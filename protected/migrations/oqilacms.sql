-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 21, 2017 at 05:15 PM
-- Server version: 5.5.54-0+deb8u1
-- PHP Version: 5.6.29-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `oqilacms`
--

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_blog_blog`
--

CREATE TABLE IF NOT EXISTS `oqilacms_blog_blog` (
`id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `icon` varchar(250) NOT NULL DEFAULT '',
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `member_status` int(11) NOT NULL DEFAULT '1',
  `post_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_blog_post`
--

CREATE TABLE IF NOT EXISTS `oqilacms_blog_post` (
`id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `create_user_id` int(11) NOT NULL,
  `update_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `publish_time` int(11) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `title` varchar(250) NOT NULL,
  `quote` text,
  `content` text NOT NULL,
  `link` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `comment_status` int(11) NOT NULL DEFAULT '1',
  `create_user_ip` varchar(20) NOT NULL,
  `access_type` int(11) NOT NULL DEFAULT '1',
  `keywords` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `image` varchar(300) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_blog_post_to_tag`
--

CREATE TABLE IF NOT EXISTS `oqilacms_blog_post_to_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_blog_tag`
--

CREATE TABLE IF NOT EXISTS `oqilacms_blog_tag` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_blog_user_to_blog`
--

CREATE TABLE IF NOT EXISTS `oqilacms_blog_user_to_blog` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1',
  `note` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_callback`
--

CREATE TABLE IF NOT EXISTS `oqilacms_callback` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_category_category`
--

CREATE TABLE IF NOT EXISTS `oqilacms_category_category` (
`id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `lang` char(2) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_comment_comment`
--

CREATE TABLE IF NOT EXISTS `oqilacms_comment_comment` (
`id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `model` varchar(100) NOT NULL,
  `model_id` int(11) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `text` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `root` int(11) DEFAULT '0',
  `lft` int(11) DEFAULT '0',
  `rgt` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_contentblock_content_block`
--

CREATE TABLE IF NOT EXISTS `oqilacms_contentblock_content_block` (
`id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `code` varchar(100) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_dictionary_dictionary_data`
--

CREATE TABLE IF NOT EXISTS `oqilacms_dictionary_dictionary_data` (
`id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `value` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_dictionary_dictionary_group`
--

CREATE TABLE IF NOT EXISTS `oqilacms_dictionary_dictionary_group` (
`id` int(11) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `create_user_id` int(11) DEFAULT NULL,
  `update_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_feedback_feedback`
--

CREATE TABLE IF NOT EXISTS `oqilacms_feedback_feedback` (
`id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `answer_user` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(150) DEFAULT NULL,
  `theme` varchar(250) NOT NULL,
  `text` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `answer_time` datetime DEFAULT NULL,
  `is_faq` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_gallery_gallery`
--

CREATE TABLE IF NOT EXISTS `oqilacms_gallery_gallery` (
`id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `owner` int(11) DEFAULT NULL,
  `preview_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_gallery_image_to_gallery`
--

CREATE TABLE IF NOT EXISTS `oqilacms_gallery_image_to_gallery` (
`id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_image_image`
--

CREATE TABLE IF NOT EXISTS `oqilacms_image_image` (
`id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` text,
  `file` varchar(250) NOT NULL,
  `create_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `alt` varchar(250) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_mail_mail_event`
--

CREATE TABLE IF NOT EXISTS `oqilacms_mail_mail_event` (
`id` int(11) NOT NULL,
  `code` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_mail_mail_template`
--

CREATE TABLE IF NOT EXISTS `oqilacms_mail_mail_template` (
`id` int(11) NOT NULL,
  `code` varchar(150) NOT NULL,
  `event_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text,
  `from` varchar(150) NOT NULL,
  `to` varchar(150) NOT NULL,
  `theme` text NOT NULL,
  `body` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_menu_menu`
--

CREATE TABLE IF NOT EXISTS `oqilacms_menu_menu` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_menu_menu`
--

INSERT INTO `oqilacms_menu_menu` (`id`, `name`, `code`, `description`, `status`) VALUES
(1, 'Верхнее меню', 'top-menu', 'Main site menu. Located at top in "main menu" block.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_menu_menu_item`
--

CREATE TABLE IF NOT EXISTS `oqilacms_menu_menu_item` (
`id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `regular_link` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL,
  `href` varchar(150) NOT NULL,
  `class` varchar(150) DEFAULT NULL,
  `title_attr` varchar(150) DEFAULT NULL,
  `before_link` varchar(150) DEFAULT NULL,
  `after_link` varchar(150) DEFAULT NULL,
  `target` varchar(150) DEFAULT NULL,
  `rel` varchar(150) DEFAULT NULL,
  `condition_name` varchar(150) DEFAULT '0',
  `condition_denial` int(11) DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_menu_menu_item`
--

INSERT INTO `oqilacms_menu_menu_item` (`id`, `parent_id`, `menu_id`, `regular_link`, `title`, `href`, `class`, `title_attr`, `before_link`, `after_link`, `target`, `rel`, `condition_name`, `condition_denial`, `sort`, `status`) VALUES
(1, 0, 1, 1, 'Главная', '/', '', 'Главная страница сайта', '', '', '', '', '', 0, 1, 1),
(2, 0, 1, 0, 'Блоги', '/blog/blog/index', '', 'Блоги', '', '', '', '', '', 0, 2, 1),
(3, 2, 1, 0, 'Пользователи', '/user/people/index', '', 'Пользователи', '', '', '', '', '', 0, 3, 1),
(4, 0, 1, 0, 'Wiki', '/wiki/default/index', '', 'Wiki', '', '', '', '', '', 0, 9, 0),
(5, 0, 1, 0, 'Войти', '/user/account/login', 'login-text', 'Войти на сайт', '', '', '', '', 'isAuthenticated', 1, 11, 1),
(6, 0, 1, 0, 'Выйти', '/user/account/logout', 'login-text', 'Выйти', '', '', '', '', 'isAuthenticated', 0, 12, 1),
(7, 0, 1, 0, 'Регистрация', '/user/account/registration', 'login-text', 'Регистрация на сайте', '', '', '', '', 'isAuthenticated', 1, 10, 1),
(8, 0, 1, 0, 'Панель управления', '/yupe/backend/index', 'login-text', 'Панель управления сайтом', '', '', '', '', 'isSuperUser', 0, 13, 1),
(9, 0, 1, 0, 'FAQ', '/feedback/contact/faq', '', 'FAQ', '', '', '', '', '', 0, 7, 1),
(10, 0, 1, 0, 'Контакты', '/feedback/contact/index', '', 'Контакты', '', '', '', '', '', 0, 7, 1),
(11, 0, 1, 0, 'Магазин', '/store/product/index', '', 'Магазин', '', '', '', '', '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_migrations`
--

CREATE TABLE IF NOT EXISTS `oqilacms_migrations` (
`id` int(11) NOT NULL,
  `module` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_migrations`
--

INSERT INTO `oqilacms_migrations` (`id`, `module`, `version`, `apply_time`) VALUES
(1, 'user', 'm000000_000000_user_base', 1480788359),
(2, 'user', 'm131019_212911_user_tokens', 1480788359),
(3, 'user', 'm131025_152911_clean_user_table', 1480788360),
(4, 'user', 'm131026_002234_prepare_hash_user_password', 1480788361),
(5, 'user', 'm131106_111552_user_restore_fields', 1480788361),
(6, 'user', 'm131121_190850_modify_tokes_table', 1480788362),
(7, 'user', 'm140812_100348_add_expire_to_token_table', 1480788362),
(8, 'user', 'm150416_113652_rename_fields', 1480788363),
(9, 'user', 'm151006_000000_user_add_phone', 1480788364),
(10, 'yupe', 'm000000_000000_yupe_base', 1480788365),
(11, 'yupe', 'm130527_154455_yupe_change_unique_index', 1480788365),
(12, 'yupe', 'm150416_125517_rename_fields', 1480788366),
(13, 'yupe', 'm160204_195213_change_settings_type', 1480788366),
(14, 'category', 'm000000_000000_category_base', 1480788367),
(15, 'category', 'm150415_150436_rename_fields', 1480788368),
(16, 'store', 'm140812_160000_store_attribute_group_base', 1480788369),
(17, 'store', 'm140812_170000_store_attribute_base', 1480788369),
(18, 'store', 'm140812_180000_store_attribute_option_base', 1480788370),
(19, 'store', 'm140813_200000_store_category_base', 1480788371),
(20, 'store', 'm140813_210000_store_type_base', 1480788371),
(21, 'store', 'm140813_220000_store_type_attribute_base', 1480788372),
(22, 'store', 'm140813_230000_store_producer_base', 1480788372),
(23, 'store', 'm140814_000000_store_product_base', 1480788374),
(24, 'store', 'm140814_000010_store_product_category_base', 1480788375),
(25, 'store', 'm140814_000013_store_product_attribute_eav_base', 1480788376),
(26, 'store', 'm140814_000018_store_product_image_base', 1480788376),
(27, 'store', 'm140814_000020_store_product_variant_base', 1480788377),
(28, 'store', 'm141014_210000_store_product_category_column', 1480788379),
(29, 'store', 'm141015_170000_store_product_image_column', 1480788380),
(30, 'store', 'm141218_091834_default_null', 1480788380),
(31, 'store', 'm150210_063409_add_store_menu_item', 1480788380),
(32, 'store', 'm150210_105811_add_price_column', 1480788381),
(33, 'store', 'm150210_131238_order_category', 1480788381),
(34, 'store', 'm150211_105453_add_position_for_product_variant', 1480788381),
(35, 'store', 'm150226_065935_add_product_position', 1480788382),
(36, 'store', 'm150416_112008_rename_fields', 1480788382),
(37, 'store', 'm150417_180000_store_product_link_base', 1480788384),
(38, 'store', 'm150825_184407_change_store_url', 1480788384),
(39, 'store', 'm150907_084604_new_attributes', 1480788385),
(40, 'store', 'm151218_081635_add_external_id_fields', 1480788386),
(41, 'store', 'm151218_082939_add_external_id_ix', 1480788386),
(42, 'store', 'm151218_142113_add_product_index', 1480788387),
(43, 'store', 'm151223_140722_drop_product_type_categories', 1480788387),
(44, 'store', 'm160210_084850_add_h1_and_canonical', 1480788389),
(45, 'store', 'm160210_131541_add_main_image_alt_title', 1480788389),
(46, 'store', 'm160211_180200_add_additional_images_alt_title', 1480788390),
(47, 'store', 'm160215_110749_add_image_groups_table', 1480788391),
(48, 'store', 'm160227_114934_rename_producer_order_column', 1480788391),
(49, 'store', 'm160309_091039_add_attributes_sort_and_search_fields', 1480788392),
(50, 'store', 'm160413_184551_add_type_attr_fk', 1480788392),
(51, 'store', 'm160602_091243_add_position_product_index', 1480788392),
(52, 'store', 'm160602_091909_add_producer_sort_index', 1480788393),
(53, 'store', 'm160713_105449_remove_irrelevant_product_status', 1480788393),
(54, 'store', 'm160805_070905_add_attribute_description', 1480788393),
(55, 'store', 'm161015_121915_change_product_external_id_type', 1480788394),
(56, 'payment', 'm140815_170000_store_payment_base', 1480788394),
(57, 'mail', 'm000000_000000_mail_base', 1480788395),
(58, 'image', 'm000000_000000_image_base', 1480788397),
(59, 'image', 'm150226_121100_image_order', 1480788397),
(60, 'image', 'm150416_080008_rename_fields', 1480788398),
(61, 'delivery', 'm140815_190000_store_delivery_base', 1480788398),
(62, 'delivery', 'm140815_200000_store_delivery_payment_base', 1480788399),
(63, 'comment', 'm000000_000000_comment_base', 1480788401),
(64, 'comment', 'm130704_095200_comment_nestedsets', 1480788403),
(65, 'comment', 'm150415_151804_rename_fields', 1480788404),
(66, 'order', 'm140814_200000_store_order_base', 1480788406),
(67, 'order', 'm150324_105949_order_status_table', 1480788407),
(68, 'order', 'm150416_100212_rename_fields', 1480788408),
(69, 'order', 'm150514_065554_change_order_price', 1480788408),
(70, 'order', 'm151209_185124_split_address', 1480788409),
(71, 'order', 'm151211_115447_add_appartment_field', 1480788409),
(72, 'order', 'm160415_055344_add_manager_to_order', 1480788410),
(73, 'order', 'm160618_145025_add_status_color', 1480788410),
(74, 'page', 'm000000_000000_page_base', 1480788414),
(75, 'page', 'm130115_155600_columns_rename', 1480788414),
(76, 'page', 'm140115_083618_add_layout', 1480788415),
(77, 'page', 'm140620_072543_add_view', 1480788415),
(78, 'page', 'm150312_151049_change_body_type', 1480788415),
(79, 'page', 'm150416_101038_rename_fields', 1480788416),
(80, 'coupon', 'm140816_200000_store_coupon_base', 1480788416),
(81, 'coupon', 'm150414_124659_add_order_coupon_table', 1480788417),
(82, 'coupon', 'm150415_153218_rename_fields', 1480788417),
(83, 'notify', 'm141031_091039_add_notify_table', 1480788418),
(84, 'blog', 'm000000_000000_blog_base', 1480788427),
(85, 'blog', 'm130503_091124_BlogPostImage', 1480788427),
(86, 'blog', 'm130529_151602_add_post_category', 1480788428),
(87, 'blog', 'm140226_052326_add_community_fields', 1480788428),
(88, 'blog', 'm140714_110238_blog_post_quote_type', 1480788429),
(89, 'blog', 'm150406_094809_blog_post_quote_type', 1480788429),
(90, 'blog', 'm150414_180119_rename_date_fields', 1480788431),
(91, 'blog', 'm160518_175903_alter_blog_foreign_keys', 1480788432),
(92, 'callback', 'm150926_083350_callback_base', 1480788432),
(93, 'callback', 'm160621_075232_add_date_to_callback', 1480788433),
(94, 'rbac', 'm140115_131455_auth_item', 1480788434),
(95, 'rbac', 'm140115_132045_auth_item_child', 1480788435),
(96, 'rbac', 'm140115_132319_auth_item_assign', 1480788436),
(97, 'rbac', 'm140702_230000_initial_role_data', 1480788436),
(98, 'social', 'm000000_000000_social_profile', 1480788437),
(99, 'feedback', 'm000000_000000_feedback_base', 1480788440),
(100, 'feedback', 'm150415_184108_rename_fields', 1480788440),
(101, 'dictionary', 'm000000_000000_dictionary_base', 1480788444),
(102, 'dictionary', 'm150415_183050_rename_fields', 1480788445),
(103, 'sitemap', 'm141004_130000_sitemap_page', 1480788445),
(104, 'sitemap', 'm141004_140000_sitemap_page_data', 1480788446),
(105, 'queue', 'm000000_000000_queue_base', 1480788448),
(106, 'queue', 'm131007_031000_queue_fix_index', 1480788448),
(107, 'news', 'm000000_000000_news_base', 1480788450),
(108, 'news', 'm150416_081251_rename_fields', 1480788451),
(109, 'menu', 'm000000_000000_menu_base', 1480788452),
(110, 'menu', 'm121220_001126_menu_test_data', 1480788452),
(111, 'menu', 'm160914_134555_fix_menu_item_default_values', 1480788454),
(112, 'gallery', 'm000000_000000_gallery_base', 1480788456),
(113, 'gallery', 'm130427_120500_gallery_creation_user', 1480788457),
(114, 'gallery', 'm150416_074146_rename_fields', 1480788457),
(115, 'gallery', 'm160514_131314_add_preview_to_gallery', 1480788458),
(116, 'gallery', 'm160515_123559_add_category_to_gallery', 1480788459),
(117, 'gallery', 'm160515_151348_add_position_to_gallery_image', 1480788459),
(118, 'contentblock', 'm000000_000000_contentblock_base', 1480788460),
(119, 'contentblock', 'm140715_130737_add_category_id', 1480788460),
(120, 'contentblock', 'm150127_130425_add_status_column', 1480788461),
(121, 'yml', 'm141110_090000_yandex_market_export_base', 1480788461),
(122, 'yml', 'm160119_084800_rename_yandex_market_table', 1480788461);

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_news_news`
--

CREATE TABLE IF NOT EXISTS `oqilacms_news_news` (
`id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `date` date NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `short_text` text,
  `full_text` text NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `link` varchar(300) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_notify_settings`
--

CREATE TABLE IF NOT EXISTS `oqilacms_notify_settings` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `my_post` tinyint(1) NOT NULL DEFAULT '1',
  `my_comment` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_page_page`
--

CREATE TABLE IF NOT EXISTS `oqilacms_page_page` (
`id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `lang` char(2) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `change_user_id` int(11) DEFAULT NULL,
  `title_short` varchar(150) NOT NULL,
  `title` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `body` mediumtext NOT NULL,
  `keywords` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `status` int(11) NOT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `layout` varchar(250) DEFAULT NULL,
  `view` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_queue_queue`
--

CREATE TABLE IF NOT EXISTS `oqilacms_queue_queue` (
`id` int(11) NOT NULL,
  `worker` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `task` text NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `complete_time` datetime DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `notice` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_sitemap_page`
--

CREATE TABLE IF NOT EXISTS `oqilacms_sitemap_page` (
`id` int(11) NOT NULL,
  `url` varchar(250) NOT NULL,
  `changefreq` varchar(20) NOT NULL,
  `priority` float NOT NULL DEFAULT '0.5',
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_sitemap_page`
--

INSERT INTO `oqilacms_sitemap_page` (`id`, `url`, `changefreq`, `priority`, `status`) VALUES
(1, '/', 'daily', 0.5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_social_user`
--

CREATE TABLE IF NOT EXISTS `oqilacms_social_user` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `provider` varchar(250) NOT NULL,
  `uid` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_attribute`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_attribute` (
`id` int(11) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0',
  `is_filter` smallint(6) NOT NULL DEFAULT '1',
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_attribute_group` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_attribute_option`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_attribute_option` (
`id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `position` tinyint(4) DEFAULT NULL,
  `value` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_category`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_category` (
`id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '1',
  `external_id` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_canonical` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_coupon`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_coupon` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `min_order_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `registered_user` tinyint(4) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(4) NOT NULL DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `quantity_per_user` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_delivery`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_delivery` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `free_from` float(10,2) DEFAULT NULL,
  `available_from` float(10,2) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `separate_payment` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_delivery_payment`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_delivery_payment` (
  `delivery_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_order`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_order` (
`id` int(11) NOT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `delivery_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method_id` int(11) DEFAULT NULL,
  `paid` tinyint(4) DEFAULT '0',
  `payment_time` datetime DEFAULT NULL,
  `payment_details` text,
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `coupon_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `separate_delivery` tinyint(4) DEFAULT '0',
  `status_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(1024) NOT NULL DEFAULT '',
  `ip` varchar(15) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `note` varchar(1024) NOT NULL DEFAULT '',
  `modified` datetime DEFAULT NULL,
  `zipcode` varchar(30) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `apartment` varchar(10) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_order_coupon`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_order_coupon` (
`id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_order_product`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_order_product` (
`id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `variants` text,
  `variants_text` varchar(1024) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `sku` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_order_status`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_order_status` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_store_order_status`
--

INSERT INTO `oqilacms_store_order_status` (`id`, `name`, `is_system`, `color`) VALUES
(1, 'Новый', 1, 'default'),
(2, 'Принят', 1, 'info'),
(3, 'Выполнен', 1, 'success'),
(4, 'Удален', 1, 'danger');

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_payment`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_payment` (
`id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `settings` text,
  `currency_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_producer`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_producer` (
`id` int(11) NOT NULL,
  `name_short` varchar(150) NOT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `image` varchar(250) DEFAULT NULL,
  `short_description` text,
  `description` text,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product` (
`id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `producer_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `sku` varchar(100) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `price` decimal(19,3) NOT NULL DEFAULT '0.000',
  `discount_price` decimal(19,3) DEFAULT NULL,
  `discount` decimal(19,3) DEFAULT NULL,
  `description` text,
  `short_description` text,
  `data` text,
  `is_special` tinyint(1) NOT NULL DEFAULT '0',
  `length` decimal(19,3) DEFAULT NULL,
  `width` decimal(19,3) DEFAULT NULL,
  `height` decimal(19,3) DEFAULT NULL,
  `weight` decimal(19,3) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `in_stock` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `meta_title` varchar(250) DEFAULT NULL,
  `meta_keywords` varchar(250) DEFAULT NULL,
  `meta_description` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `average_price` decimal(19,3) DEFAULT NULL,
  `purchase_price` decimal(19,3) DEFAULT NULL,
  `recommended_price` decimal(19,3) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1',
  `external_id` varchar(100) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_canonical` varchar(255) DEFAULT NULL,
  `image_alt` varchar(255) DEFAULT NULL,
  `image_title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product_attribute_value`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product_attribute_value` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `number_value` double DEFAULT NULL,
  `string_value` varchar(250) DEFAULT NULL,
  `text_value` text,
  `option_value` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product_category`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product_category` (
`id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product_image`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product_image` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `alt` varchar(255) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product_image_group`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product_image_group` (
`id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product_link`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product_link` (
`id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `linked_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product_link_type`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product_link_type` (
`id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_store_product_link_type`
--

INSERT INTO `oqilacms_store_product_link_type` (`id`, `code`, `title`) VALUES
(1, 'similar', 'Похожие'),
(2, 'related', 'Сопутствующие');

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_product_variant`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_product_variant` (
`id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `type` tinyint(4) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_type`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_type` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_store_type_attribute`
--

CREATE TABLE IF NOT EXISTS `oqilacms_store_type_attribute` (
  `type_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_user_tokens`
--

CREATE TABLE IF NOT EXISTS `oqilacms_user_tokens` (
`id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `expire_time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_user_tokens`
--

INSERT INTO `oqilacms_user_tokens` (`id`, `user_id`, `token`, `type`, `status`, `create_time`, `update_time`, `ip`, `expire_time`) VALUES
(3, 1, 'RFVgLQAkW_nNumEF4TMqHcoPTW~A_2AC', 4, 0, '2017-01-30 13:59:17', '2017-01-30 13:59:17', '127.0.0.1', '2017-02-06 13:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_user_user`
--

CREATE TABLE IF NOT EXISTS `oqilacms_user_user` (
`id` int(11) NOT NULL,
  `update_time` datetime NOT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `middle_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `nick_name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0',
  `birth_date` date DEFAULT NULL,
  `site` varchar(250) NOT NULL DEFAULT '',
  `about` varchar(250) NOT NULL DEFAULT '',
  `location` varchar(250) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '2',
  `access_level` int(11) NOT NULL DEFAULT '0',
  `visit_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `avatar` varchar(150) DEFAULT NULL,
  `hash` varchar(255) NOT NULL DEFAULT 'c5cc1d816f9b7139ba9f7de95c9470fb0.02069800 1480788361',
  `email_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `phone` char(30) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_user_user`
--

INSERT INTO `oqilacms_user_user` (`id`, `update_time`, `first_name`, `middle_name`, `last_name`, `nick_name`, `email`, `gender`, `birth_date`, `site`, `about`, `location`, `status`, `access_level`, `visit_time`, `create_time`, `avatar`, `hash`, `email_confirm`, `phone`) VALUES
(1, '2016-12-03 23:08:49', '', '', '', 'admin', 'admin@mail.com', 0, NULL, '', '', '', 1, 1, '2017-01-30 13:59:17', '2016-12-03 23:08:49', NULL, '$2y$13$yRMf.r/kqZ41bMpOWtdsmO6uA0WadZTGcZc8XeTfuFi5Gb3WAWyau', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_user_user_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `oqilacms_user_user_auth_assignment` (
  `itemname` char(64) NOT NULL,
  `userid` int(11) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_user_user_auth_assignment`
--

INSERT INTO `oqilacms_user_user_auth_assignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_user_user_auth_item`
--

CREATE TABLE IF NOT EXISTS `oqilacms_user_user_auth_item` (
  `name` char(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_user_user_auth_item`
--

INSERT INTO `oqilacms_user_user_auth_item` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('admin', 2, 'Admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_user_user_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `oqilacms_user_user_auth_item_child` (
  `parent` char(64) NOT NULL,
  `child` char(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_yml_export`
--

CREATE TABLE IF NOT EXISTS `oqilacms_yml_export` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oqilacms_yupe_settings`
--

CREATE TABLE IF NOT EXISTS `oqilacms_yupe_settings` (
`id` int(11) NOT NULL,
  `module_id` varchar(100) NOT NULL,
  `param_name` varchar(100) NOT NULL,
  `param_value` varchar(500) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oqilacms_yupe_settings`
--

INSERT INTO `oqilacms_yupe_settings` (`id`, `module_id`, `param_name`, `param_value`, `create_time`, `update_time`, `user_id`, `type`) VALUES
(1, 'yupe', 'siteDescription', 'OqilaCMS - the fastest way to create modern websites', '2016-12-03 23:08:59', '2016-12-04 16:28:51', 1, 1),
(2, 'yupe', 'siteName', 'OqilaCMS', '2016-12-03 23:08:59', '2016-12-04 16:28:51', 1, 1),
(3, 'yupe', 'siteKeyWords', 'oqilacms, cms', '2016-12-03 23:08:59', '2016-12-04 16:28:51', 1, 1),
(4, 'yupe', 'email', 'admin@mail.com', '2016-12-03 23:08:59', '2016-12-03 23:08:59', 1, 1),
(5, 'yupe', 'theme', 'default', '2016-12-03 23:08:59', '2017-01-30 14:03:04', 1, 1),
(6, 'yupe', 'backendTheme', '', '2016-12-03 23:08:59', '2016-12-03 23:08:59', 1, 1),
(7, 'yupe', 'defaultLanguage', 'en', '2016-12-03 23:08:59', '2016-12-03 23:08:59', 1, 1),
(8, 'yupe', 'defaultBackendLanguage', 'en', '2016-12-03 23:08:59', '2016-12-03 23:08:59', 1, 1),
(9, 'yupe', 'coreCacheTime', '3600', '2016-12-04 16:28:51', '2016-12-04 16:28:51', 1, 1),
(10, 'yupe', 'uploadPath', 'uploads', '2016-12-04 16:28:51', '2016-12-04 16:28:51', 1, 1),
(11, 'yupe', 'editor', 'redactor', '2016-12-04 16:28:51', '2016-12-04 16:28:51', 1, 1),
(12, 'yupe', 'availableLanguages', 'ru,en', '2016-12-04 16:28:51', '2016-12-04 16:28:51', 1, 1),
(13, 'yupe', 'allowedIp', '', '2016-12-04 16:28:51', '2016-12-04 16:28:51', 1, 1),
(14, 'yupe', 'hidePanelUrls', '0', '2016-12-04 16:28:51', '2016-12-04 16:28:51', 1, 1),
(15, 'yupe', 'logo', 'images/logo.png', '2016-12-04 16:28:51', '2016-12-04 16:28:51', 1, 1),
(16, 'yupe', 'allowedExtensions', 'gif, jpeg, png, jpg, zip, rar, doc, docx, xls, xlsx, pdf', '2016-12-04 16:28:52', '2016-12-04 16:28:52', 1, 1),
(17, 'yupe', 'mimeTypes', 'image/gif,image/jpeg,image/png,application/pdf,application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/zip,application/x-rar,application/x-rar-compressed, application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', '2016-12-04 16:28:52', '2016-12-04 16:28:52', 1, 1),
(18, 'yupe', 'maxSize', '5242880', '2016-12-04 16:28:52', '2016-12-04 16:28:52', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `oqilacms_blog_blog`
--
ALTER TABLE `oqilacms_blog_blog`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_blog_blog_slug_lang` (`slug`,`lang`), ADD KEY `ix_yupe_blog_blog_create_user` (`create_user_id`), ADD KEY `ix_yupe_blog_blog_update_user` (`update_user_id`), ADD KEY `ix_yupe_blog_blog_status` (`status`), ADD KEY `ix_yupe_blog_blog_type` (`type`), ADD KEY `ix_yupe_blog_blog_create_date` (`create_time`), ADD KEY `ix_yupe_blog_blog_update_date` (`update_time`), ADD KEY `ix_yupe_blog_blog_lang` (`lang`), ADD KEY `ix_yupe_blog_blog_slug` (`slug`), ADD KEY `ix_yupe_blog_blog_category_id` (`category_id`);

--
-- Indexes for table `oqilacms_blog_post`
--
ALTER TABLE `oqilacms_blog_post`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_blog_post_lang_slug` (`slug`,`lang`), ADD KEY `ix_yupe_blog_post_blog_id` (`blog_id`), ADD KEY `ix_yupe_blog_post_create_user_id` (`create_user_id`), ADD KEY `ix_yupe_blog_post_update_user_id` (`update_user_id`), ADD KEY `ix_yupe_blog_post_status` (`status`), ADD KEY `ix_yupe_blog_post_access_type` (`access_type`), ADD KEY `ix_yupe_blog_post_comment_status` (`comment_status`), ADD KEY `ix_yupe_blog_post_lang` (`lang`), ADD KEY `ix_yupe_blog_post_slug` (`slug`), ADD KEY `ix_yupe_blog_post_publish_date` (`publish_time`), ADD KEY `ix_yupe_blog_post_category_id` (`category_id`);

--
-- Indexes for table `oqilacms_blog_post_to_tag`
--
ALTER TABLE `oqilacms_blog_post_to_tag`
 ADD PRIMARY KEY (`post_id`,`tag_id`), ADD KEY `ix_yupe_blog_post_to_tag_post_id` (`post_id`), ADD KEY `ix_yupe_blog_post_to_tag_tag_id` (`tag_id`);

--
-- Indexes for table `oqilacms_blog_tag`
--
ALTER TABLE `oqilacms_blog_tag`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_blog_tag_tag_name` (`name`);

--
-- Indexes for table `oqilacms_blog_user_to_blog`
--
ALTER TABLE `oqilacms_blog_user_to_blog`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_blog_user_to_blog_blog_user_to_blog_u_b` (`user_id`,`blog_id`), ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_user_id` (`user_id`), ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_id` (`blog_id`), ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_status` (`status`), ADD KEY `ix_yupe_blog_user_to_blog_blog_user_to_blog_role` (`role`);

--
-- Indexes for table `oqilacms_callback`
--
ALTER TABLE `oqilacms_callback`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oqilacms_category_category`
--
ALTER TABLE `oqilacms_category_category`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_category_category_alias_lang` (`slug`,`lang`), ADD KEY `ix_yupe_category_category_parent_id` (`parent_id`), ADD KEY `ix_yupe_category_category_status` (`status`);

--
-- Indexes for table `oqilacms_comment_comment`
--
ALTER TABLE `oqilacms_comment_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_comment_comment_status` (`status`), ADD KEY `ix_yupe_comment_comment_model_model_id` (`model`,`model_id`), ADD KEY `ix_yupe_comment_comment_model` (`model`), ADD KEY `ix_yupe_comment_comment_model_id` (`model_id`), ADD KEY `ix_yupe_comment_comment_user_id` (`user_id`), ADD KEY `ix_yupe_comment_comment_parent_id` (`parent_id`), ADD KEY `ix_yupe_comment_comment_level` (`level`), ADD KEY `ix_yupe_comment_comment_root` (`root`), ADD KEY `ix_yupe_comment_comment_lft` (`lft`), ADD KEY `ix_yupe_comment_comment_rgt` (`rgt`);

--
-- Indexes for table `oqilacms_contentblock_content_block`
--
ALTER TABLE `oqilacms_contentblock_content_block`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_contentblock_content_block_code` (`code`), ADD KEY `ix_yupe_contentblock_content_block_type` (`type`), ADD KEY `ix_yupe_contentblock_content_block_status` (`status`);

--
-- Indexes for table `oqilacms_dictionary_dictionary_data`
--
ALTER TABLE `oqilacms_dictionary_dictionary_data`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_dictionary_dictionary_data_code_unique` (`code`), ADD KEY `ix_yupe_dictionary_dictionary_data_group_id` (`group_id`), ADD KEY `ix_yupe_dictionary_dictionary_data_create_user_id` (`create_user_id`), ADD KEY `ix_yupe_dictionary_dictionary_data_update_user_id` (`update_user_id`), ADD KEY `ix_yupe_dictionary_dictionary_data_status` (`status`);

--
-- Indexes for table `oqilacms_dictionary_dictionary_group`
--
ALTER TABLE `oqilacms_dictionary_dictionary_group`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_dictionary_dictionary_group_code` (`code`), ADD KEY `ix_yupe_dictionary_dictionary_group_create_user_id` (`create_user_id`), ADD KEY `ix_yupe_dictionary_dictionary_group_update_user_id` (`update_user_id`);

--
-- Indexes for table `oqilacms_feedback_feedback`
--
ALTER TABLE `oqilacms_feedback_feedback`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_feedback_feedback_category` (`category_id`), ADD KEY `ix_yupe_feedback_feedback_type` (`type`), ADD KEY `ix_yupe_feedback_feedback_status` (`status`), ADD KEY `ix_yupe_feedback_feedback_isfaq` (`is_faq`), ADD KEY `ix_yupe_feedback_feedback_answer_user` (`answer_user`);

--
-- Indexes for table `oqilacms_gallery_gallery`
--
ALTER TABLE `oqilacms_gallery_gallery`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_gallery_gallery_status` (`status`), ADD KEY `ix_yupe_gallery_gallery_owner` (`owner`), ADD KEY `fk_yupe_gallery_gallery_gallery_preview_to_image` (`preview_id`), ADD KEY `fk_yupe_gallery_gallery_gallery_to_category` (`category_id`);

--
-- Indexes for table `oqilacms_gallery_image_to_gallery`
--
ALTER TABLE `oqilacms_gallery_image_to_gallery`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_gallery_image_to_gallery_gallery_to_image` (`image_id`,`gallery_id`), ADD KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_image` (`image_id`), ADD KEY `ix_yupe_gallery_image_to_gallery_gallery_to_image_gallery` (`gallery_id`);

--
-- Indexes for table `oqilacms_image_image`
--
ALTER TABLE `oqilacms_image_image`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_image_image_status` (`status`), ADD KEY `ix_yupe_image_image_user` (`user_id`), ADD KEY `ix_yupe_image_image_type` (`type`), ADD KEY `ix_yupe_image_image_category_id` (`category_id`), ADD KEY `fk_yupe_image_image_parent_id` (`parent_id`);

--
-- Indexes for table `oqilacms_mail_mail_event`
--
ALTER TABLE `oqilacms_mail_mail_event`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_mail_mail_event_code` (`code`);

--
-- Indexes for table `oqilacms_mail_mail_template`
--
ALTER TABLE `oqilacms_mail_mail_template`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_mail_mail_template_code` (`code`), ADD KEY `ix_yupe_mail_mail_template_status` (`status`), ADD KEY `ix_yupe_mail_mail_template_event_id` (`event_id`);

--
-- Indexes for table `oqilacms_menu_menu`
--
ALTER TABLE `oqilacms_menu_menu`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_menu_menu_code` (`code`), ADD KEY `ix_yupe_menu_menu_status` (`status`);

--
-- Indexes for table `oqilacms_menu_menu_item`
--
ALTER TABLE `oqilacms_menu_menu_item`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_menu_menu_item_menu_id` (`menu_id`), ADD KEY `ix_yupe_menu_menu_item_sort` (`sort`), ADD KEY `ix_yupe_menu_menu_item_status` (`status`);

--
-- Indexes for table `oqilacms_migrations`
--
ALTER TABLE `oqilacms_migrations`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_migrations_module` (`module`);

--
-- Indexes for table `oqilacms_news_news`
--
ALTER TABLE `oqilacms_news_news`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_news_news_alias_lang` (`slug`,`lang`), ADD KEY `ix_yupe_news_news_status` (`status`), ADD KEY `ix_yupe_news_news_user_id` (`user_id`), ADD KEY `ix_yupe_news_news_category_id` (`category_id`), ADD KEY `ix_yupe_news_news_date` (`date`);

--
-- Indexes for table `oqilacms_notify_settings`
--
ALTER TABLE `oqilacms_notify_settings`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_notify_settings_user_id` (`user_id`);

--
-- Indexes for table `oqilacms_page_page`
--
ALTER TABLE `oqilacms_page_page`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_page_page_slug_lang` (`slug`,`lang`), ADD KEY `ix_yupe_page_page_status` (`status`), ADD KEY `ix_yupe_page_page_is_protected` (`is_protected`), ADD KEY `ix_yupe_page_page_user_id` (`user_id`), ADD KEY `ix_yupe_page_page_change_user_id` (`change_user_id`), ADD KEY `ix_yupe_page_page_menu_order` (`order`), ADD KEY `ix_yupe_page_page_category_id` (`category_id`);

--
-- Indexes for table `oqilacms_queue_queue`
--
ALTER TABLE `oqilacms_queue_queue`
 ADD PRIMARY KEY (`id`), ADD KEY `ux_yupe_queue_queue_worker` (`worker`), ADD KEY `ux_yupe_queue_queue_priority` (`priority`);

--
-- Indexes for table `oqilacms_sitemap_page`
--
ALTER TABLE `oqilacms_sitemap_page`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_sitemap_page_url` (`url`);

--
-- Indexes for table `oqilacms_social_user`
--
ALTER TABLE `oqilacms_social_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_social_user_uid` (`uid`), ADD KEY `ix_yupe_social_user_provider` (`provider`), ADD KEY `fk_yupe_social_user_user_id` (`user_id`);

--
-- Indexes for table `oqilacms_store_attribute`
--
ALTER TABLE `oqilacms_store_attribute`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_store_attribute_name_group` (`name`,`group_id`), ADD KEY `ix_yupe_store_attribute_title` (`title`), ADD KEY `fk_yupe_store_attribute_group` (`group_id`);

--
-- Indexes for table `oqilacms_store_attribute_group`
--
ALTER TABLE `oqilacms_store_attribute_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oqilacms_store_attribute_option`
--
ALTER TABLE `oqilacms_store_attribute_option`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_store_attribute_option_attribute_id` (`attribute_id`), ADD KEY `ix_yupe_store_attribute_option_position` (`position`);

--
-- Indexes for table `oqilacms_store_category`
--
ALTER TABLE `oqilacms_store_category`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_store_category_alias` (`slug`), ADD KEY `ix_yupe_store_category_parent_id` (`parent_id`), ADD KEY `ix_yupe_store_category_status` (`status`), ADD KEY `yupe_store_category_external_id_ix` (`external_id`);

--
-- Indexes for table `oqilacms_store_coupon`
--
ALTER TABLE `oqilacms_store_coupon`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oqilacms_store_delivery`
--
ALTER TABLE `oqilacms_store_delivery`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_yupe_store_delivery_position` (`position`);

--
-- Indexes for table `oqilacms_store_delivery_payment`
--
ALTER TABLE `oqilacms_store_delivery_payment`
 ADD PRIMARY KEY (`delivery_id`,`payment_id`), ADD KEY `fk_yupe_store_delivery_payment_payment` (`payment_id`);

--
-- Indexes for table `oqilacms_store_order`
--
ALTER TABLE `oqilacms_store_order`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `udx_yupe_store_order_url` (`url`), ADD KEY `idx_yupe_store_order_user_id` (`user_id`), ADD KEY `idx_yupe_store_order_date` (`date`), ADD KEY `idx_yupe_store_order_status` (`status_id`), ADD KEY `idx_yupe_store_order_paid` (`paid`), ADD KEY `fk_yupe_store_order_delivery` (`delivery_id`), ADD KEY `fk_yupe_store_order_payment` (`payment_method_id`), ADD KEY `fk_yupe_store_order_manager` (`manager_id`);

--
-- Indexes for table `oqilacms_store_order_coupon`
--
ALTER TABLE `oqilacms_store_order_coupon`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_yupe_store_order_coupon_order` (`order_id`), ADD KEY `fk_yupe_store_order_coupon_coupon` (`coupon_id`);

--
-- Indexes for table `oqilacms_store_order_product`
--
ALTER TABLE `oqilacms_store_order_product`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_yupe_store_order_product_order_id` (`order_id`), ADD KEY `idx_yupe_store_order_product_product_id` (`product_id`);

--
-- Indexes for table `oqilacms_store_order_status`
--
ALTER TABLE `oqilacms_store_order_status`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oqilacms_store_payment`
--
ALTER TABLE `oqilacms_store_payment`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_yupe_store_payment_position` (`position`);

--
-- Indexes for table `oqilacms_store_producer`
--
ALTER TABLE `oqilacms_store_producer`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_store_producer_slug` (`slug`), ADD KEY `ix_yupe_store_producer_sort` (`sort`);

--
-- Indexes for table `oqilacms_store_product`
--
ALTER TABLE `oqilacms_store_product`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_store_product_alias` (`slug`), ADD KEY `ix_yupe_store_product_status` (`status`), ADD KEY `ix_yupe_store_product_type_id` (`type_id`), ADD KEY `ix_yupe_store_product_producer_id` (`producer_id`), ADD KEY `ix_yupe_store_product_price` (`price`), ADD KEY `ix_yupe_store_product_discount_price` (`discount_price`), ADD KEY `ix_yupe_store_product_create_time` (`create_time`), ADD KEY `ix_yupe_store_product_update_time` (`update_time`), ADD KEY `fk_yupe_store_product_category` (`category_id`), ADD KEY `yupe_store_product_external_id_ix` (`external_id`), ADD KEY `ix_yupe_store_product_sku` (`sku`), ADD KEY `ix_yupe_store_product_name` (`name`), ADD KEY `ix_yupe_store_product_position` (`position`);

--
-- Indexes for table `oqilacms_store_product_attribute_value`
--
ALTER TABLE `oqilacms_store_product_attribute_value`
 ADD PRIMARY KEY (`id`), ADD KEY `yupe_fk_product_attribute_product` (`product_id`), ADD KEY `yupe_fk_product_attribute_attribute` (`attribute_id`), ADD KEY `yupe_fk_product_attribute_option` (`option_value`), ADD KEY `yupe_ix_product_attribute_number_value` (`number_value`), ADD KEY `yupe_ix_product_attribute_string_value` (`string_value`);

--
-- Indexes for table `oqilacms_store_product_category`
--
ALTER TABLE `oqilacms_store_product_category`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_store_product_category_product_id` (`product_id`), ADD KEY `ix_yupe_store_product_category_category_id` (`category_id`);

--
-- Indexes for table `oqilacms_store_product_image`
--
ALTER TABLE `oqilacms_store_product_image`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_yupe_store_product_image_product` (`product_id`), ADD KEY `fk_yupe_store_product_image_group` (`group_id`);

--
-- Indexes for table `oqilacms_store_product_image_group`
--
ALTER TABLE `oqilacms_store_product_image_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oqilacms_store_product_link`
--
ALTER TABLE `oqilacms_store_product_link`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_store_product_link_product` (`product_id`,`linked_product_id`), ADD KEY `fk_yupe_store_product_link_linked_product` (`linked_product_id`), ADD KEY `fk_yupe_store_product_link_type` (`type_id`);

--
-- Indexes for table `oqilacms_store_product_link_type`
--
ALTER TABLE `oqilacms_store_product_link_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_store_product_link_type_code` (`code`), ADD UNIQUE KEY `ux_yupe_store_product_link_type_title` (`title`);

--
-- Indexes for table `oqilacms_store_product_variant`
--
ALTER TABLE `oqilacms_store_product_variant`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_yupe_store_product_variant_product` (`product_id`), ADD KEY `idx_yupe_store_product_variant_attribute` (`attribute_id`), ADD KEY `idx_yupe_store_product_variant_value` (`attribute_value`);

--
-- Indexes for table `oqilacms_store_type`
--
ALTER TABLE `oqilacms_store_type`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_store_type_name` (`name`);

--
-- Indexes for table `oqilacms_store_type_attribute`
--
ALTER TABLE `oqilacms_store_type_attribute`
 ADD PRIMARY KEY (`type_id`,`attribute_id`), ADD KEY `fk_yupe_store_type_attribute_attribute` (`attribute_id`);

--
-- Indexes for table `oqilacms_user_tokens`
--
ALTER TABLE `oqilacms_user_tokens`
 ADD PRIMARY KEY (`id`), ADD KEY `ix_yupe_user_tokens_user_id` (`user_id`);

--
-- Indexes for table `oqilacms_user_user`
--
ALTER TABLE `oqilacms_user_user`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_user_user_nick_name` (`nick_name`), ADD UNIQUE KEY `ux_yupe_user_user_email` (`email`), ADD KEY `ix_yupe_user_user_status` (`status`);

--
-- Indexes for table `oqilacms_user_user_auth_assignment`
--
ALTER TABLE `oqilacms_user_user_auth_assignment`
 ADD PRIMARY KEY (`itemname`,`userid`), ADD KEY `fk_yupe_user_user_auth_assignment_user` (`userid`);

--
-- Indexes for table `oqilacms_user_user_auth_item`
--
ALTER TABLE `oqilacms_user_user_auth_item`
 ADD PRIMARY KEY (`name`), ADD KEY `ix_yupe_user_user_auth_item_type` (`type`);

--
-- Indexes for table `oqilacms_user_user_auth_item_child`
--
ALTER TABLE `oqilacms_user_user_auth_item_child`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `fk_yupe_user_user_auth_item_child_child` (`child`);

--
-- Indexes for table `oqilacms_yml_export`
--
ALTER TABLE `oqilacms_yml_export`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oqilacms_yupe_settings`
--
ALTER TABLE `oqilacms_yupe_settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `ux_yupe_yupe_settings_module_id_param_name_user_id` (`module_id`,`param_name`,`user_id`), ADD KEY `ix_yupe_yupe_settings_module_id` (`module_id`), ADD KEY `ix_yupe_yupe_settings_param_name` (`param_name`), ADD KEY `fk_yupe_yupe_settings_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `oqilacms_blog_blog`
--
ALTER TABLE `oqilacms_blog_blog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_blog_post`
--
ALTER TABLE `oqilacms_blog_post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_blog_tag`
--
ALTER TABLE `oqilacms_blog_tag`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_blog_user_to_blog`
--
ALTER TABLE `oqilacms_blog_user_to_blog`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_callback`
--
ALTER TABLE `oqilacms_callback`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_category_category`
--
ALTER TABLE `oqilacms_category_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_comment_comment`
--
ALTER TABLE `oqilacms_comment_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_contentblock_content_block`
--
ALTER TABLE `oqilacms_contentblock_content_block`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_dictionary_dictionary_data`
--
ALTER TABLE `oqilacms_dictionary_dictionary_data`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_dictionary_dictionary_group`
--
ALTER TABLE `oqilacms_dictionary_dictionary_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_feedback_feedback`
--
ALTER TABLE `oqilacms_feedback_feedback`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_gallery_gallery`
--
ALTER TABLE `oqilacms_gallery_gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_gallery_image_to_gallery`
--
ALTER TABLE `oqilacms_gallery_image_to_gallery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_image_image`
--
ALTER TABLE `oqilacms_image_image`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_mail_mail_event`
--
ALTER TABLE `oqilacms_mail_mail_event`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_mail_mail_template`
--
ALTER TABLE `oqilacms_mail_mail_template`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_menu_menu`
--
ALTER TABLE `oqilacms_menu_menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oqilacms_menu_menu_item`
--
ALTER TABLE `oqilacms_menu_menu_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `oqilacms_migrations`
--
ALTER TABLE `oqilacms_migrations`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=123;
--
-- AUTO_INCREMENT for table `oqilacms_news_news`
--
ALTER TABLE `oqilacms_news_news`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_notify_settings`
--
ALTER TABLE `oqilacms_notify_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_page_page`
--
ALTER TABLE `oqilacms_page_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_queue_queue`
--
ALTER TABLE `oqilacms_queue_queue`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_sitemap_page`
--
ALTER TABLE `oqilacms_sitemap_page`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oqilacms_social_user`
--
ALTER TABLE `oqilacms_social_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_attribute`
--
ALTER TABLE `oqilacms_store_attribute`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_attribute_group`
--
ALTER TABLE `oqilacms_store_attribute_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_attribute_option`
--
ALTER TABLE `oqilacms_store_attribute_option`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_category`
--
ALTER TABLE `oqilacms_store_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_coupon`
--
ALTER TABLE `oqilacms_store_coupon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_delivery`
--
ALTER TABLE `oqilacms_store_delivery`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_order`
--
ALTER TABLE `oqilacms_store_order`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_order_coupon`
--
ALTER TABLE `oqilacms_store_order_coupon`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_order_product`
--
ALTER TABLE `oqilacms_store_order_product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_order_status`
--
ALTER TABLE `oqilacms_store_order_status`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `oqilacms_store_payment`
--
ALTER TABLE `oqilacms_store_payment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_producer`
--
ALTER TABLE `oqilacms_store_producer`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_product`
--
ALTER TABLE `oqilacms_store_product`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_product_attribute_value`
--
ALTER TABLE `oqilacms_store_product_attribute_value`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_product_category`
--
ALTER TABLE `oqilacms_store_product_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_product_image`
--
ALTER TABLE `oqilacms_store_product_image`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_product_image_group`
--
ALTER TABLE `oqilacms_store_product_image_group`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_product_link`
--
ALTER TABLE `oqilacms_store_product_link`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_product_link_type`
--
ALTER TABLE `oqilacms_store_product_link_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `oqilacms_store_product_variant`
--
ALTER TABLE `oqilacms_store_product_variant`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_store_type`
--
ALTER TABLE `oqilacms_store_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_user_tokens`
--
ALTER TABLE `oqilacms_user_tokens`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `oqilacms_user_user`
--
ALTER TABLE `oqilacms_user_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `oqilacms_yml_export`
--
ALTER TABLE `oqilacms_yml_export`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `oqilacms_yupe_settings`
--
ALTER TABLE `oqilacms_yupe_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `oqilacms_blog_blog`
--
ALTER TABLE `oqilacms_blog_blog`
ADD CONSTRAINT `fk_yupe_blog_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_blog_blog_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_blog_blog_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_blog_post`
--
ALTER TABLE `oqilacms_blog_post`
ADD CONSTRAINT `fk_yupe_blog_post_blog` FOREIGN KEY (`blog_id`) REFERENCES `oqilacms_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_blog_post_category_id` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_blog_post_create_user` FOREIGN KEY (`create_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_blog_post_update_user` FOREIGN KEY (`update_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_blog_post_to_tag`
--
ALTER TABLE `oqilacms_blog_post_to_tag`
ADD CONSTRAINT `fk_yupe_blog_post_to_tag_post_id` FOREIGN KEY (`post_id`) REFERENCES `oqilacms_blog_post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_blog_post_to_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `oqilacms_blog_tag` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_blog_user_to_blog`
--
ALTER TABLE `oqilacms_blog_user_to_blog`
ADD CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `oqilacms_blog_blog` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_blog_user_to_blog_blog_user_to_blog_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_category_category`
--
ALTER TABLE `oqilacms_category_category`
ADD CONSTRAINT `fk_yupe_category_category_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_comment_comment`
--
ALTER TABLE `oqilacms_comment_comment`
ADD CONSTRAINT `fk_yupe_comment_comment_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `oqilacms_comment_comment` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_comment_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_dictionary_dictionary_data`
--
ALTER TABLE `oqilacms_dictionary_dictionary_data`
ADD CONSTRAINT `fk_yupe_dictionary_dictionary_data_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_dictionary_dictionary_data_data_group_id` FOREIGN KEY (`group_id`) REFERENCES `oqilacms_dictionary_dictionary_group` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_dictionary_dictionary_data_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_dictionary_dictionary_group`
--
ALTER TABLE `oqilacms_dictionary_dictionary_group`
ADD CONSTRAINT `fk_yupe_dictionary_dictionary_group_create_user_id` FOREIGN KEY (`create_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_dictionary_dictionary_group_update_user_id` FOREIGN KEY (`update_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_feedback_feedback`
--
ALTER TABLE `oqilacms_feedback_feedback`
ADD CONSTRAINT `fk_yupe_feedback_feedback_answer_user` FOREIGN KEY (`answer_user`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_feedback_feedback_category` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_gallery_gallery`
--
ALTER TABLE `oqilacms_gallery_gallery`
ADD CONSTRAINT `fk_yupe_gallery_gallery_gallery_preview_to_image` FOREIGN KEY (`preview_id`) REFERENCES `oqilacms_image_image` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_gallery_gallery_gallery_to_category` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_gallery_gallery_owner` FOREIGN KEY (`owner`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_gallery_image_to_gallery`
--
ALTER TABLE `oqilacms_gallery_image_to_gallery`
ADD CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `oqilacms_gallery_gallery` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_gallery_image_to_gallery_gallery_to_image_image` FOREIGN KEY (`image_id`) REFERENCES `oqilacms_image_image` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_image_image`
--
ALTER TABLE `oqilacms_image_image`
ADD CONSTRAINT `fk_yupe_image_image_category_id` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_image_image_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `oqilacms_image_image` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_image_image_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_mail_mail_template`
--
ALTER TABLE `oqilacms_mail_mail_template`
ADD CONSTRAINT `fk_yupe_mail_mail_template_event_id` FOREIGN KEY (`event_id`) REFERENCES `oqilacms_mail_mail_event` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_menu_menu_item`
--
ALTER TABLE `oqilacms_menu_menu_item`
ADD CONSTRAINT `fk_yupe_menu_menu_item_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `oqilacms_menu_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_news_news`
--
ALTER TABLE `oqilacms_news_news`
ADD CONSTRAINT `fk_yupe_news_news_category_id` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_news_news_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_notify_settings`
--
ALTER TABLE `oqilacms_notify_settings`
ADD CONSTRAINT `fk_yupe_notify_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_page_page`
--
ALTER TABLE `oqilacms_page_page`
ADD CONSTRAINT `fk_yupe_page_page_category_id` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_category_category` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_page_page_change_user_id` FOREIGN KEY (`change_user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_yupe_page_page_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `oqilacms_social_user`
--
ALTER TABLE `oqilacms_social_user`
ADD CONSTRAINT `fk_yupe_social_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_attribute`
--
ALTER TABLE `oqilacms_store_attribute`
ADD CONSTRAINT `fk_yupe_store_attribute_group` FOREIGN KEY (`group_id`) REFERENCES `oqilacms_store_attribute_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_attribute_option`
--
ALTER TABLE `oqilacms_store_attribute_option`
ADD CONSTRAINT `fk_yupe_store_attribute_option_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `oqilacms_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_category`
--
ALTER TABLE `oqilacms_store_category`
ADD CONSTRAINT `fk_yupe_store_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `oqilacms_store_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_delivery_payment`
--
ALTER TABLE `oqilacms_store_delivery_payment`
ADD CONSTRAINT `fk_yupe_store_delivery_payment_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `oqilacms_store_delivery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_delivery_payment_payment` FOREIGN KEY (`payment_id`) REFERENCES `oqilacms_store_payment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_order`
--
ALTER TABLE `oqilacms_store_order`
ADD CONSTRAINT `fk_yupe_store_order_delivery` FOREIGN KEY (`delivery_id`) REFERENCES `oqilacms_store_delivery` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_order_manager` FOREIGN KEY (`manager_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_order_payment` FOREIGN KEY (`payment_method_id`) REFERENCES `oqilacms_store_payment` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_order_status` FOREIGN KEY (`status_id`) REFERENCES `oqilacms_store_order_status` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_order_user` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_order_coupon`
--
ALTER TABLE `oqilacms_store_order_coupon`
ADD CONSTRAINT `fk_yupe_store_order_coupon_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `oqilacms_store_coupon` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `fk_yupe_store_order_coupon_order` FOREIGN KEY (`order_id`) REFERENCES `oqilacms_store_order` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oqilacms_store_order_product`
--
ALTER TABLE `oqilacms_store_order_product`
ADD CONSTRAINT `fk_yupe_store_order_product_order` FOREIGN KEY (`order_id`) REFERENCES `oqilacms_store_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_order_product_product` FOREIGN KEY (`product_id`) REFERENCES `oqilacms_store_product` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_product`
--
ALTER TABLE `oqilacms_store_product`
ADD CONSTRAINT `fk_yupe_store_product_category` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_store_category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_product_producer` FOREIGN KEY (`producer_id`) REFERENCES `oqilacms_store_producer` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_product_type` FOREIGN KEY (`type_id`) REFERENCES `oqilacms_store_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_product_attribute_value`
--
ALTER TABLE `oqilacms_store_product_attribute_value`
ADD CONSTRAINT `yupe_fk_product_attribute_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `oqilacms_store_attribute` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `yupe_fk_product_attribute_option` FOREIGN KEY (`option_value`) REFERENCES `oqilacms_store_attribute_option` (`id`) ON DELETE CASCADE,
ADD CONSTRAINT `yupe_fk_product_attribute_product` FOREIGN KEY (`product_id`) REFERENCES `oqilacms_store_product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `oqilacms_store_product_category`
--
ALTER TABLE `oqilacms_store_product_category`
ADD CONSTRAINT `fk_yupe_store_product_category_category` FOREIGN KEY (`category_id`) REFERENCES `oqilacms_store_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_product_category_product` FOREIGN KEY (`product_id`) REFERENCES `oqilacms_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_product_image`
--
ALTER TABLE `oqilacms_store_product_image`
ADD CONSTRAINT `fk_yupe_store_product_image_group` FOREIGN KEY (`group_id`) REFERENCES `oqilacms_store_product_image_group` (`id`) ON DELETE NO ACTION ON UPDATE SET NULL,
ADD CONSTRAINT `fk_yupe_store_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `oqilacms_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_product_link`
--
ALTER TABLE `oqilacms_store_product_link`
ADD CONSTRAINT `fk_yupe_store_product_link_linked_product` FOREIGN KEY (`linked_product_id`) REFERENCES `oqilacms_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_product_link_product` FOREIGN KEY (`product_id`) REFERENCES `oqilacms_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_product_link_type` FOREIGN KEY (`type_id`) REFERENCES `oqilacms_store_product_link_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_product_variant`
--
ALTER TABLE `oqilacms_store_product_variant`
ADD CONSTRAINT `fk_yupe_store_product_variant_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `oqilacms_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_product_variant_product` FOREIGN KEY (`product_id`) REFERENCES `oqilacms_store_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_store_type_attribute`
--
ALTER TABLE `oqilacms_store_type_attribute`
ADD CONSTRAINT `fk_yupe_store_type_attribute_attribute` FOREIGN KEY (`attribute_id`) REFERENCES `oqilacms_store_attribute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_store_type_attribute_type` FOREIGN KEY (`type_id`) REFERENCES `oqilacms_store_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_user_tokens`
--
ALTER TABLE `oqilacms_user_tokens`
ADD CONSTRAINT `fk_yupe_user_tokens_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_user_user_auth_assignment`
--
ALTER TABLE `oqilacms_user_user_auth_assignment`
ADD CONSTRAINT `fk_yupe_user_user_auth_assignment_item` FOREIGN KEY (`itemname`) REFERENCES `oqilacms_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_user_user_auth_assignment_user` FOREIGN KEY (`userid`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_user_user_auth_item_child`
--
ALTER TABLE `oqilacms_user_user_auth_item_child`
ADD CONSTRAINT `fk_yupe_user_user_auth_itemchild_parent` FOREIGN KEY (`parent`) REFERENCES `oqilacms_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_yupe_user_user_auth_item_child_child` FOREIGN KEY (`child`) REFERENCES `oqilacms_user_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oqilacms_yupe_settings`
--
ALTER TABLE `oqilacms_yupe_settings`
ADD CONSTRAINT `fk_yupe_yupe_settings_user_id` FOREIGN KEY (`user_id`) REFERENCES `oqilacms_user_user` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
