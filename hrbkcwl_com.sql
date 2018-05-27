-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-11-28 16:26:11
-- 服务器版本： 5.5.57-log
-- PHP Version: 7.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrbkcwl_com`
--

-- --------------------------------------------------------

--
-- 表的结构 `cool_ad`
--

CREATE TABLE IF NOT EXISTS `cool_ad` (
  `ad_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `type_id` tinyint(5) NOT NULL COMMENT '所属位置',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `open` tinyint(2) NOT NULL COMMENT '1=审核  0=未审核',
  `content` varchar(225) DEFAULT '' COMMENT '广告内容'
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_ad`
--

INSERT INTO `cool_ad` (`ad_id`, `name`, `type_id`, `pic`, `url`, `addtime`, `sort`, `open`, `content`) VALUES
(35, '平安融e贷', 10, '/uploads/20171010/e245a1886f7f276c8c3843aefc113aaf.jpg', '#', 1506391556, 50, 1, ''),
(36, '哈尔滨大剧院', 10, '/uploads/20171010/b9f19816b9b71e6f039e67b2c4351a13.jpg', '#.', 1506391739, 50, 1, ''),
(37, '哈尔滨工业大学', 10, '/uploads/20171010/cec4332c551c2475d795ab1ba2d1a520.jpg', '#.', 1506391774, 50, 1, ''),
(38, '阿蒙木业', 10, '/uploads/20171010/35939915f228c59ddd97b813b1b8455b.jpg', '#.', 1506391793, 50, 1, ''),
(39, '晓峰律师', 10, '/uploads/20171010/2bf04fa1a878c6027ea3be15080cd698.jpg', '#.', 1506391809, 50, 1, ''),
(40, '汤火功夫', 10, '/uploads/20171010/9cabdf51c808b13a83442def3386ee69.jpg', '#.', 1506391829, 50, 1, ''),
(41, '积善家香肠工坊', 10, '/uploads/20171010/d4dc617bff4b5b8cbb2b3542a0de25d4.jpg', 'http://www.baidu.com', 1506392144, 50, 1, ''),
(42, '北方艺考', 10, '/uploads/20171010/f011aba52e7381fa1efdb233a2f74578.jpg', '#', 1507639979, 50, 1, ''),
(43, '释尚商城', 10, '/uploads/20171010/419e793035d7057c67b53216990e5c33.jpg', '#', 1507640097, 50, 1, ''),
(44, '格罗斯红酒', 10, '/uploads/20171010/38dbe8238a6252663cd4cbe2f20c6cbc.jpg', '#', 1507640125, 50, 1, ''),
(45, 'picheir', 10, '/uploads/20171010/06d668b2661b367ed15dce90d570a287.jpg', '#', 1507640154, 50, 1, ''),
(46, '哈尔滨轮滑协会', 10, '/uploads/20171010/d3edc11e12d9c3e736235dd203e52917.jpg', '#', 1507640193, 50, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `cool_admin`
--

CREATE TABLE IF NOT EXISTS `cool_admin` (
  `admin_id` tinyint(4) NOT NULL COMMENT '管理员ID',
  `username` varchar(20) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(70) NOT NULL COMMENT '管理员密码',
  `group_id` mediumint(8) DEFAULT NULL COMMENT '分组ID',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `mdemail` varchar(50) DEFAULT '0' COMMENT '传递修改密码参数加密',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '审核状态'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_admin`
--

INSERT INTO `cool_admin` (`admin_id`, `username`, `pwd`, `group_id`, `email`, `realname`, `tel`, `ip`, `add_time`, `mdemail`, `is_open`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 1, '1109305987@qq.com', '', '18792402229', '127.0.0.1', 1482132862, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `cool_ad_type`
--

CREATE TABLE IF NOT EXISTS `cool_ad_type` (
  `type_id` tinyint(5) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `sort` int(11) NOT NULL COMMENT '广告位排序'
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_ad_type`
--

INSERT INTO `cool_ad_type` (`type_id`, `name`, `sort`) VALUES
(1, '顶部轮播', 1),
(10, '【关于我们】我们合作的客户', 50);

-- --------------------------------------------------------

--
-- 表的结构 `cool_article`
--

CREATE TABLE IF NOT EXISTS `cool_article` (
  `id` int(11) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `copyfrom` varchar(255) NOT NULL DEFAULT 'CLTPHP',
  `fromlink` varchar(255) NOT NULL DEFAULT 'http://www.cltphp.com/'
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_auth_group`
--

CREATE TABLE IF NOT EXISTS `cool_auth_group` (
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '全新ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `rules` longtext COMMENT '规则',
  `addtime` int(11) NOT NULL COMMENT '添加时间'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_auth_group`
--

INSERT INTO `cool_auth_group` (`group_id`, `title`, `status`, `rules`, `addtime`) VALUES
(1, '超级管理员', 1, '0,1,2,270,15,16,119,120,121,145,17,149,116,117,118,181,151,18,108,114,112,109,110,111,3,5,126,128,127,4,230,232,129,189,190,193,192,240,239,241,243,244,245,242,246,7,9,14,234,13,235,236,237,238,27,29,161,163,164,162,38,167,182,169,166,28,48,247,248,31,32,249,250,251,45,170,171,175,174,173,46,176,183,179,178,265,196,197,202,198,252,253,254,255,256,203,205,204,257,206,207,212,208,213,258,259,260,261,262,209,215,214,263,210,217,216,264,211,266,267,269,', 1465114224),
(2, '管理员', 1, '1,15,16,120,146,40,41,7,8,12,139,11,136,154,137,138,135,25,140,141,142,9,13,157,158,159,160,155,14,156,27,29,37,161,163,164,162,38,167,182,168,169,165,166,35,36,39,28,31,32,33,34,44,45,170,171,172,173,174,175,46,176,183,177,178,179,48,49,', 1465114224),
(3, '商品管理员', 1, '27,29,37,161,163,164,162,38,167,182,168,169,165,166,', 1465114224);

-- --------------------------------------------------------

--
-- 表的结构 `cool_auth_rule`
--

CREATE TABLE IF NOT EXISTS `cool_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL,
  `href` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_auth_rule`
--

INSERT INTO `cool_auth_rule` (`id`, `href`, `title`, `type`, `status`, `authopen`, `icon`, `condition`, `pid`, `sort`, `addtime`, `zt`, `menustatus`) VALUES
(1, 'System', '系统设置', 1, 1, 0, 'icon-cogs', '', 0, 0, 1446535750, 1, 1),
(2, 'System/system', '系统设置', 1, 1, 0, '', '', 1, 1, 1446535789, 1, 1),
(3, 'Database/database', '数据库管理', 1, 1, 0, 'icon-database', '', 0, 2, 1446535805, 1, 1),
(4, 'Database/restore', '还原数据库', 1, 1, 0, '', '', 3, 10, 1446535750, 1, 1),
(5, 'Database/database', '数据库备份', 1, 1, 0, '', '', 3, 1, 1446535834, 1, 1),
(7, 'Category', '栏目管理', 1, 1, 0, 'icon-list', '', 0, 4, 1446535875, 1, 1),
(9, 'Category/index', '栏目列表', 1, 1, 0, '', '', 7, 0, 1446535750, 1, 1),
(13, 'Category/edit', '操作-修改', 1, 1, 0, '', '', 9, 3, 1446535750, 1, 0),
(14, 'Category/add', '操作-添加', 1, 1, 0, '', '', 9, 0, 1446535750, 1, 0),
(15, 'Auth/adminList', '权限管理', 1, 1, 0, 'icon-lifebuoy', '', 0, 1, 1446535750, 1, 1),
(16, 'Auth/adminList', '管理员列表', 1, 1, 0, '', '', 15, 0, 1446535750, 1, 1),
(17, 'Auth/adminGroup', '用户组列表', 1, 1, 0, '', '', 15, 1, 1446535750, 1, 1),
(18, 'Auth/adminRule', '权限管理', 1, 1, 0, '', '', 15, 2, 1446535750, 1, 1),
(23, 'Help/soft', '软件下载', 1, 1, 0, '', '', 22, 50, 1446711421, 0, 1),
(27, 'Users', '会员管理', 1, 1, 0, 'icon-user', '', 0, 5, 1447231507, 1, 1),
(28, 'Function', '网站功能', 1, 1, 0, 'icon-cog', '', 0, 6, 1447231590, 1, 1),
(29, 'Users/index', '会员列表', 1, 1, 0, '', '', 27, 10, 1447232085, 1, 1),
(31, 'Link/index', '友情链接', 1, 1, 0, '', '', 28, 2, 1447232183, 0, 1),
(32, 'Link/add', '操作-添加', 1, 1, 0, '', '', 31, 1, 1447639935, 0, 0),
(36, 'We/we_menu', '自定义菜单', 1, 1, 0, '', '', 35, 50, 1447842477, 0, 1),
(38, 'Users/userGroup', '会员组', 1, 1, 0, '', '', 27, 50, 1448413248, 1, 1),
(39, 'We/we_menu', '自定义菜单', 1, 1, 0, '', '', 36, 50, 1448501584, 0, 1),
(45, 'Ad/index', '广告管理', 1, 1, 0, '', '', 28, 3, 1450314297, 1, 1),
(46, 'Ad/type', '广告位管理', 1, 1, 0, '', '', 28, 4, 1450314324, 1, 1),
(48, 'Message/index', '留言管理', 1, 1, 0, '', '', 28, 1, 1451267354, 0, 1),
(105, 'System/runsys', '操作-保存', 1, 1, 0, '', '', 6, 50, 1461036331, 1, 0),
(106, 'System/runwesys', '操作-保存', 1, 1, 0, '', '', 10, 50, 1461037680, 0, 0),
(107, 'System/runemail', '操作-保存', 1, 1, 0, '', '', 19, 50, 1461039346, 1, 0),
(108, 'Auth/ruleAdd', '操作-添加', 1, 1, 0, '', '', 18, 0, 1461550835, 1, 0),
(109, 'Auth/ruleState', '操作-状态', 1, 1, 0, '', '', 18, 5, 1461550949, 1, 0),
(110, 'Auth/ruleTz', '操作-验证', 1, 1, 0, '', '', 18, 6, 1461551129, 1, 0),
(111, 'Auth/ruleorder', '操作-排序', 1, 1, 0, '', '', 18, 7, 1461551263, 1, 0),
(112, 'Auth/ruleDel', '操作-删除', 1, 1, 0, '', '', 18, 4, 1461551536, 1, 0),
(114, 'Auth/ruleEdit', '操作-修改', 1, 1, 0, '', '', 18, 2, 1461551913, 1, 0),
(116, 'Auth/groupEdit', '操作-修改', 1, 1, 0, '', '', 17, 3, 1461552326, 1, 0),
(117, 'Auth/groupDel', '操作-删除', 1, 1, 0, '', '', 17, 30, 1461552349, 1, 0),
(118, 'Auth/groupAccess', '操作-权限', 1, 1, 0, '', '', 17, 40, 1461552404, 1, 0),
(119, 'Auth/adminAdd', '操作-添加', 1, 1, 0, '', '', 16, 0, 1461553162, 1, 0),
(120, 'Auth/adminEdit', '操作-修改', 1, 1, 0, '', '', 16, 2, 1461554130, 1, 0),
(121, 'Auth/adminDel', '操作-删除', 1, 1, 0, '', '', 16, 4, 1461554152, 1, 0),
(122, 'System/source_runadd', '操作-添加', 1, 1, 0, '', '', 43, 10, 1461036331, 1, 0),
(123, 'System/source_order', '操作-排序', 1, 1, 0, '', '', 43, 50, 1461037680, 1, 0),
(124, 'System/source_runedit', '操作-改存', 1, 1, 0, '', '', 43, 30, 1461039346, 1, 0),
(125, 'System/source_del', '操作-删除', 1, 1, 0, '', '', 43, 40, 146103934, 1, 0),
(126, 'Database/export', '操作-备份', 1, 1, 0, '', '', 5, 1, 1461550835, 1, 0),
(127, 'Database/optimize', '操作-优化', 1, 1, 0, '', '', 5, 1, 1461550835, 1, 0),
(128, 'Database/repair', '操作-修复', 1, 1, 0, '', '', 5, 1, 1461550835, 1, 0),
(129, 'Database/delSqlFiles', '操作-删除', 1, 1, 0, '', '', 4, 3, 1461550835, 1, 0),
(130, 'System/bxgs_state', '操作-状态', 1, 1, 0, '', '', 67, 5, 1461550835, 1, 0),
(131, 'System/bxgs_edit', '操作-修改', 1, 1, 0, '', '', 67, 1, 1461550835, 1, 0),
(132, 'System/bxgs_runedit', '操作-改存', 1, 1, 0, '', '', 67, 2, 1461550835, 1, 0),
(134, 'System/myinfo_runedit', '个人资料修改', 1, 1, 0, '', '', 68, 1, 1461550835, 1, 0),
(236, 'Category/del', '操作-删除', 1, 1, 0, '', '', 9, 5, 1497424900, 0, 0),
(230, 'Database/restoreData', '操作-还原', 1, 1, 0, '', '', 4, 1, 1497423595, 0, 0),
(145, 'Auth/adminState', '操作-状态', 1, 1, 0, '', '', 16, 5, 1461550835, 1, 0),
(149, 'Auth/groupAdd', '操作-添加', 1, 1, 0, '', '', 17, 1, 1461550835, 1, 0),
(151, 'Auth/groupRunaccess', '操作-权存', 1, 1, 0, '', '', 17, 50, 1461550835, 1, 0),
(153, 'System/bxgs_runadd', '操作-添存', 1, 1, 0, '', '', 66, 1, 1461550835, 1, 0),
(234, 'Category/insert', '操作-添存', 1, 1, 0, '', '', 9, 2, 1497424143, 0, 0),
(240, 'Module/del', '操作-删除', 1, 1, 0, '', '', 190, 4, 1497425850, 0, 0),
(239, 'Module/moduleState', '操作-状态', 1, 1, 0, '', '', 190, 5, 1497425764, 0, 0),
(238, 'page/edit', '单页编辑', 1, 1, 0, '', '', 7, 2, 1497425142, 0, 0),
(237, 'Category/cOrder', '操作-排序', 1, 1, 0, '', '', 9, 6, 1497424979, 0, 0),
(161, 'Users/usersState', '操作-状态', 1, 1, 0, '', '', 29, 1, 1461550835, 1, 0),
(162, 'Users/delall', '操作-全部删除', 1, 1, 0, '', '', 29, 4, 1461550835, 1, 0),
(163, 'Users/edit', '操作-编辑', 1, 1, 0, '', '', 29, 2, 1461550835, 1, 0),
(164, 'Users/usersDel', '操作-删除', 1, 1, 0, '', '', 29, 3, 1461550835, 1, 0),
(247, 'Message/del', '操作-删除', 1, 1, 0, '', '', 48, 1, 1497427449, 0, 0),
(166, 'Users/groupOrder', '操作-排序', 1, 1, 0, '', '', 38, 50, 1461550835, 1, 0),
(167, 'Users/groupAdd', '操作-添加', 1, 1, 0, '', '', 38, 10, 1461550835, 1, 0),
(169, 'Users/groupDel', '操作-删除', 1, 1, 0, '', '', 38, 30, 1461550835, 1, 0),
(170, 'Ad/add', '操作-添加', 1, 1, 0, '', '', 45, 1, 1461550835, 1, 0),
(171, 'Ad/edit', '操作-修改', 1, 1, 0, '', '', 45, 2, 1461550835, 1, 0),
(173, 'Ad/del', '操作-删除', 1, 1, 0, '', '', 45, 5, 1461550835, 1, 0),
(174, 'Ad/adOrder', '操作-排序', 1, 1, 0, '', '', 45, 4, 1461550835, 1, 0),
(175, 'Ad/editState', '操作-状态', 1, 1, 0, '', '', 45, 3, 1461550835, 1, 0),
(176, 'Ad/addType', '操作-添加', 1, 1, 0, '', '', 46, 1, 1461550835, 1, 0),
(252, 'Template/edit', '操作-编辑', 1, 1, 0, '', '', 197, 3, 1497428906, 0, 0),
(178, 'Ad/delType', '操作-删除', 1, 1, 0, '', '', 46, 4, 1461550835, 1, 0),
(179, 'Ad/typeOrder', '操作-排序', 1, 1, 0, '', '', 46, 3, 1461550835, 1, 0),
(180, 'System/source_edit', '操作-修改', 1, 1, 0, '', '', 43, 20, 1461832933, 1, 0),
(181, 'Auth/groupState', '操作-状态', 1, 1, 0, '', '', 17, 50, 1461834340, 1, 0),
(182, 'Users/groupEdit', '操作-修改', 1, 1, 0, '', '', 38, 15, 1461834780, 1, 0),
(183, 'Ad/editType', '操作-修改', 1, 1, 0, '', '', 46, 2, 1461834988, 1, 0),
(188, 'Plug/donation', '捐赠列表', 1, 1, 0, '', '', 187, 50, 1466563673, 0, 1),
(189, 'Module', '模型管理', 1, 1, 0, 'icon-ungroup', '', 0, 3, 1466825363, 0, 1),
(190, 'Module/index', '模型列表', 1, 1, 0, '', '', 189, 1, 1466826681, 0, 1),
(192, 'Module/edit', '操作-修改', 1, 1, 0, '', '', 190, 2, 1467007920, 0, 0),
(193, 'Module/add', '操作-添加', 1, 1, 0, '', '', 190, 1, 1467007955, 0, 0),
(196, 'Template', '模版管理', 1, 1, 0, 'icon-embed2', '', 0, 7, 1481857304, 0, 1),
(197, 'Template/index', '模版管理', 1, 1, 0, '', '', 196, 1, 1481857540, 0, 1),
(198, 'Template/insert', '操作-添存', 1, 1, 0, '', '', 197, 2, 1481857587, 0, 0),
(202, 'Template/add', '操作-添加', 1, 1, 0, '', '', 197, 1, 1481859447, 0, 0),
(203, 'Debris/index', '碎片管理', 1, 1, 0, '', '', 196, 2, 1484797759, 0, 1),
(204, 'Debris/edit', '操作-编辑', 1, 1, 0, '', '', 203, 2, 1484797849, 0, 0),
(205, 'Debris/add', '操作-添加', 1, 1, 0, '', '', 203, 1, 1484797878, 0, 0),
(206, 'Wechat', '微信管理', 1, 1, 0, 'icon-bubbles2', '', 0, 8, 1487063570, 0, 1),
(207, 'Wechat/index', '公众号管理', 1, 1, 0, '', '', 206, 1, 1487063705, 0, 1),
(208, 'Wechat/menu', '菜单管理', 1, 1, 0, '', '', 206, 2, 1487063765, 0, 1),
(209, 'Wechat/text', '文本回复', 1, 1, 0, '', '', 206, 3, 1487063834, 0, 1),
(210, 'Wechat/img', '图文回复', 1, 1, 0, '', '', 206, 4, 1487063858, 0, 1),
(211, 'Wechat/news', '消息推送', 1, 1, 0, '', '', 206, 5, 1487063934, 0, 0),
(212, 'Wechat/weixin', '操作-设置', 1, 1, 0, '', '', 207, 1, 1487064541, 0, 0),
(213, 'Wechat/addMenu', '操作-添加', 1, 1, 0, '', '', 208, 1, 1487149151, 0, 0),
(214, 'Wechat/editText', '操作-编辑', 1, 1, 0, '', '', 209, 2, 1487233984, 0, 0),
(215, 'Wechat/addText', '操作-添加', 1, 1, 0, '', '', 209, 1, 1487234062, 0, 0),
(216, 'Wechat/editImg', '操作-编辑', 1, 1, 0, '', '', 210, 2, 1487318148, 0, 0),
(217, 'Wechat/addImg', '操作-添加', 1, 1, 0, '', '', 210, 1, 1487318175, 0, 0),
(232, 'Database/downFile', '操作-下载', 1, 1, 0, '', '', 4, 2, 1497423744, 0, 0),
(235, 'Category/catUpdate', '操作-该存', 1, 1, 0, '', '', 9, 4, 1497424301, 0, 0),
(241, 'Module/field', '模型字段', 1, 1, 0, '', '', 190, 6, 1497425972, 0, 0),
(242, 'Module/fieldStatus', '操作-状态', 1, 1, 0, '', '', 241, 4, 1497426044, 0, 0),
(243, 'Module/fieldAdd', '操作-添加', 1, 1, 0, '', '', 241, 1, 1497426089, 0, 0),
(244, 'Module/fieldEdit', '操作-修改', 1, 1, 0, '', '', 241, 2, 1497426134, 0, 0),
(245, 'Module/listOrder', '操作-排序', 1, 1, 0, '', '', 241, 3, 1497426179, 0, 0),
(246, 'Module/fieldDel', '操作-删除', 1, 1, 0, '', '', 241, 5, 1497426241, 0, 0),
(248, 'Message/delall', '操作-删除全部', 1, 1, 0, '', '', 48, 2, 1497427534, 0, 0),
(249, 'Link/edit', '操作-编辑', 1, 1, 0, '', '', 31, 2, 1497427694, 0, 0),
(250, 'Link/linkState', '操作-状态', 1, 1, 0, '', '', 31, 3, 1497427734, 0, 0),
(251, 'Link/del', '操作-删除', 1, 1, 0, '', '', 31, 4, 1497427780, 0, 0),
(253, 'Template/update', '操作-改存', 1, 1, 0, '', '', 197, 4, 1497428951, 0, 0),
(254, 'Template/delete', '操作-删除', 1, 1, 0, '', '', 197, 5, 1497429018, 0, 0),
(255, 'Template/images', '媒体文件管理', 1, 1, 0, '', '', 197, 6, 1497429157, 0, 0),
(256, 'Template/imgDel', '操作-文件删除', 1, 1, 0, '', '', 255, 1, 1497429217, 0, 0),
(257, 'Debris/del', '操作-删除', 1, 1, 0, '', '', 203, 3, 1497429416, 0, 0),
(258, 'Wechat/editMenu', '操作-编辑', 1, 1, 0, '', '', 208, 2, 1497429671, 0, 0),
(259, 'Wechat/menuOrder', '操作-排序', 1, 1, 0, '', '', 208, 3, 1497429707, 0, 0),
(260, 'Wechat/menuState', '操作-状态', 1, 1, 0, '', '', 208, 4, 1497429764, 0, 0),
(261, 'Wechat/delMenu', '操作-删除', 1, 1, 0, '', '', 208, 5, 1497429822, 0, 0),
(262, 'Wechat/createMenu', '操作-生成菜单', 1, 1, 0, '', '', 208, 6, 1497429886, 0, 0),
(263, 'Wechat/delText', '操作-删除', 1, 1, 0, '', '', 209, 3, 1497430020, 0, 0),
(264, 'Wechat/delImg', '操作-删除', 1, 1, 0, '', '', 210, 3, 1497430159, 0, 0),
(265, 'Donation/index', '捐赠管理', 1, 1, 0, '', '', 28, 5, 1498101716, 0, 1),
(266, 'Wechat/news', '多图文回复', 1, 1, 0, '', '', 206, 7, 1501221710, 0, 0),
(267, 'Plugin/index', '插件管理', 1, 1, 1, 'icon-power-cord', '', 0, 8, 1501466560, 0, 1),
(269, 'Plugin/login', '登录插件', 1, 1, 1, '', '', 267, 1, 1501466732, 0, 1),
(270, 'System/email', '邮箱配置', 1, 1, 0, '', '', 1, 2, 1502331829, 0, 1),
(272, 'Debris/type', '碎片分类', 1, 1, 1, '', '', 196, 3, 1504082720, NULL, 1),
(273, 'Plugin/wdj', '微点金插件', 1, 1, 1, '', '', 267, 50, 1506780753, NULL, 1),
(274, 'Article', '内容管理', 1, 1, 1, 'icon-file-text2', '', 0, 4, 1510670765, NULL, 1),
(275, 'Article/add', '添加内容', 1, 1, 1, '', '', 274, 50, 1510671169, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cool_blog`
--

CREATE TABLE IF NOT EXISTS `cool_blog` (
  `id` int(11) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `zuozhe` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_blog`
--

INSERT INTO `cool_blog` (`id`, `catid`, `userid`, `username`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `posid`, `status`, `recommend`, `readgroup`, `readpoint`, `listorder`, `hits`, `createtime`, `updatetime`, `zuozhe`) VALUES
(1, 17, 1, 'admin', '哈尔滨网站建设就找酷创网络，我们成立啦', 'color:;font-weight:normal;', '/uploads/20170925/f39794cf296196e2ae1a4d4386cb2dee.jpg', '享受着小事情', '享受着小事情', '<p>&nbsp; &nbsp; 2017年9月28日，哈尔滨酷创网络科技有限公司成立了。我们是一家以技术服务为主，创新型的互联网公司。具有多年网络服务经验，拥有自主研发团队，专业的设计师团队。成功为多家企业进行网站建设，网络宣传等相关服务，得到客户的好评与信任，是一家信誉最好的网络公司。</p><p>&nbsp; &nbsp; 凭借这对互联网行业的热爱与执着，丰富的项目执行经验，与我们的客户在激烈的市场竞争中互促共生，以“为客户赢得客户”为己任。为企业搭建互联网平台，开展网络营销新渠道。</p><p>&nbsp; &nbsp; 致力于提供高端网站建设、手机网站制作、网页设计、网站优化、微信开发、淘宝装修、平面设计、视频制作等一系列专业服务。多元化产品，全方位服务。</p><p>&nbsp; &nbsp; 酷创网络珍视与客户的每一次合作，用心服务，回馈客户给予我们的信任。用我们的激情与努力，智慧与勤奋将商业与技术完美结合，让我们的客户获得更有效的竞争力。全心全意做服务，一点一滴为客户。</p><p>&nbsp; &nbsp; 我们是谁？我们叫酷创网络，很高兴认识你。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 0, 1, 1506304628, 1511771536, '小欣欣'),
(2, 17, 1, 'admin', '网站制作费用报价差距大是为什么', 'color:;font-weight:normal;', '/uploads/20170925/fd1b9a13408554d8087847b6cc2c0d80.jpg', '享受着小事情', '享受着小事情', '<p>&nbsp; &nbsp; 当客户想做网站之前，可能会询问很多家网站制作公司。这些网络公司给出的报价高低不一，原因在哪里？</p><p>&nbsp; &nbsp; 从事互联网行业三年多了，从实习生到全栈设计师，通过学习与努力，在这个行业已经是很熟悉了。就让我帮您分析下，网站建设费用高低不一的差距是什么？</p><p>从整体分析：</p><p>第一点：网站制作具体要求传达不明确，各公司理解不同</p><p>&nbsp; &nbsp; 做网站之前客户自己要有一个明确的想法，配合甲方一起完成网站的规划，不能任由甲方去发挥，导致对成品的不满意，延误工期。要说明功能的细节，拿会员功能举例子，这个功能简单起来可能就是登陆注册，复杂起来可就多了，会员积分、优惠券、收藏、支付、订单等等，这些都是依托会员功能进行开发的，每个公司的理解不一样，开发等级定位不同，价格就会有差距。当您想做网站的时候，一定要有个详细的方案，再去跟互联网公司沟通，效果会更好一些。</p><p>第二点：选择网站模板还是网站订制</p><p>&nbsp; &nbsp; 网站模板的价格非常低廉的，以前的公司管这种叫“基础站”，是最便宜的产品。就是选个还可以的版，放上自己公司的logo、产品、信息就可以了。因为是模板，很多人都用，重复率高。客户想按自己的想法去更改些布局什么是不可以的。我们会建议客户去做定制网站。订制网站是依照客户的行业和需求，制定专属网页风格和功能，突出企业竞争优势。</p><p>第三点：</p><p>&nbsp; &nbsp; 好的网站设计是会让用户眼前一亮的，再加上好的布局和用户体验，能快速获取有用信息。价格低的网站是不会花费太多时间去精心设计的，没有特色，突出不了企业优势，很难留住用户。</p><p>第四点：网站编程</p><p>&nbsp; &nbsp; 好的编程会让网站打开速度快、运行流畅、功能完善、安全性高。坏的程序会导致网站打不开，还会遭到病毒和黑客的攻击，修复难度大。</p><p>第五点：网站要求高，报价自然高</p><p>&nbsp; &nbsp; 带网站优化的营销型网站比普通网站高，美观度要求高，功能较多较复杂的价格上都会偏高，因为所需的技术更难，花费的时间更多。</p><p>第六点：承载网站的空间档次不同</p><p>&nbsp; &nbsp; 小网站用虚拟主机，信息量大、访问人多的云主机或服务器。不同的配置，内存、空间、带宽等等决定了空间的大小，访问的快慢，价格不一，几百到几万，按网站需求进行选择。</p><p>第七点：网站制作人员技术高低</p><p>&nbsp; &nbsp; 制作人员水平高，经验丰富，工资自然高，重点是制作有保障。报价低的公司，制作人员技术不行，难免会出现漏洞，达不到预期。</p><p>第八点：售后服务</p><p>&nbsp; &nbsp; 售后服务好的公司，价格高些，出现问题，都会及时处理，不会置之不理。收费低的，觉的收钱少，出现问题，不想麻烦，问题就被搁置了。</p><p>&nbsp; &nbsp; 在这里告诉大家，要选择专业的网络服务公司，一分钱一分货，不要贪小便宜吃大亏，一次做成是最好的，好的网站会陪伴公司走的更好、更远，为长远的利益打算。哈尔滨酷创网络将商业与技术完美结合，让我们的客户获得更有效的竞争力。全心全意做服务，一点一滴为客户。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 0, 6, 1506306588, 1511771682, '小欣欣'),
(3, 17, 1, 'admin', '模板网站的好处与坏处', 'color:;font-weight:normal;', '/uploads/20170925/970273caa7d805deacc1d5ab4878f63e.jpg', '享受着小事情', '享受着小事情', '<p>&nbsp; &nbsp; 现在网络上有自助建站平台，网络公司也会跟用户推荐模板网站。板式多，开发时间短、价格低，得到一些小企业和个体户的青睐，几百到几千就能得到一个完整的企业站。</p><p>&nbsp; &nbsp; 有利必有弊，模板建站的坏处有以下几点。</p><p>&nbsp; &nbsp; 首先，不能更改网站布局，修改代码。只能把已有模块里的信息换成自己的，比如logo、图片、产品等。因为很多网站都用一个模板，代码都是相似的，不利于网站优化和搜索引擎的抓取。</p><p>&nbsp; &nbsp; 第二，通过自助平台建立网站，与很多网站公用空间服务器，访问速度和服务器稳定得不到保障。</p><p>&nbsp; &nbsp; 不能进行二次开发，满足不了网站订制的需求，就需要再做一个网站了。</p><p><br/></p>', '0', 2, 1, 1, '', 0, 0, 8, 1506306616, 1511771637, '小欣欣'),
(4, 18, 1, 'admin', '享受着小事情', 'color:;font-weight:normal;', '/uploads/20170925/df0ed3dbb02d8784e8136eddd1b8015c.jpg', '享受着小事情', '享受着小事情', '<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;哈尔滨酷创网络科技有限公司，成立于2016年。是一家专业从事网站建设，网络宣传，微营销，大项目定制的电子商务公司。团队成员具有丰富的设计和开发水平，我们将商业与技术完美结合，可以让我们的客户可以在飞速发展的信息科技领域中获得更有效的竞争力。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;致力于提供高端网站建设、淘宝装修、SEO优化、微营销、互动创意设计、UI设计、APP开发、VI设计、FLASH网站、视频制作等一系列专业服务。用我们的激情和智慧，勤奋与努力，帮助中小企业开展网站建设，打开互联网营销局面，深刻影响着品牌视觉的经营模式和营销思路。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;酷创网络拥有多年网络服务经验，拥有实力雄厚的技术研发团队，顶级设计师团队。成功服务过数家知名集团企业、品牌客户，凭借对设计的热爱执着，营销趋势的敏锐洞察和深刻理解，与众多客户在蓬勃的市场经济中互促共生。全心全意做服务一点一滴为客户。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;酷创网络珍视与客户的每次合作，用心服务，让客户听到我们的声音，以“为客户赢得客户”为己任，用我们的激情和智慧，勤奋与努力，帮助中小企业开展网站建设，打开互联网营销局面，深刻影响着品牌视觉的经营模式和营销思路。始终信奉“全力以赴，互促共生”的公司价值观。</p>', '0', 2, 1, 0, '', 0, 0, 38, 1506307617, 1506478571, '小欣欣');

-- --------------------------------------------------------

--
-- 表的结构 `cool_case`
--

CREATE TABLE IF NOT EXISTS `cool_case` (
  `id` int(11) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `kehu` varchar(255) DEFAULT '',
  `jishu` varchar(255) DEFAULT '',
  `bannerzutu` mediumtext,
  `zutu` mediumtext
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_case`
--

INSERT INTO `cool_case` (`id`, `catid`, `userid`, `username`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `posid`, `status`, `recommend`, `readgroup`, `readpoint`, `listorder`, `hits`, `createtime`, `updatetime`, `kehu`, `jishu`, `bannerzutu`, `zutu`) VALUES
(17, 23, 1, 'admin', '潘世家', 'color:;font-weight:normal;', '/uploads/20171013/682d82951c177f7b6e16e6d86beb4569.jpg', '', '', '', '0', 0, 1, 0, '', 0, 7, 7, 1507857999, 0, '哈尔滨潘世家食品有限公司', 'HTML5,CSS,Photoshop', '/uploads/20171013/17080517df5d99fbb98a2f4bb9d57fe7.jpg;', ''),
(18, 23, 1, 'admin', '龙飞模具', 'color:;font-weight:normal;', '/uploads/20171013/33bf6de64a6a8f85b098732c7ce31657.jpg', '', '', '', '0', 0, 1, 0, '', 0, 8, 7, 1507858236, 0, '哈尔滨龙飞模具制造有限公司', 'HTML5,CSS,Photoshop', '/uploads/20171013/66d8118765705a3346533d5319ea809e.jpg;', ''),
(14, 23, 1, 'admin', '北方艺考', 'color:;font-weight:normal;', '/uploads/20171013/707e481ab5fd08f67a2ff8bf5b37c00f.jpg', '', '', '', '0', 0, 1, 0, '', 0, 4, 5, 1507857421, 0, '哈尔滨北方文化艺术学校', 'HTML5,CSS,Photoshop', '', ''),
(15, 23, 1, 'admin', '晓峰律师', 'color:;font-weight:normal;', '/uploads/20171013/d7ea6c1e3964774415a418c333a991ce.jpg', '', '', '', '0', 0, 1, 0, '', 0, 5, 7, 1507857582, 1507857767, '黑龙江晓峰律师事务所', 'HTML5,CSS,Photoshop', '/uploads/20171013/f604011d9881ea5386a25d36be3ab423.jpg;', ''),
(16, 23, 1, 'admin', '汇众家', 'color:;font-weight:normal;', '/uploads/20171013/8467506b010aba583add58f3098ecd05.jpg', '', '', '', '0', 0, 1, 0, '', 0, 6, 6, 1507857798, 0, '哈尔滨汇众家具装饰公司', 'HTML5,CSS,Photoshop', '/uploads/20171013/4b576a6a982319b5e538cb47214e20ce.jpg;', ''),
(11, 23, 1, 'admin', '阿蒙木业', 'color:;font-weight:normal;', '/uploads/20171013/37193b56a5bfdeee981c9428a807de3e.jpg', '', '', '', '0', 0, 1, 0, '', 0, 1, 14, 1507856305, 1507856617, '哈尔滨阿蒙木业股份有限公司', 'HTML5,CSS,Photoshop', '/uploads/20171013/abb7d2958864813c84156ce0de87d2e1.jpg;', ''),
(12, 23, 1, 'admin', '汤火功夫', 'color:;font-weight:normal;', '/uploads/20171013/d4c5c441cfacbebca816819259734660.jpg', '', '', '', '0', 0, 1, 0, '', 0, 2, 11, 1507856783, 0, '哈尔滨腾飞龙餐饮管理有限公司', 'HTML5,CSS,Photoshop', '/uploads/20171013/99c932becb54824129cc1e6c96d2114e.jpg;', ''),
(13, 23, 1, 'admin', '瑞霞砂锅', 'color:;font-weight:normal;', '/uploads/20171013/1687abd71cb4a9436439fa8db73c2a0d.jpg', '', '', '', '0', 0, 1, 0, '', 0, 3, 8, 1507857020, 0, '哈尔滨瑞霞老砂锅居', 'HTML5,CSS,Photoshop', '/uploads/20171013/118f3bf721dafe88b2224c5c3e46db8e.jpg;/uploads/20171013/fea7ec80751e7baf7234d174f20008d8.jpg;', '');

-- --------------------------------------------------------

--
-- 表的结构 `cool_category`
--

CREATE TABLE IF NOT EXISTS `cool_category` (
  `id` smallint(5) unsigned NOT NULL,
  `catname` varchar(255) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `parentdir` varchar(50) NOT NULL DEFAULT '',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `module` char(24) NOT NULL DEFAULT '',
  `arrparentid` varchar(100) NOT NULL DEFAULT '',
  `arrchildid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `template_list` varchar(20) NOT NULL DEFAULT '',
  `template_show` varchar(20) NOT NULL DEFAULT '',
  `pagesize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `listtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_category`
--

INSERT INTO `cool_category` (`id`, `catname`, `catdir`, `parentdir`, `parentid`, `moduleid`, `module`, `arrparentid`, `arrchildid`, `type`, `title`, `keywords`, `description`, `listorder`, `ishtml`, `ismenu`, `hits`, `image`, `child`, `url`, `template_list`, `template_show`, `pagesize`, `readgroup`, `listtype`, `lang`) VALUES
(2, '关于我们', 'about', '', 0, 1, 'page', '0', '2', 0, '关于我们', '关于我们', '关于我们', 1, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(16, '联系我们', 'contact', '', 0, 1, 'page', '0', '16', 0, '联系我们', '联系我们', '联系我们', 6, 0, 1, 0, '', 0, '', 'page_show_contace', 'page_show_contace', 0, '', 0, 0),
(9, '产品中心  ', 'products', '', 0, 4, 'product', '0', '9', 0, '产品中心  ', '产品中心  ', '产品中心  ', 2, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(10, '项目展示', 'case', '', 0, 10, 'case', '0', '10,23,27,28,29', 0, '项目展示', '项目展示', '项目展示', 3, 0, 1, 0, '', 0, '', 'case_list', 'case_show', 8, '', 0, 0),
(14, '博客资讯', 'blog', '', 0, 9, 'blog', '0', '14,17,18,19,20,21', 0, '博客资讯', '博客资讯', '博客资讯', 5, 0, 1, 0, '', 1, '', '', '', 0, '', 0, 0),
(13, '服务中心', 'services', '', 0, 11, 'service', '0', '13,22,24,25,26', 0, '服务中心', '服务中心', '服务中心', 4, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(17, '公司新闻', 'blog', 'blog/', 14, 9, 'blog', '0,14', '17', 0, '公司新闻', '公司新闻', '公司新闻', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(18, '网络营销', 'blog', 'blog/', 14, 9, 'blog', '0,14', '18', 0, '网络营销', '网络营销', '网络营销', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(19, '网页设计', 'blog', 'blog/', 14, 9, 'blog', '0,14', '19', 0, '网页设计', '网页设计', '网页设计', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(20, 'web前端', 'blog', 'blog/', 14, 9, 'blog', '0,14', '20', 0, 'web前端', 'web前端', 'web前端', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(21, '微信运营', 'blog', 'blog/', 14, 9, 'blog', '0,14', '21', 0, '微信运营', '微信运营', '微信运营', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(22, '服务客户', 'service', 'services/', 13, 13, 'fuwukehu', '0,13', '22', 0, '', '', '', 0, 0, 0, 0, '', 0, '', '', '', 0, '', 0, 0),
(23, '网站建设', 'case', 'case/', 10, 10, 'case', '0,10', '23', 0, '网页设计', '网页设计', '网页设计', 0, 0, 1, 0, '', 0, '', 'case_list', 'case_show', 8, '', 0, 0),
(24, '平面设计', 'case', 'services/', 13, 11, 'service', '0,13', '24', 0, '平面设计', '平面设计', '平面设计', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(25, '店铺装修', 'case', 'services/', 13, 11, 'service', '0,13', '25', 0, '店铺装修', '店铺装修', '店铺装修', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(26, '微信平台', 'case', 'services/', 13, 11, 'service', '0,13', '26', 0, '微信平台', '微信平台', '微信平台', 0, 0, 1, 0, '', 0, '', '', '', 0, '', 0, 0),
(27, '平面设计', 'case', 'case/', 10, 10, 'case', '0,10', '27', 0, '平面设计', '平面设计', '平面设计', 0, 0, 1, 0, '', 0, '', '', '', 8, '', 0, 0),
(28, '店铺装修', 'case', 'case/', 10, 10, 'case', '0,10', '28', 0, '', '', '', 0, 0, 1, 0, '', 0, '', 'case_list', 'case_show', 8, '', 0, 0),
(29, '微信平台', 'case', 'case/', 10, 10, 'case', '0,10', '29', 0, '', '', '', 0, 0, 1, 0, '', 0, '', 'case_list', 'case_show', 8, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cool_config`
--

CREATE TABLE IF NOT EXISTS `cool_config` (
  `id` smallint(6) unsigned NOT NULL COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述'
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_config`
--

INSERT INTO `cool_config` (`id`, `name`, `value`, `inc_type`, `desc`) VALUES
(16, 'is_mark', '0', 'water', '0'),
(17, 'mark_txt', '', 'water', '0'),
(18, 'mark_img', '/public/upload/public/2017/01-20/10cd966bd5f3549833c09a5c9700a9b8.jpg', 'water', '0'),
(19, 'mark_width', '', 'water', '0'),
(20, 'mark_height', '', 'water', '0'),
(21, 'mark_degree', '54', 'water', '0'),
(22, 'mark_quality', '56', 'water', '0'),
(23, 'sel', '9', 'water', '0'),
(24, 'sms_url', 'https://yunpan.cn/OcRgiKWxZFmjSJ', 'sms', '0'),
(25, 'sms_user', '', 'sms', '0'),
(26, 'sms_pwd', '访问密码 080e', 'sms', '0'),
(27, 'regis_sms_enable', '1', 'sms', '0'),
(28, 'sms_time_out', '1200', 'sms', '0'),
(38, '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', '0'),
(39, '__hash__', '8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453', 'sms', '0'),
(56, 'sms_appkey', '123456789', 'sms', '0'),
(57, 'sms_secretKey', '123456789', 'sms', '0'),
(58, 'sms_product', 'CLTPHP', 'sms', '0'),
(59, 'sms_templateCode', 'SMS_101234567890', 'sms', '0'),
(60, 'smtp_server', 'smtp.qq.com', 'smtp', '0'),
(61, 'smtp_port', '25', 'smtp', '0'),
(62, 'smtp_user', '11sdfdf5987@qq.com', 'smtp', '0'),
(63, 'smtp_pwd', 'asdfsdfdfdsf', 'smtp', '0'),
(64, 'regis_smtp_enable', '1', 'smtp', '0'),
(65, 'test_eamil', '1109305987@qq.com', 'smtp', '0'),
(70, 'forget_pwd_sms_enable', '1', 'sms', '0'),
(71, 'bind_mobile_sms_enable', '1', 'sms', '0'),
(72, 'order_add_sms_enable', '1', 'sms', '0'),
(73, 'order_pay_sms_enable', '1', 'sms', '0'),
(74, 'order_shipping_sms_enable', '1', 'sms', '0'),
(88, 'email_id', 'CLTPHP', 'smtp', '0');

-- --------------------------------------------------------

--
-- 表的结构 `cool_debris`
--

CREATE TABLE IF NOT EXISTS `cool_debris` (
  `id` int(6) NOT NULL,
  `type_id` int(6) DEFAULT NULL,
  `title` varchar(120) DEFAULT NULL,
  `content` text,
  `addtime` int(13) DEFAULT NULL,
  `sort` int(11) DEFAULT '50'
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_debris`
--

INSERT INTO `cool_debris` (`id`, `type_id`, `title`, `content`, `addtime`, `sort`) VALUES
(21, 6, '我们致力于', '<p>致力于提供高端网站建设、淘宝装修、SEO优化、微营销、互动创意设计、UI设计、APP开发、VI设计、FLASH网站、视频制作等一系列专业服务。用我们的激情和智慧，勤奋与努力，帮助中小企业开展网站建设，打开互联网营销局面，深刻影响着品牌视觉的经营模式和营销思路。</p>', 1506156876, 50),
(22, 6, '我们的优势', '<p>酷创网络拥有多年网络服务经验，拥有实力雄厚的技术研发团队，顶级设计师团队。成功服务过数家知名集团企业、品牌客户，凭借对设计的热爱执着，营销趋势的敏锐洞察和深刻理解，与众多客户在蓬勃的市场经济中互促共生。全心全意做服务一点一滴为客户。</p>', 1506156989, 50),
(23, 6, '我们的愿景', '<p>酷创网络珍视与客户的每次合作，用心服务，让客户听到我们的声音，以“为客户赢得客户”为己任，用我们的激情和智慧，勤奋与努力，帮助中小企业开展网站建设，打开互联网营销局面，深刻影响着品牌视觉的经营模式和营销思路。始终信奉“全力以赴，互促共生”的公司价值观。</p>', 1506157011, 50),
(25, 7, '关于我们图片滚动1', '<p><img src="/public/static/home/images/story-img.jpg" title="1506172488667379.jpg" alt="story-img.jpg"/></p>', 1506160387, 50),
(26, 7, '关于我们图片滚动2', '<p><img src="/public/static/home/images/story-img-1.jpg" title="1506172869829351.jpg" alt="story-img-1.jpg"/></p>', 1506172871, 50),
(27, 7, '关于我们图片滚动3', '<p><img src="/public/static/home/images/story-img-2.jpg" title="1506172990742513.jpg" alt="story-img-2.jpg"/></p>', 1506172991, 50);

-- --------------------------------------------------------

--
-- 表的结构 `cool_debris_type`
--

CREATE TABLE IF NOT EXISTS `cool_debris_type` (
  `id` int(11) NOT NULL,
  `title` varchar(120) DEFAULT NULL,
  `sort` int(1) DEFAULT '50'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_debris_type`
--

INSERT INTO `cool_debris_type` (`id`, `title`, `sort`) VALUES
(1, '【首页】中部碎片', 1),
(6, '【关于我们】中部碎片', 50),
(7, '【关于我们】图片滚动', 50);

-- --------------------------------------------------------

--
-- 表的结构 `cool_donation`
--

CREATE TABLE IF NOT EXISTS `cool_donation` (
  `id` int(11) NOT NULL COMMENT '自增ID',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '用户名',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '捐赠金额',
  `addtime` varchar(15) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_donation`
--

INSERT INTO `cool_donation` (`id`, `name`, `money`, `addtime`) VALUES
(3, '高飞', '10.00', '1466566714'),
(4, '王磊', '5.50', '1466566733'),
(5, '一匹忧郁的狼', '11.11', '1466566780'),
(6, '神盾', '50.00', '1467517788'),
(7, '赵云的枪', '20.00', '1469582594'),
(8, '王@楠', '5.00', '1473155340'),
(9, '王宁', '10.00', '1473647377'),
(11, '幽鸣', '100.00', '1483080600'),
(12, '得水', '6.60', '1484874321'),
(13, '挨踢男', '50.00', '1485224098'),
(14, '郭强', '6.60', '1486343033'),
(15, '周超', '5.00', '1487570095'),
(16, '栖息地', '20.00', '1488507544'),
(17, '杨萍', '11.00', '1489368971'),
(18, '杨蹦蹦V587', '20.00', '1490608429'),
(19, '锋行天下', '20.00', '1499765536'),
(20, '周伟', '50.00', '1500014307'),
(21, '王者不荣耀', '20.00', '1500368368'),
(22, '老虎的虎', '5.00', '1500867256'),
(23, '老夫子', '20.00', '1501203253'),
(24, '我是传奇', '20.00', '1501567608'),
(25, '秋心', '10.00', '1501807989');

-- --------------------------------------------------------

--
-- 表的结构 `cool_field`
--

CREATE TABLE IF NOT EXISTS `cool_field` (
  `id` smallint(5) unsigned NOT NULL,
  `moduleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` mediumtext NOT NULL,
  `ispost` tinyint(1) NOT NULL DEFAULT '0',
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_field`
--

INSERT INTO `cool_field` (`id`, `moduleid`, `field`, `name`, `tips`, `required`, `minlength`, `maxlength`, `pattern`, `errormsg`, `class`, `type`, `setup`, `ispost`, `unpostgroup`, `listorder`, `status`, `issystem`) VALUES
(1, 1, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''1'',\n  ''style'' => ''1'',\n  ''size'' => ''55'',\n)', 1, '', 2, 1, 1),
(2, 1, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 8, 0, 0),
(3, 1, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 97, 1, 1),
(4, 1, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 99, 1, 1),
(5, 1, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 0, '', 98, 1, 1),
(6, 1, 'content', '内容', '', 1, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''UEditor'',\n)', 0, '', 3, 1, 0),
(7, 2, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1),
(8, 2, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''1'',\n  ''style'' => ''1'',\n  ''size'' => ''55'',\n)', 1, '', 2, 1, 1),
(9, 2, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  ''size'' => ''55'',\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 1, '', 3, 1, 1),
(10, 2, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  ''fieldtype'' => ''mediumtext'',\n  ''rows'' => ''4'',\n  ''cols'' => ''55'',\n  ''default'' => '''',\n)', 1, '', 4, 1, 1),
(11, 2, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''layedit'',\n)', 1, '', 5, 1, 1),
(12, 2, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 6, 1, 1),
(13, 2, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => '''',\n  ''default'' => '''',\n)', 1, '', 10, 0, 0),
(14, 2, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  ''size'' => ''5'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 11, 0, 0),
(15, 2, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 12, 1, 0),
(16, 2, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  ''inputtype'' => ''checkbox'',\n  ''fieldtype'' => ''tinyint'',\n  ''labelwidth'' => ''85'',\n  ''default'' => '''',\n)', 1, '', 13, 1, 1),
(17, 2, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 14, 1, 1),
(18, 2, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 15, 1, 1),
(19, 2, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 1, '', 7, 1, 1),
(20, 3, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1),
(21, 3, 'title', '标题', '', 1, 1, 80, 'defaul', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''0'',\n  ''style'' => ''0'',\n)', 1, '', 2, 1, 1),
(22, 3, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  ''size'' => ''55'',\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 1, '', 3, 1, 1),
(23, 3, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  ''fieldtype'' => ''mediumtext'',\n  ''rows'' => ''4'',\n  ''cols'' => ''55'',\n  ''default'' => '''',\n)', 1, '', 4, 1, 1),
(24, 3, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''layedit'',\n)', 1, '', 7, 1, 1),
(25, 3, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 8, 1, 1),
(26, 3, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => '''',\n  ''default'' => '''',\n)', 1, '', 10, 0, 0),
(27, 3, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  ''size'' => ''5'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 11, 0, 0),
(28, 3, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 12, 0, 0),
(29, 3, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  ''inputtype'' => ''checkbox'',\n  ''fieldtype'' => ''tinyint'',\n  ''labelwidth'' => ''85'',\n  ''default'' => '''',\n)', 1, '', 13, 0, 1),
(30, 3, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 14, 1, 1),
(31, 3, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 15, 1, 1),
(32, 3, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 1, '', 9, 1, 1),
(33, 3, 'pic', '图片', '', 1, 0, 0, 'defaul', '', 'pic', 'image', '', 0, '', 5, 1, 0),
(34, 3, 'group', '类型', '', 1, 0, 0, 'defaul', '', 'group', 'select', 'array (\n  ''options'' => ''模型管理|1\n分类管理|2\n内容管理|3'',\n  ''multiple'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n  ''numbertype'' => ''1'',\n  ''size'' => '''',\n  ''default'' => '''',\n)', 0, '', 6, 1, 0),
(35, 4, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1),
(36, 4, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''1'',\n  ''style'' => ''1'',\n  ''size'' => ''55'',\n)', 1, '', 2, 1, 1),
(37, 4, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  ''size'' => ''55'',\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 1, '', 3, 1, 1),
(38, 4, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  ''fieldtype'' => ''mediumtext'',\n  ''rows'' => ''4'',\n  ''cols'' => ''55'',\n  ''default'' => '''',\n)', 1, '', 4, 1, 1),
(39, 4, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''layedit'',\n)', 1, '', 8, 1, 1),
(40, 4, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 9, 1, 1),
(41, 4, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 1, '', 10, 1, 1),
(42, 4, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => '''',\n  ''default'' => '''',\n)', 1, '', 11, 0, 0),
(43, 4, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  ''size'' => ''5'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 12, 0, 0),
(44, 4, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 13, 0, 0),
(45, 4, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  ''inputtype'' => ''checkbox'',\n  ''fieldtype'' => ''tinyint'',\n  ''labelwidth'' => ''85'',\n  ''default'' => '''',\n)', 1, '', 14, 0, 1),
(46, 4, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 15, 1, 1),
(47, 4, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 16, 1, 1),
(48, 4, 'price', '价格', '', 1, 0, 0, 'defaul', '', 'price', 'number', 'array (\n  ''size'' => '''',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''2'',\n  ''default'' => ''0.00'',\n)', 0, '', 5, 1, 0),
(49, 4, 'xinghao', '型号', '', 0, 0, 0, 'defaul', '', '', 'text', 'array (\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 6, 1, 0),
(50, 4, 'pics', '图组', '', 0, 0, 0, 'defaul', '', 'pics', 'images', '', 0, '', 7, 1, 0),
(113, 11, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  ''fieldtype'' => ''mediumtext'',\n  ''rows'' => ''4'',\n  ''cols'' => ''55'',\n  ''default'' => '''',\n)', 1, '', 4, 1, 1),
(112, 11, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  ''size'' => ''55'',\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 1, '', 3, 1, 1),
(111, 11, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''1'',\n  ''style'' => ''1'',\n  ''size'' => ''55'',\n)', 1, '', 2, 1, 1),
(109, 10, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 13, 1, 1),
(110, 11, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1),
(108, 10, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 12, 1, 1),
(107, 10, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  ''inputtype'' => ''checkbox'',\n  ''fieldtype'' => ''tinyint'',\n  ''labelwidth'' => ''85'',\n  ''default'' => '''',\n)', 1, '', 11, 0, 1),
(106, 10, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 10, 0, 0),
(105, 10, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  ''size'' => ''5'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 9, 0, 0),
(104, 10, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => '''',\n  ''default'' => '''',\n)', 1, '', 8, 0, 0),
(103, 10, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 1, '', 7, 1, 1),
(102, 10, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 6, 1, 1),
(101, 10, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''UEditor'',\n)', 1, '', 5, 1, 1),
(155, 10, 'zutu', '项目组图', '', 0, 0, 0, 'defaul', '', 'zutu', 'images', '', 0, '', 7, 1, 0),
(97, 10, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1),
(98, 10, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''1'',\n  ''style'' => ''1'',\n  ''size'' => ''55'',\n)', 1, '', 2, 1, 1),
(99, 10, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  ''size'' => ''55'',\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 1, '', 3, 1, 1),
(100, 10, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  ''fieldtype'' => ''mediumtext'',\n  ''rows'' => ''4'',\n  ''cols'' => ''55'',\n  ''default'' => '''',\n)', 1, '', 4, 1, 1),
(114, 11, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''UEditor'',\n)', 1, '', 5, 1, 1),
(137, 13, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1),
(138, 13, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''1'',\n  ''style'' => ''1'',\n  ''size'' => ''55'',\n)', 1, '', 2, 1, 1),
(75, 2, 'copyfrom', '来源', '', 0, 0, 0, 'defaul', '', 'copyfrom', 'text', 'array (\n  ''default'' => ''CLTPHP'',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 8, 1, 0),
(76, 2, 'fromlink', '来源网址', '', 0, 0, 0, 'defaul', '', 'fromlink', 'text', 'array (\n  ''default'' => ''http://www.cltphp.com/'',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 9, 1, 0),
(115, 11, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 6, 1, 1),
(84, 9, 'catid', '栏目', '', 1, 1, 6, '', '必须选择一个栏目', '', 'catid', '', 1, '', 1, 1, 1),
(85, 9, 'title', '标题', '', 1, 1, 80, '', '标题必须为1-80个字符', '', 'title', 'array (\n  ''thumb'' => ''1'',\n  ''style'' => ''1'',\n  ''size'' => ''55'',\n)', 1, '', 2, 1, 1),
(86, 9, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  ''size'' => ''55'',\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 1, '', 3, 1, 1),
(87, 9, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  ''fieldtype'' => ''mediumtext'',\n  ''rows'' => ''4'',\n  ''cols'' => ''55'',\n  ''default'' => '''',\n)', 1, '', 4, 1, 1),
(88, 9, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''UEditor'',\n)', 1, '', 5, 1, 1),
(89, 9, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 6, 1, 1),
(90, 9, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 1, '', 7, 1, 1),
(91, 9, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => '''',\n  ''default'' => '''',\n)', 1, '', 8, 1, 0),
(92, 9, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  ''size'' => ''5'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 9, 0, 0),
(93, 9, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 10, 0, 0),
(94, 9, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  ''inputtype'' => ''checkbox'',\n  ''fieldtype'' => ''tinyint'',\n  ''labelwidth'' => ''85'',\n  ''default'' => '''',\n)', 1, '', 11, 0, 1),
(95, 9, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 12, 1, 1),
(96, 9, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 13, 1, 1),
(116, 11, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 1, '', 7, 1, 1),
(117, 11, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => '''',\n  ''default'' => '''',\n)', 1, '', 8, 0, 0),
(118, 11, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  ''size'' => ''5'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 9, 0, 0),
(119, 11, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 10, 0, 0),
(120, 11, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  ''inputtype'' => ''checkbox'',\n  ''fieldtype'' => ''tinyint'',\n  ''labelwidth'' => ''85'',\n  ''default'' => '''',\n)', 1, '', 11, 0, 1),
(121, 11, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 12, 1, 1),
(122, 11, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 13, 1, 1),
(136, 11, 'tubiao', '图标', '', 1, 0, 0, 'defaul', '', 'tubiao', 'text', 'array (\n  ''default'' => ''lnr-laptop-phone'',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 14, 1, 0),
(139, 13, 'keywords', '关键词', '', 0, 0, 80, '', '', '', 'text', 'array (\n  ''size'' => ''55'',\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 1, '', 3, 1, 1),
(140, 13, 'description', 'SEO简介', '', 0, 0, 0, '', '', '', 'textarea', 'array (\n  ''fieldtype'' => ''mediumtext'',\n  ''rows'' => ''4'',\n  ''cols'' => ''55'',\n  ''default'' => '''',\n)', 1, '', 4, 1, 1),
(141, 13, 'content', '内容', '', 0, 0, 0, 'defaul', '', 'content', 'editor', 'array (\n  ''edittype'' => ''UEditor'',\n)', 1, '', 5, 1, 1),
(152, 10, 'kehu', '客户', '', 0, 0, 0, 'defaul', '', 'kehu', 'text', 'array (\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 6, 1, 0),
(142, 13, 'createtime', '发布时间', '', 1, 0, 0, 'date', '', '', 'datetime', '', 1, '', 6, 1, 1),
(143, 13, 'status', '状态', '', 0, 0, 0, '', '', '', 'radio', 'array (\n  ''options'' => ''发布|1\r\n定时发布|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => ''75'',\n  ''default'' => ''1'',\n)', 1, '', 7, 1, 1),
(144, 13, 'recommend', '允许评论', '', 0, 0, 1, '', '', '', 'radio', 'array (\n  ''options'' => ''允许评论|1\r\n不允许评论|0'',\n  ''fieldtype'' => ''tinyint'',\n  ''numbertype'' => ''1'',\n  ''labelwidth'' => '''',\n  ''default'' => '''',\n)', 1, '', 8, 0, 0),
(145, 13, 'readpoint', '阅读收费', '', 0, 0, 5, '', '', '', 'number', 'array (\n  ''size'' => ''5'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 9, 0, 0),
(146, 13, 'hits', '点击次数', '', 0, 0, 8, '', '', '', 'number', 'array (\n  ''size'' => ''10'',\n  ''numbertype'' => ''1'',\n  ''decimaldigits'' => ''0'',\n  ''default'' => ''0'',\n)', 1, '', 10, 0, 0),
(147, 13, 'readgroup', '访问权限', '', 0, 0, 0, '', '', '', 'groupid', 'array (\n  ''inputtype'' => ''checkbox'',\n  ''fieldtype'' => ''tinyint'',\n  ''labelwidth'' => ''85'',\n  ''default'' => '''',\n)', 1, '', 11, 0, 1),
(148, 13, 'posid', '推荐位', '', 0, 0, 0, '', '', '', 'posid', '', 1, '', 12, 1, 1),
(149, 13, 'template', '模板', '', 0, 0, 0, '', '', '', 'template', '', 1, '', 13, 1, 1),
(150, 13, 'zhiwei', '职位', '', 1, 0, 0, 'defaul', '', 'zhiwei', 'text', 'array (\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 2, 1, 0),
(151, 13, 'xingming', '姓名', '', 1, 0, 0, 'defaul', '', 'xingming', 'text', 'array (\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 2, 1, 0),
(153, 10, 'jishu', '技术', '', 0, 0, 0, 'defaul', '', 'jishu', 'text', 'array (\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 6, 1, 0),
(154, 10, 'bannerzutu', 'banner大图', '', 0, 0, 0, 'defaul', '', 'bannerzutu', 'images', '', 0, '', 2, 1, 0),
(156, 9, 'zuozhe', '作者', '', 1, 0, 0, 'defaul', '', 'zuozhe', 'text', 'array (\n  ''default'' => '''',\n  ''ispassword'' => ''0'',\n  ''fieldtype'' => ''varchar'',\n)', 0, '', 2, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cool_fuwukehu`
--

CREATE TABLE IF NOT EXISTS `cool_fuwukehu` (
  `id` int(11) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `zhiwei` varchar(255) NOT NULL DEFAULT '',
  `xingming` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_fuwukehu`
--

INSERT INTO `cool_fuwukehu` (`id`, `catid`, `userid`, `username`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `posid`, `status`, `recommend`, `readgroup`, `readpoint`, `listorder`, `hits`, `createtime`, `updatetime`, `zhiwei`, `xingming`) VALUES
(2, 22, 1, 'admin', '哈尔滨工业大学实业技术培训中心', 'color:;font-weight:normal;', '/uploads/20171010/9ae948c559d80abfb13178e2b9c9ddcd.jpg', '', '', '<p>感谢酷创网络为我们设计了一个具有创造力的网站，酷创网络的设计员工，很有激情，很有礼貌，服务很好，网络推广方面也给了我们很大的帮助！</p>', '0', 0, 1, 0, '', 0, 0, 0, 1506390103, 1507619550, '校长', '蒋志文'),
(3, 22, 1, 'admin', '哈尔滨腾飞龙餐饮管理有限公司', 'color:;font-weight:normal;', '/uploads/20171010/bc1ba450baeee360bbd4c4277ee49544.jpg', '', '', '<p>我们餐饮行业竞争大，设计作品的视觉冲击力要求极强。酷创网络在给我们设计网站的时候，在很多细节上下了很大功夫，包括给我们培训操作，图片处理的大小。非常感谢酷创网络给我们做出如此“高大尚”的网站。</p>', '0', 0, 1, 0, '', 0, 0, 0, 1506390142, 1507619334, '总经理', '吴总'),
(4, 22, 1, 'admin', '哈尔滨平安融e贷', 'color:;font-weight:normal;', '/uploads/20170926/e1c04bf840c2515317dc4ed860a9a574.jpg', '', '', '<p style="white-space: normal;">很幸运我们能够和酷创网络合作，让他们来提供程序开发，网站建设，网站推广等服务，对他们的服务感到非常满意！酷创网络是值得信赖的网络技术专业公司，祝愿他们加速发展！</p><p><br/></p>', '0', 0, 1, 0, '', 0, 0, 0, 1506390177, 1507619168, '总代理', '马琳');

-- --------------------------------------------------------

--
-- 表的结构 `cool_link`
--

CREATE TABLE IF NOT EXISTS `cool_link` (
  `link_id` int(5) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '链接名称',
  `url` varchar(200) NOT NULL COMMENT '链接URL',
  `type_id` tinyint(4) DEFAULT NULL COMMENT '所属栏目ID',
  `qq` varchar(20) NOT NULL COMMENT '联系QQ',
  `sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0禁用1启用'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_message`
--

CREATE TABLE IF NOT EXISTS `cool_message` (
  `message_id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT '' COMMENT '留言标题',
  `tel` varchar(15) NOT NULL DEFAULT '' COMMENT '留言电话',
  `addtime` varchar(15) NOT NULL COMMENT '留言时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=审核 0=不审核',
  `ip` varchar(50) DEFAULT '' COMMENT '留言者IP',
  `content` longtext NOT NULL COMMENT '留言内容',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL COMMENT '留言邮箱'
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_message`
--

INSERT INTO `cool_message` (`message_id`, `title`, `tel`, `addtime`, `open`, `ip`, `content`, `name`, `email`) VALUES
(34, '', '15046113513', '1506221864', 0, '', 'asdaasdasd', 'wzs', '1003418012@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `cool_module`
--

CREATE TABLE IF NOT EXISTS `cool_module` (
  `id` tinyint(3) unsigned NOT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listfields` varchar(255) NOT NULL DEFAULT '',
  `setup` text NOT NULL,
  `listorder` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_module`
--

INSERT INTO `cool_module` (`id`, `title`, `name`, `description`, `type`, `issystem`, `listfields`, `setup`, `listorder`, `status`) VALUES
(1, '单页模型', 'page', '关于我们', 1, 0, '*', '', 0, 1),
(2, '文章模型', 'article', '新闻文章', 1, 0, '*', '', 0, 1),
(3, '图片模型', 'picture', '图片展示', 1, 0, '*', '', 0, 1),
(4, '产品模型', 'product', '产品展示', 1, 0, '*', '', 0, 1),
(10, '案例模型', 'case', '案例模型', 1, 0, '*', '', 0, 1),
(9, '博客模型', 'blog', '博客模型', 1, 0, '*', '', 0, 1),
(11, '服务模型', 'service', '服务模型', 1, 0, '*', '', 0, 1),
(13, '服务客户', 'fuwukehu', '', 1, 0, '*', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `cool_order`
--

CREATE TABLE IF NOT EXISTS `cool_order` (
  `id` int(11) unsigned NOT NULL,
  `sn` char(22) NOT NULL DEFAULT '',
  `password` varchar(30) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `price` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `productlist` mediumtext NOT NULL,
  `note` mediumtext NOT NULL,
  `realname` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `tel` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(18) NOT NULL DEFAULT '',
  `fax` varchar(50) NOT NULL DEFAULT '',
  `address` varchar(80) NOT NULL DEFAULT '',
  `zipcode` varchar(10) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_page`
--

CREATE TABLE IF NOT EXISTS `cool_page` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_page`
--

INSERT INTO `cool_page` (`id`, `title`, `title_style`, `thumb`, `hits`, `status`, `userid`, `username`, `listorder`, `createtime`, `updatetime`, `lang`, `content`) VALUES
(2, '关于我们', 'color:rgb(0, 0, 0);font-weight:bold;', '/uploads/20170904/ea84d4a49e634b253adf11fc4463a1d4.jpg', 0, 1, 0, '', 0, 1504251653, 0, 0, '<p>哈尔滨酷创网络科技有限公司，成立于2017年。是一家专业从事网站建设，网络宣传，微营销，大项目定制的电子商务公司。团队成员具有丰富的设计和开发水平，我们将商业与技术完美结合，可以让我们的客户可以在飞速发展的信息科技领域中获得更有效的竞争力。</p>'),
(16, '联系我们', 'color:;font-weight:normal;', '', 0, 0, 0, '', 0, 1506219212, 0, 0, '<h5>公司地址</h5><p>哈尔滨市南岗区文景街86号</p><h5 style="white-space: normal;">联系邮箱</h5><p style="white-space: normal;">hrbkcwl@163.com</p><h5>工作时间</h5><p>周一至周五: 8:00-17:00</p><p>星期六: 10:00-14:00</p><p>星期日: 休息</p>');

-- --------------------------------------------------------

--
-- 表的结构 `cool_picture`
--

CREATE TABLE IF NOT EXISTS `cool_picture` (
  `id` int(11) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(80) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(80) NOT NULL DEFAULT '',
  `group` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_plugin`
--

CREATE TABLE IF NOT EXISTS `cool_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0 PC+手机 1 手机 2 PC'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_plugin`
--

INSERT INTO `cool_plugin` (`code`, `name`, `version`, `author`, `config`, `config_value`, `desc`, `status`, `type`, `icon`, `bank_code`, `scene`) VALUES
('qq', 'QQ登陆', '1.0', 'wzs', 'a:2:{i:0;a:4:{s:4:"name";s:6:"app_id";s:5:"label";s:6:"app_id";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:1;a:4:{s:4:"name";s:10:"app_secret";s:5:"label";s:10:"app_secret";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', NULL, 'QQ登陆插件 ', 1, 'login', 'logo.png', 'N;', NULL),
('wdj', '微点金插件', '1.0', 'wzs', 'a:4:{i:0;a:4:{s:4:"name";s:5:"adpic";s:5:"label";s:12:"广告图片";s:4:"type";s:5:"image";s:5:"value";s:0:"";}i:1;a:5:{s:4:"name";s:11:"addposition";s:5:"label";s:12:"广告位置";s:4:"type";s:6:"select";s:6:"option";a:2:{i:0;s:6:"头部";i:1;s:6:"底部";}s:5:"value";s:0:"";}i:2;a:4:{s:4:"name";s:3:"tel";s:5:"label";s:6:"手机";s:4:"type";s:4:"text";s:5:"value";s:0:"";}i:3;a:4:{s:4:"name";s:3:"url";s:5:"label";s:6:"链接";s:4:"type";s:4:"text";s:5:"value";s:0:"";}}', 'a:4:{s:5:"adpic";s:54:"/uploads/20171007/52e00e9c36db5a882dd326a71b74d492.gif";s:11:"addposition";s:1:"2";s:3:"tel";s:11:"13204660513";s:3:"url";s:22:"http://www.hrbkcwl.com";}', '微点金插件', 1, 'wdj', 'logo.png', 'N;', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cool_posid`
--

CREATE TABLE IF NOT EXISTS `cool_posid` (
  `id` tinyint(2) unsigned NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `listorder` tinyint(2) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_posid`
--

INSERT INTO `cool_posid` (`id`, `name`, `listorder`) VALUES
(1, '首页推荐', 0),
(2, '当前分类推荐', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cool_product`
--

CREATE TABLE IF NOT EXISTS `cool_product` (
  `id` int(11) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `xinghao` varchar(255) NOT NULL DEFAULT '',
  `pics` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_region`
--

CREATE TABLE IF NOT EXISTS `cool_region` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '2'
) ENGINE=MyISAM AUTO_INCREMENT=3726 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_region`
--

INSERT INTO `cool_region` (`id`, `pid`, `name`, `type`) VALUES
(1, 0, '中国', 0),
(2, 1, '北京', 1),
(3, 1, '安徽', 1),
(4, 1, '福建', 1),
(5, 1, '甘肃', 1),
(6, 1, '广东', 1),
(7, 1, '广西', 1),
(8, 1, '贵州', 1),
(9, 1, '海南', 1),
(10, 1, '河北', 1),
(11, 1, '河南', 1),
(12, 1, '黑龙江', 1),
(13, 1, '湖北', 1),
(14, 1, '湖南', 1),
(15, 1, '吉林', 1),
(16, 1, '江苏', 1),
(17, 1, '江西', 1),
(18, 1, '辽宁', 1),
(19, 1, '内蒙古', 1),
(20, 1, '宁夏', 1),
(21, 1, '青海', 1),
(22, 1, '山东', 1),
(23, 1, '山西', 1),
(24, 1, '陕西', 1),
(25, 1, '上海', 1),
(26, 1, '四川', 1),
(27, 1, '天津', 1),
(28, 1, '西藏', 1),
(29, 1, '新疆', 1),
(30, 1, '云南', 1),
(31, 1, '浙江', 1),
(32, 1, '重庆', 1),
(33, 1, '香港', 1),
(34, 1, '澳门', 1),
(35, 1, '台湾', 1),
(36, 3, '安庆', 2),
(37, 3, '蚌埠', 2),
(38, 3, '巢湖', 2),
(39, 3, '池州', 2),
(40, 3, '滁州', 2),
(41, 3, '阜阳', 2),
(42, 3, '淮北', 2),
(43, 3, '淮南', 2),
(44, 3, '黄山', 2),
(45, 3, '六安', 2),
(46, 3, '马鞍山', 2),
(47, 3, '宿州', 2),
(48, 3, '铜陵', 2),
(49, 3, '芜湖', 2),
(50, 3, '宣城', 2),
(51, 3, '亳州', 2),
(52, 2, '北京', 2),
(53, 4, '福州', 2),
(54, 4, '龙岩', 2),
(55, 4, '南平', 2),
(56, 4, '宁德', 2),
(57, 4, '莆田', 2),
(58, 4, '泉州', 2),
(59, 4, '三明', 2),
(60, 4, '厦门', 2),
(61, 4, '漳州', 2),
(62, 5, '兰州', 2),
(63, 5, '白银', 2),
(64, 5, '定西', 2),
(65, 5, '甘南', 2),
(66, 5, '嘉峪关', 2),
(67, 5, '金昌', 2),
(68, 5, '酒泉', 2),
(69, 5, '临夏', 2),
(70, 5, '陇南', 2),
(71, 5, '平凉', 2),
(72, 5, '庆阳', 2),
(73, 5, '天水', 2),
(74, 5, '武威', 2),
(75, 5, '张掖', 2),
(76, 6, '广州', 2),
(77, 6, '深圳', 2),
(78, 6, '潮州', 2),
(79, 6, '东莞', 2),
(80, 6, '佛山', 2),
(81, 6, '河源', 2),
(82, 6, '惠州', 2),
(83, 6, '江门', 2),
(84, 6, '揭阳', 2),
(85, 6, '茂名', 2),
(86, 6, '梅州', 2),
(87, 6, '清远', 2),
(88, 6, '汕头', 2),
(89, 6, '汕尾', 2),
(90, 6, '韶关', 2),
(91, 6, '阳江', 2),
(92, 6, '云浮', 2),
(93, 6, '湛江', 2),
(94, 6, '肇庆', 2),
(95, 6, '中山', 2),
(96, 6, '珠海', 2),
(97, 7, '南宁', 2),
(98, 7, '桂林', 2),
(99, 7, '百色', 2),
(100, 7, '北海', 2),
(101, 7, '崇左', 2),
(102, 7, '防城港', 2),
(103, 7, '贵港', 2),
(104, 7, '河池', 2),
(105, 7, '贺州', 2),
(106, 7, '来宾', 2),
(107, 7, '柳州', 2),
(108, 7, '钦州', 2),
(109, 7, '梧州', 2),
(110, 7, '玉林', 2),
(111, 8, '贵阳', 2),
(112, 8, '安顺', 2),
(113, 8, '毕节', 2),
(114, 8, '六盘水', 2),
(115, 8, '黔东南', 2),
(116, 8, '黔南', 2),
(117, 8, '黔西南', 2),
(118, 8, '铜仁', 2),
(119, 8, '遵义', 2),
(120, 9, '海口', 2),
(121, 9, '三亚', 2),
(122, 9, '白沙', 2),
(123, 9, '保亭', 2),
(124, 9, '昌江', 2),
(125, 9, '澄迈县', 2),
(126, 9, '定安县', 2),
(127, 9, '东方', 2),
(128, 9, '乐东', 2),
(129, 9, '临高县', 2),
(130, 9, '陵水', 2),
(131, 9, '琼海', 2),
(132, 9, '琼中', 2),
(133, 9, '屯昌县', 2),
(134, 9, '万宁', 2),
(135, 9, '文昌', 2),
(136, 9, '五指山', 2),
(137, 9, '儋州', 2),
(138, 10, '石家庄', 2),
(139, 10, '保定', 2),
(140, 10, '沧州', 2),
(141, 10, '承德', 2),
(142, 10, '邯郸', 2),
(143, 10, '衡水', 2),
(144, 10, '廊坊', 2),
(145, 10, '秦皇岛', 2),
(146, 10, '唐山', 2),
(147, 10, '邢台', 2),
(148, 10, '张家口', 2),
(149, 11, '郑州', 2),
(150, 11, '洛阳', 2),
(151, 11, '开封', 2),
(152, 11, '安阳', 2),
(153, 11, '鹤壁', 2),
(154, 11, '济源', 2),
(155, 11, '焦作', 2),
(156, 11, '南阳', 2),
(157, 11, '平顶山', 2),
(158, 11, '三门峡', 2),
(159, 11, '商丘', 2),
(160, 11, '新乡', 2),
(161, 11, '信阳', 2),
(162, 11, '许昌', 2),
(163, 11, '周口', 2),
(164, 11, '驻马店', 2),
(165, 11, '漯河', 2),
(166, 11, '濮阳', 2),
(167, 12, '哈尔滨', 2),
(168, 12, '大庆', 2),
(169, 12, '大兴安岭', 2),
(170, 12, '鹤岗', 2),
(171, 12, '黑河', 2),
(172, 12, '鸡西', 2),
(173, 12, '佳木斯', 2),
(174, 12, '牡丹江', 2),
(175, 12, '七台河', 2),
(176, 12, '齐齐哈尔', 2),
(177, 12, '双鸭山', 2),
(178, 12, '绥化', 2),
(179, 12, '伊春', 2),
(180, 13, '武汉', 2),
(181, 13, '仙桃', 2),
(182, 13, '鄂州', 2),
(183, 13, '黄冈', 2),
(184, 13, '黄石', 2),
(185, 13, '荆门', 2),
(186, 13, '荆州', 2),
(187, 13, '潜江', 2),
(188, 13, '神农架林区', 2),
(189, 13, '十堰', 2),
(190, 13, '随州', 2),
(191, 13, '天门', 2),
(192, 13, '咸宁', 2),
(193, 13, '襄樊', 2),
(194, 13, '孝感', 2),
(195, 13, '宜昌', 2),
(196, 13, '恩施', 2),
(197, 14, '长沙', 2),
(198, 14, '张家界', 2),
(199, 14, '常德', 2),
(200, 14, '郴州', 2),
(201, 14, '衡阳', 2),
(202, 14, '怀化', 2),
(203, 14, '娄底', 2),
(204, 14, '邵阳', 2),
(205, 14, '湘潭', 2),
(206, 14, '湘西', 2),
(207, 14, '益阳', 2),
(208, 14, '永州', 2),
(209, 14, '岳阳', 2),
(210, 14, '株洲', 2),
(211, 15, '长春', 2),
(212, 15, '吉林', 2),
(213, 15, '白城', 2),
(214, 15, '白山', 2),
(215, 15, '辽源', 2),
(216, 15, '四平', 2),
(217, 15, '松原', 2),
(218, 15, '通化', 2),
(219, 15, '延边', 2),
(220, 16, '南京', 2),
(221, 16, '苏州', 2),
(222, 16, '无锡', 2),
(223, 16, '常州', 2),
(224, 16, '淮安', 2),
(225, 16, '连云港', 2),
(226, 16, '南通', 2),
(227, 16, '宿迁', 2),
(228, 16, '泰州', 2),
(229, 16, '徐州', 2),
(230, 16, '盐城', 2),
(231, 16, '扬州', 2),
(232, 16, '镇江', 2),
(233, 17, '南昌', 2),
(234, 17, '抚州', 2),
(235, 17, '赣州', 2),
(236, 17, '吉安', 2),
(237, 17, '景德镇', 2),
(238, 17, '九江', 2),
(239, 17, '萍乡', 2),
(240, 17, '上饶', 2),
(241, 17, '新余', 2),
(242, 17, '宜春', 2),
(243, 17, '鹰潭', 2),
(244, 18, '沈阳', 2),
(245, 18, '大连', 2),
(246, 18, '鞍山', 2),
(247, 18, '本溪', 2),
(248, 18, '朝阳', 2),
(249, 18, '丹东', 2),
(250, 18, '抚顺', 2),
(251, 18, '阜新', 2),
(252, 18, '葫芦岛', 2),
(253, 18, '锦州', 2),
(254, 18, '辽阳', 2),
(255, 18, '盘锦', 2),
(256, 18, '铁岭', 2),
(257, 18, '营口', 2),
(258, 19, '呼和浩特', 2),
(259, 19, '阿拉善盟', 2),
(260, 19, '巴彦淖尔盟', 2),
(261, 19, '包头', 2),
(262, 19, '赤峰', 2),
(263, 19, '鄂尔多斯', 2),
(264, 19, '呼伦贝尔', 2),
(265, 19, '通辽', 2),
(266, 19, '乌海', 2),
(267, 19, '乌兰察布市', 2),
(268, 19, '锡林郭勒盟', 2),
(269, 19, '兴安盟', 2),
(270, 20, '银川', 2),
(271, 20, '固原', 2),
(272, 20, '石嘴山', 2),
(273, 20, '吴忠', 2),
(274, 20, '中卫', 2),
(275, 21, '西宁', 2),
(276, 21, '果洛', 2),
(277, 21, '海北', 2),
(278, 21, '海东', 2),
(279, 21, '海南', 2),
(280, 21, '海西', 2),
(281, 21, '黄南', 2),
(282, 21, '玉树', 2),
(283, 22, '济南', 2),
(284, 22, '青岛', 2),
(285, 22, '滨州', 2),
(286, 22, '德州', 2),
(287, 22, '东营', 2),
(288, 22, '菏泽', 2),
(289, 22, '济宁', 2),
(290, 22, '莱芜', 2),
(291, 22, '聊城', 2),
(292, 22, '临沂', 2),
(293, 22, '日照', 2),
(294, 22, '泰安', 2),
(295, 22, '威海', 2),
(296, 22, '潍坊', 2),
(297, 22, '烟台', 2),
(298, 22, '枣庄', 2),
(299, 22, '淄博', 2),
(300, 23, '太原', 2),
(301, 23, '长治', 2),
(302, 23, '大同', 2),
(303, 23, '晋城', 2),
(304, 23, '晋中', 2),
(305, 23, '临汾', 2),
(306, 23, '吕梁', 2),
(307, 23, '朔州', 2),
(308, 23, '忻州', 2),
(309, 23, '阳泉', 2),
(310, 23, '运城', 2),
(311, 24, '西安', 2),
(312, 24, '安康', 2),
(313, 24, '宝鸡', 2),
(314, 24, '汉中', 2),
(315, 24, '商洛', 2),
(316, 24, '铜川', 2),
(317, 24, '渭南', 2),
(318, 24, '咸阳', 2),
(319, 24, '延安', 2),
(320, 24, '榆林', 2),
(321, 25, '上海', 2),
(322, 26, '成都', 2),
(323, 26, '绵阳', 2),
(324, 26, '阿坝', 2),
(325, 26, '巴中', 2),
(326, 26, '达州', 2),
(327, 26, '德阳', 2),
(328, 26, '甘孜', 2),
(329, 26, '广安', 2),
(330, 26, '广元', 2),
(331, 26, '乐山', 2),
(332, 26, '凉山', 2),
(333, 26, '眉山', 2),
(334, 26, '南充', 2),
(335, 26, '内江', 2),
(336, 26, '攀枝花', 2),
(337, 26, '遂宁', 2),
(338, 26, '雅安', 2),
(339, 26, '宜宾', 2),
(340, 26, '资阳', 2),
(341, 26, '自贡', 2),
(342, 26, '泸州', 2),
(343, 27, '天津', 2),
(344, 28, '拉萨', 2),
(345, 28, '阿里', 2),
(346, 28, '昌都', 2),
(347, 28, '林芝', 2),
(348, 28, '那曲', 2),
(349, 28, '日喀则', 2),
(350, 28, '山南', 2),
(351, 29, '乌鲁木齐', 2),
(352, 29, '阿克苏', 2),
(353, 29, '阿拉尔', 2),
(354, 29, '巴音郭楞', 2),
(355, 29, '博尔塔拉', 2),
(356, 29, '昌吉', 2),
(357, 29, '哈密', 2),
(358, 29, '和田', 2),
(359, 29, '喀什', 2),
(360, 29, '克拉玛依', 2),
(361, 29, '克孜勒苏', 2),
(362, 29, '石河子', 2),
(363, 29, '图木舒克', 2),
(364, 29, '吐鲁番', 2),
(365, 29, '五家渠', 2),
(366, 29, '伊犁', 2),
(367, 30, '昆明', 2),
(368, 30, '怒江', 2),
(369, 30, '普洱', 2),
(370, 30, '丽江', 2),
(371, 30, '保山', 2),
(372, 30, '楚雄', 2),
(373, 30, '大理', 2),
(374, 30, '德宏', 2),
(375, 30, '迪庆', 2),
(376, 30, '红河', 2),
(377, 30, '临沧', 2),
(378, 30, '曲靖', 2),
(379, 30, '文山', 2),
(380, 30, '西双版纳', 2),
(381, 30, '玉溪', 2),
(382, 30, '昭通', 2),
(383, 31, '杭州', 2),
(384, 31, '湖州', 2),
(385, 31, '嘉兴', 2),
(386, 31, '金华', 2),
(387, 31, '丽水', 2),
(388, 31, '宁波', 2),
(389, 31, '绍兴', 2),
(390, 31, '台州', 2),
(391, 31, '温州', 2),
(392, 31, '舟山', 2),
(393, 31, '衢州', 2),
(394, 32, '重庆', 2),
(395, 33, '香港', 2),
(396, 34, '澳门', 2),
(397, 35, '台湾', 2),
(398, 36, '迎江区', 3),
(399, 36, '大观区', 3),
(400, 36, '宜秀区', 3),
(401, 36, '桐城市', 3),
(402, 36, '怀宁县', 3),
(403, 36, '枞阳县', 3),
(404, 36, '潜山县', 3),
(405, 36, '太湖县', 3),
(406, 36, '宿松县', 3),
(407, 36, '望江县', 3),
(408, 36, '岳西县', 3),
(409, 37, '中市区', 3),
(410, 37, '东市区', 3),
(411, 37, '西市区', 3),
(412, 37, '郊区', 3),
(413, 37, '怀远县', 3),
(414, 37, '五河县', 3),
(415, 37, '固镇县', 3),
(416, 38, '居巢区', 3),
(417, 38, '庐江县', 3),
(418, 38, '无为县', 3),
(419, 38, '含山县', 3),
(420, 38, '和县', 3),
(421, 39, '贵池区', 3),
(422, 39, '东至县', 3),
(423, 39, '石台县', 3),
(424, 39, '青阳县', 3),
(425, 40, '琅琊区', 3),
(426, 40, '南谯区', 3),
(427, 40, '天长市', 3),
(428, 40, '明光市', 3),
(429, 40, '来安县', 3),
(430, 40, '全椒县', 3),
(431, 40, '定远县', 3),
(432, 40, '凤阳县', 3),
(433, 41, '蚌山区', 3),
(434, 41, '龙子湖区', 3),
(435, 41, '禹会区', 3),
(436, 41, '淮上区', 3),
(437, 41, '颍州区', 3),
(438, 41, '颍东区', 3),
(439, 41, '颍泉区', 3),
(440, 41, '界首市', 3),
(441, 41, '临泉县', 3),
(442, 41, '太和县', 3),
(443, 41, '阜南县', 3),
(444, 41, '颖上县', 3),
(445, 42, '相山区', 3),
(446, 42, '杜集区', 3),
(447, 42, '烈山区', 3),
(448, 42, '濉溪县', 3),
(449, 43, '田家庵区', 3),
(450, 43, '大通区', 3),
(451, 43, '谢家集区', 3),
(452, 43, '八公山区', 3),
(453, 43, '潘集区', 3),
(454, 43, '凤台县', 3),
(455, 44, '屯溪区', 3),
(456, 44, '黄山区', 3),
(457, 44, '徽州区', 3),
(458, 44, '歙县', 3),
(459, 44, '休宁县', 3),
(460, 44, '黟县', 3),
(461, 44, '祁门县', 3),
(462, 45, '金安区', 3),
(463, 45, '裕安区', 3),
(464, 45, '寿县', 3),
(465, 45, '霍邱县', 3),
(466, 45, '舒城县', 3),
(467, 45, '金寨县', 3),
(468, 45, '霍山县', 3),
(469, 46, '雨山区', 3),
(470, 46, '花山区', 3),
(471, 46, '金家庄区', 3),
(472, 46, '当涂县', 3),
(473, 47, '埇桥区', 3),
(474, 47, '砀山县', 3),
(475, 47, '萧县', 3),
(476, 47, '灵璧县', 3),
(477, 47, '泗县', 3),
(478, 48, '铜官山区', 3),
(479, 48, '狮子山区', 3),
(480, 48, '郊区', 3),
(481, 48, '铜陵县', 3),
(482, 49, '镜湖区', 3),
(483, 49, '弋江区', 3),
(484, 49, '鸠江区', 3),
(485, 49, '三山区', 3),
(486, 49, '芜湖县', 3),
(487, 49, '繁昌县', 3),
(488, 49, '南陵县', 3),
(489, 50, '宣州区', 3),
(490, 50, '宁国市', 3),
(491, 50, '郎溪县', 3),
(492, 50, '广德县', 3),
(493, 50, '泾县', 3),
(494, 50, '绩溪县', 3),
(495, 50, '旌德县', 3),
(496, 51, '涡阳县', 3),
(497, 51, '蒙城县', 3),
(498, 51, '利辛县', 3),
(499, 51, '谯城区', 3),
(500, 52, '东城区', 3),
(501, 52, '西城区', 3),
(502, 52, '海淀区', 3),
(503, 52, '朝阳区', 3),
(504, 52, '崇文区', 3),
(505, 52, '宣武区', 3),
(506, 52, '丰台区', 3),
(507, 52, '石景山区', 3),
(508, 52, '房山区', 3),
(509, 52, '门头沟区', 3),
(510, 52, '通州区', 3),
(511, 52, '顺义区', 3),
(512, 52, '昌平区', 3),
(513, 52, '怀柔区', 3),
(514, 52, '平谷区', 3),
(515, 52, '大兴区', 3),
(516, 52, '密云县', 3),
(517, 52, '延庆县', 3),
(518, 53, '鼓楼区', 3),
(519, 53, '台江区', 3),
(520, 53, '仓山区', 3),
(521, 53, '马尾区', 3),
(522, 53, '晋安区', 3),
(523, 53, '福清市', 3),
(524, 53, '长乐市', 3),
(525, 53, '闽侯县', 3),
(526, 53, '连江县', 3),
(527, 53, '罗源县', 3),
(528, 53, '闽清县', 3),
(529, 53, '永泰县', 3),
(530, 53, '平潭县', 3),
(531, 54, '新罗区', 3),
(532, 54, '漳平市', 3),
(533, 54, '长汀县', 3),
(534, 54, '永定县', 3),
(535, 54, '上杭县', 3),
(536, 54, '武平县', 3),
(537, 54, '连城县', 3),
(538, 55, '延平区', 3),
(539, 55, '邵武市', 3),
(540, 55, '武夷山市', 3),
(541, 55, '建瓯市', 3),
(542, 55, '建阳市', 3),
(543, 55, '顺昌县', 3),
(544, 55, '浦城县', 3),
(545, 55, '光泽县', 3),
(546, 55, '松溪县', 3),
(547, 55, '政和县', 3),
(548, 56, '蕉城区', 3),
(549, 56, '福安市', 3),
(550, 56, '福鼎市', 3),
(551, 56, '霞浦县', 3),
(552, 56, '古田县', 3),
(553, 56, '屏南县', 3),
(554, 56, '寿宁县', 3),
(555, 56, '周宁县', 3),
(556, 56, '柘荣县', 3),
(557, 57, '城厢区', 3),
(558, 57, '涵江区', 3),
(559, 57, '荔城区', 3),
(560, 57, '秀屿区', 3),
(561, 57, '仙游县', 3),
(562, 58, '鲤城区', 3),
(563, 58, '丰泽区', 3),
(564, 58, '洛江区', 3),
(565, 58, '清濛开发区', 3),
(566, 58, '泉港区', 3),
(567, 58, '石狮市', 3),
(568, 58, '晋江市', 3),
(569, 58, '南安市', 3),
(570, 58, '惠安县', 3),
(571, 58, '安溪县', 3),
(572, 58, '永春县', 3),
(573, 58, '德化县', 3),
(574, 58, '金门县', 3),
(575, 59, '梅列区', 3),
(576, 59, '三元区', 3),
(577, 59, '永安市', 3),
(578, 59, '明溪县', 3),
(579, 59, '清流县', 3),
(580, 59, '宁化县', 3),
(581, 59, '大田县', 3),
(582, 59, '尤溪县', 3),
(583, 59, '沙县', 3),
(584, 59, '将乐县', 3),
(585, 59, '泰宁县', 3),
(586, 59, '建宁县', 3),
(587, 60, '思明区', 3),
(588, 60, '海沧区', 3),
(589, 60, '湖里区', 3),
(590, 60, '集美区', 3),
(591, 60, '同安区', 3),
(592, 60, '翔安区', 3),
(593, 61, '芗城区', 3),
(594, 61, '龙文区', 3),
(595, 61, '龙海市', 3),
(596, 61, '云霄县', 3),
(597, 61, '漳浦县', 3),
(598, 61, '诏安县', 3),
(599, 61, '长泰县', 3),
(600, 61, '东山县', 3),
(601, 61, '南靖县', 3),
(602, 61, '平和县', 3),
(603, 61, '华安县', 3),
(604, 62, '皋兰县', 3),
(605, 62, '城关区', 3),
(606, 62, '七里河区', 3),
(607, 62, '西固区', 3),
(608, 62, '安宁区', 3),
(609, 62, '红古区', 3),
(610, 62, '永登县', 3),
(611, 62, '榆中县', 3),
(612, 63, '白银区', 3),
(613, 63, '平川区', 3),
(614, 63, '会宁县', 3),
(615, 63, '景泰县', 3),
(616, 63, '靖远县', 3),
(617, 64, '临洮县', 3),
(618, 64, '陇西县', 3),
(619, 64, '通渭县', 3),
(620, 64, '渭源县', 3),
(621, 64, '漳县', 3),
(622, 64, '岷县', 3),
(623, 64, '安定区', 3),
(624, 64, '安定区', 3),
(625, 65, '合作市', 3),
(626, 65, '临潭县', 3),
(627, 65, '卓尼县', 3),
(628, 65, '舟曲县', 3),
(629, 65, '迭部县', 3),
(630, 65, '玛曲县', 3),
(631, 65, '碌曲县', 3),
(632, 65, '夏河县', 3),
(633, 66, '嘉峪关市', 3),
(634, 67, '金川区', 3),
(635, 67, '永昌县', 3),
(636, 68, '肃州区', 3),
(637, 68, '玉门市', 3),
(638, 68, '敦煌市', 3),
(639, 68, '金塔县', 3),
(640, 68, '瓜州县', 3),
(641, 68, '肃北', 3),
(642, 68, '阿克塞', 3),
(643, 69, '临夏市', 3),
(644, 69, '临夏县', 3),
(645, 69, '康乐县', 3),
(646, 69, '永靖县', 3),
(647, 69, '广河县', 3),
(648, 69, '和政县', 3),
(649, 69, '东乡族自治县', 3),
(650, 69, '积石山', 3),
(651, 70, '成县', 3),
(652, 70, '徽县', 3),
(653, 70, '康县', 3),
(654, 70, '礼县', 3),
(655, 70, '两当县', 3),
(656, 70, '文县', 3),
(657, 70, '西和县', 3),
(658, 70, '宕昌县', 3),
(659, 70, '武都区', 3),
(660, 71, '崇信县', 3),
(661, 71, '华亭县', 3),
(662, 71, '静宁县', 3),
(663, 71, '灵台县', 3),
(664, 71, '崆峒区', 3),
(665, 71, '庄浪县', 3),
(666, 71, '泾川县', 3),
(667, 72, '合水县', 3),
(668, 72, '华池县', 3),
(669, 72, '环县', 3),
(670, 72, '宁县', 3),
(671, 72, '庆城县', 3),
(672, 72, '西峰区', 3),
(673, 72, '镇原县', 3),
(674, 72, '正宁县', 3),
(675, 73, '甘谷县', 3),
(676, 73, '秦安县', 3),
(677, 73, '清水县', 3),
(678, 73, '秦州区', 3),
(679, 73, '麦积区', 3),
(680, 73, '武山县', 3),
(681, 73, '张家川', 3),
(682, 74, '古浪县', 3),
(683, 74, '民勤县', 3),
(684, 74, '天祝', 3),
(685, 74, '凉州区', 3),
(686, 75, '高台县', 3),
(687, 75, '临泽县', 3),
(688, 75, '民乐县', 3),
(689, 75, '山丹县', 3),
(690, 75, '肃南', 3),
(691, 75, '甘州区', 3),
(692, 76, '从化市', 3),
(693, 76, '天河区', 3),
(694, 76, '东山区', 3),
(695, 76, '白云区', 3),
(696, 76, '海珠区', 3),
(697, 76, '荔湾区', 3),
(698, 76, '越秀区', 3),
(699, 76, '黄埔区', 3),
(700, 76, '番禺区', 3),
(701, 76, '花都区', 3),
(702, 76, '增城区', 3),
(703, 76, '从化区', 3),
(704, 76, '市郊', 3),
(705, 77, '福田区', 3),
(706, 77, '罗湖区', 3),
(707, 77, '南山区', 3),
(708, 77, '宝安区', 3),
(709, 77, '龙岗区', 3),
(710, 77, '盐田区', 3),
(711, 78, '湘桥区', 3),
(712, 78, '潮安县', 3),
(713, 78, '饶平县', 3),
(714, 79, '南城区', 3),
(715, 79, '东城区', 3),
(716, 79, '万江区', 3),
(717, 79, '莞城区', 3),
(718, 79, '石龙镇', 3),
(719, 79, '虎门镇', 3),
(720, 79, '麻涌镇', 3),
(721, 79, '道滘镇', 3),
(722, 79, '石碣镇', 3),
(723, 79, '沙田镇', 3),
(724, 79, '望牛墩镇', 3),
(725, 79, '洪梅镇', 3),
(726, 79, '茶山镇', 3),
(727, 79, '寮步镇', 3),
(728, 79, '大岭山镇', 3),
(729, 79, '大朗镇', 3),
(730, 79, '黄江镇', 3),
(731, 79, '樟木头', 3),
(732, 79, '凤岗镇', 3),
(733, 79, '塘厦镇', 3),
(734, 79, '谢岗镇', 3),
(735, 79, '厚街镇', 3),
(736, 79, '清溪镇', 3),
(737, 79, '常平镇', 3),
(738, 79, '桥头镇', 3),
(739, 79, '横沥镇', 3),
(740, 79, '东坑镇', 3),
(741, 79, '企石镇', 3),
(742, 79, '石排镇', 3),
(743, 79, '长安镇', 3),
(744, 79, '中堂镇', 3),
(745, 79, '高埗镇', 3),
(746, 80, '禅城区', 3),
(747, 80, '南海区', 3),
(748, 80, '顺德区', 3),
(749, 80, '三水区', 3),
(750, 80, '高明区', 3),
(751, 81, '东源县', 3),
(752, 81, '和平县', 3),
(753, 81, '源城区', 3),
(754, 81, '连平县', 3),
(755, 81, '龙川县', 3),
(756, 81, '紫金县', 3),
(757, 82, '惠阳区', 3),
(758, 82, '惠城区', 3),
(759, 82, '大亚湾', 3),
(760, 82, '博罗县', 3),
(761, 82, '惠东县', 3),
(762, 82, '龙门县', 3),
(763, 83, '江海区', 3),
(764, 83, '蓬江区', 3),
(765, 83, '新会区', 3),
(766, 83, '台山市', 3),
(767, 83, '开平市', 3),
(768, 83, '鹤山市', 3),
(769, 83, '恩平市', 3),
(770, 84, '榕城区', 3),
(771, 84, '普宁市', 3),
(772, 84, '揭东县', 3),
(773, 84, '揭西县', 3),
(774, 84, '惠来县', 3),
(775, 85, '茂南区', 3),
(776, 85, '茂港区', 3),
(777, 85, '高州市', 3),
(778, 85, '化州市', 3),
(779, 85, '信宜市', 3),
(780, 85, '电白县', 3),
(781, 86, '梅县', 3),
(782, 86, '梅江区', 3),
(783, 86, '兴宁市', 3),
(784, 86, '大埔县', 3),
(785, 86, '丰顺县', 3),
(786, 86, '五华县', 3),
(787, 86, '平远县', 3),
(788, 86, '蕉岭县', 3),
(789, 87, '清城区', 3),
(790, 87, '英德市', 3),
(791, 87, '连州市', 3),
(792, 87, '佛冈县', 3),
(793, 87, '阳山县', 3),
(794, 87, '清新县', 3),
(795, 87, '连山', 3),
(796, 87, '连南', 3),
(797, 88, '南澳县', 3),
(798, 88, '潮阳区', 3),
(799, 88, '澄海区', 3),
(800, 88, '龙湖区', 3),
(801, 88, '金平区', 3),
(802, 88, '濠江区', 3),
(803, 88, '潮南区', 3),
(804, 89, '城区', 3),
(805, 89, '陆丰市', 3),
(806, 89, '海丰县', 3),
(807, 89, '陆河县', 3),
(808, 90, '曲江县', 3),
(809, 90, '浈江区', 3),
(810, 90, '武江区', 3),
(811, 90, '曲江区', 3),
(812, 90, '乐昌市', 3),
(813, 90, '南雄市', 3),
(814, 90, '始兴县', 3),
(815, 90, '仁化县', 3),
(816, 90, '翁源县', 3),
(817, 90, '新丰县', 3),
(818, 90, '乳源', 3),
(819, 91, '江城区', 3),
(820, 91, '阳春市', 3),
(821, 91, '阳西县', 3),
(822, 91, '阳东县', 3),
(823, 92, '云城区', 3),
(824, 92, '罗定市', 3),
(825, 92, '新兴县', 3),
(826, 92, '郁南县', 3),
(827, 92, '云安县', 3),
(828, 93, '赤坎区', 3),
(829, 93, '霞山区', 3),
(830, 93, '坡头区', 3),
(831, 93, '麻章区', 3),
(832, 93, '廉江市', 3),
(833, 93, '雷州市', 3),
(834, 93, '吴川市', 3),
(835, 93, '遂溪县', 3),
(836, 93, '徐闻县', 3),
(837, 94, '肇庆市', 3),
(838, 94, '高要市', 3),
(839, 94, '四会市', 3),
(840, 94, '广宁县', 3),
(841, 94, '怀集县', 3),
(842, 94, '封开县', 3),
(843, 94, '德庆县', 3),
(844, 95, '石岐街道', 3),
(845, 95, '东区街道', 3),
(846, 95, '西区街道', 3),
(847, 95, '环城街道', 3),
(848, 95, '中山港街道', 3),
(849, 95, '五桂山街道', 3),
(850, 96, '香洲区', 3),
(851, 96, '斗门区', 3),
(852, 96, '金湾区', 3),
(853, 97, '邕宁区', 3),
(854, 97, '青秀区', 3),
(855, 97, '兴宁区', 3),
(856, 97, '良庆区', 3),
(857, 97, '西乡塘区', 3),
(858, 97, '江南区', 3),
(859, 97, '武鸣县', 3),
(860, 97, '隆安县', 3),
(861, 97, '马山县', 3),
(862, 97, '上林县', 3),
(863, 97, '宾阳县', 3),
(864, 97, '横县', 3),
(865, 98, '秀峰区', 3),
(866, 98, '叠彩区', 3),
(867, 98, '象山区', 3),
(868, 98, '七星区', 3),
(869, 98, '雁山区', 3),
(870, 98, '阳朔县', 3),
(871, 98, '临桂县', 3),
(872, 98, '灵川县', 3),
(873, 98, '全州县', 3),
(874, 98, '平乐县', 3),
(875, 98, '兴安县', 3),
(876, 98, '灌阳县', 3),
(877, 98, '荔浦县', 3),
(878, 98, '资源县', 3),
(879, 98, '永福县', 3),
(880, 98, '龙胜', 3),
(881, 98, '恭城', 3),
(882, 99, '右江区', 3),
(883, 99, '凌云县', 3),
(884, 99, '平果县', 3),
(885, 99, '西林县', 3),
(886, 99, '乐业县', 3),
(887, 99, '德保县', 3),
(888, 99, '田林县', 3),
(889, 99, '田阳县', 3),
(890, 99, '靖西县', 3),
(891, 99, '田东县', 3),
(892, 99, '那坡县', 3),
(893, 99, '隆林', 3),
(894, 100, '海城区', 3),
(895, 100, '银海区', 3),
(896, 100, '铁山港区', 3),
(897, 100, '合浦县', 3),
(898, 101, '江州区', 3),
(899, 101, '凭祥市', 3),
(900, 101, '宁明县', 3),
(901, 101, '扶绥县', 3),
(902, 101, '龙州县', 3),
(903, 101, '大新县', 3),
(904, 101, '天等县', 3),
(905, 102, '港口区', 3),
(906, 102, '防城区', 3),
(907, 102, '东兴市', 3),
(908, 102, '上思县', 3),
(909, 103, '港北区', 3),
(910, 103, '港南区', 3),
(911, 103, '覃塘区', 3),
(912, 103, '桂平市', 3),
(913, 103, '平南县', 3),
(914, 104, '金城江区', 3),
(915, 104, '宜州市', 3),
(916, 104, '天峨县', 3),
(917, 104, '凤山县', 3),
(918, 104, '南丹县', 3),
(919, 104, '东兰县', 3),
(920, 104, '都安', 3),
(921, 104, '罗城', 3),
(922, 104, '巴马', 3),
(923, 104, '环江', 3),
(924, 104, '大化', 3),
(925, 105, '八步区', 3),
(926, 105, '钟山县', 3),
(927, 105, '昭平县', 3),
(928, 105, '富川', 3),
(929, 106, '兴宾区', 3),
(930, 106, '合山市', 3),
(931, 106, '象州县', 3),
(932, 106, '武宣县', 3),
(933, 106, '忻城县', 3),
(934, 106, '金秀', 3),
(935, 107, '城中区', 3),
(936, 107, '鱼峰区', 3),
(937, 107, '柳北区', 3),
(938, 107, '柳南区', 3),
(939, 107, '柳江县', 3),
(940, 107, '柳城县', 3),
(941, 107, '鹿寨县', 3),
(942, 107, '融安县', 3),
(943, 107, '融水', 3),
(944, 107, '三江', 3),
(945, 108, '钦南区', 3),
(946, 108, '钦北区', 3),
(947, 108, '灵山县', 3),
(948, 108, '浦北县', 3),
(949, 109, '万秀区', 3),
(950, 109, '蝶山区', 3),
(951, 109, '长洲区', 3),
(952, 109, '岑溪市', 3),
(953, 109, '苍梧县', 3),
(954, 109, '藤县', 3),
(955, 109, '蒙山县', 3),
(956, 110, '玉州区', 3),
(957, 110, '北流市', 3),
(958, 110, '容县', 3),
(959, 110, '陆川县', 3),
(960, 110, '博白县', 3),
(961, 110, '兴业县', 3),
(962, 111, '南明区', 3),
(963, 111, '云岩区', 3),
(964, 111, '花溪区', 3),
(965, 111, '乌当区', 3),
(966, 111, '白云区', 3),
(967, 111, '小河区', 3),
(968, 111, '金阳新区', 3),
(969, 111, '新天园区', 3),
(970, 111, '清镇市', 3),
(971, 111, '开阳县', 3),
(972, 111, '修文县', 3),
(973, 111, '息烽县', 3),
(974, 112, '西秀区', 3),
(975, 112, '关岭', 3),
(976, 112, '镇宁', 3),
(977, 112, '紫云', 3),
(978, 112, '平坝县', 3),
(979, 112, '普定县', 3),
(980, 113, '毕节市', 3),
(981, 113, '大方县', 3),
(982, 113, '黔西县', 3),
(983, 113, '金沙县', 3),
(984, 113, '织金县', 3),
(985, 113, '纳雍县', 3),
(986, 113, '赫章县', 3),
(987, 113, '威宁', 3),
(988, 114, '钟山区', 3),
(989, 114, '六枝特区', 3),
(990, 114, '水城县', 3),
(991, 114, '盘县', 3),
(992, 115, '凯里市', 3),
(993, 115, '黄平县', 3),
(994, 115, '施秉县', 3),
(995, 115, '三穗县', 3),
(996, 115, '镇远县', 3),
(997, 115, '岑巩县', 3),
(998, 115, '天柱县', 3),
(999, 115, '锦屏县', 3),
(1000, 115, '剑河县', 3),
(1001, 115, '台江县', 3),
(1002, 115, '黎平县', 3),
(1003, 115, '榕江县', 3),
(1004, 115, '从江县', 3),
(1005, 115, '雷山县', 3),
(1006, 115, '麻江县', 3),
(1007, 115, '丹寨县', 3),
(1008, 116, '都匀市', 3),
(1009, 116, '福泉市', 3),
(1010, 116, '荔波县', 3),
(1011, 116, '贵定县', 3),
(1012, 116, '瓮安县', 3),
(1013, 116, '独山县', 3),
(1014, 116, '平塘县', 3),
(1015, 116, '罗甸县', 3),
(1016, 116, '长顺县', 3),
(1017, 116, '龙里县', 3),
(1018, 116, '惠水县', 3),
(1019, 116, '三都', 3),
(1020, 117, '兴义市', 3),
(1021, 117, '兴仁县', 3),
(1022, 117, '普安县', 3),
(1023, 117, '晴隆县', 3),
(1024, 117, '贞丰县', 3),
(1025, 117, '望谟县', 3),
(1026, 117, '册亨县', 3),
(1027, 117, '安龙县', 3),
(1028, 118, '铜仁市', 3),
(1029, 118, '江口县', 3),
(1030, 118, '石阡县', 3),
(1031, 118, '思南县', 3),
(1032, 118, '德江县', 3),
(1033, 118, '玉屏', 3),
(1034, 118, '印江', 3),
(1035, 118, '沿河', 3),
(1036, 118, '松桃', 3),
(1037, 118, '万山特区', 3),
(1038, 119, '红花岗区', 3),
(1039, 119, '务川县', 3),
(1040, 119, '道真县', 3),
(1041, 119, '汇川区', 3),
(1042, 119, '赤水市', 3),
(1043, 119, '仁怀市', 3),
(1044, 119, '遵义县', 3),
(1045, 119, '桐梓县', 3),
(1046, 119, '绥阳县', 3),
(1047, 119, '正安县', 3),
(1048, 119, '凤冈县', 3),
(1049, 119, '湄潭县', 3),
(1050, 119, '余庆县', 3),
(1051, 119, '习水县', 3),
(1052, 119, '道真', 3),
(1053, 119, '务川', 3),
(1054, 120, '秀英区', 3),
(1055, 120, '龙华区', 3),
(1056, 120, '琼山区', 3),
(1057, 120, '美兰区', 3),
(1058, 137, '市区', 3),
(1059, 137, '洋浦开发区', 3),
(1060, 137, '那大镇', 3),
(1061, 137, '王五镇', 3),
(1062, 137, '雅星镇', 3),
(1063, 137, '大成镇', 3),
(1064, 137, '中和镇', 3),
(1065, 137, '峨蔓镇', 3),
(1066, 137, '南丰镇', 3),
(1067, 137, '白马井镇', 3),
(1068, 137, '兰洋镇', 3),
(1069, 137, '和庆镇', 3),
(1070, 137, '海头镇', 3),
(1071, 137, '排浦镇', 3),
(1072, 137, '东成镇', 3),
(1073, 137, '光村镇', 3),
(1074, 137, '木棠镇', 3),
(1075, 137, '新州镇', 3),
(1076, 137, '三都镇', 3),
(1077, 137, '其他', 3),
(1078, 138, '长安区', 3),
(1079, 138, '桥东区', 3),
(1080, 138, '桥西区', 3),
(1081, 138, '新华区', 3),
(1082, 138, '裕华区', 3),
(1083, 138, '井陉矿区', 3),
(1084, 138, '高新区', 3),
(1085, 138, '辛集市', 3),
(1086, 138, '藁城市', 3),
(1087, 138, '晋州市', 3),
(1088, 138, '新乐市', 3),
(1089, 138, '鹿泉市', 3),
(1090, 138, '井陉县', 3),
(1091, 138, '正定县', 3),
(1092, 138, '栾城县', 3),
(1093, 138, '行唐县', 3),
(1094, 138, '灵寿县', 3),
(1095, 138, '高邑县', 3),
(1096, 138, '深泽县', 3),
(1097, 138, '赞皇县', 3),
(1098, 138, '无极县', 3),
(1099, 138, '平山县', 3),
(1100, 138, '元氏县', 3),
(1101, 138, '赵县', 3),
(1102, 139, '新市区', 3),
(1103, 139, '南市区', 3),
(1104, 139, '北市区', 3),
(1105, 139, '涿州市', 3),
(1106, 139, '定州市', 3),
(1107, 139, '安国市', 3),
(1108, 139, '高碑店市', 3),
(1109, 139, '满城县', 3),
(1110, 139, '清苑县', 3),
(1111, 139, '涞水县', 3),
(1112, 139, '阜平县', 3),
(1113, 139, '徐水县', 3),
(1114, 139, '定兴县', 3),
(1115, 139, '唐县', 3),
(1116, 139, '高阳县', 3),
(1117, 139, '容城县', 3),
(1118, 139, '涞源县', 3),
(1119, 139, '望都县', 3),
(1120, 139, '安新县', 3),
(1121, 139, '易县', 3),
(1122, 139, '曲阳县', 3),
(1123, 139, '蠡县', 3),
(1124, 139, '顺平县', 3),
(1125, 139, '博野县', 3),
(1126, 139, '雄县', 3),
(1127, 140, '运河区', 3),
(1128, 140, '新华区', 3),
(1129, 140, '泊头市', 3),
(1130, 140, '任丘市', 3),
(1131, 140, '黄骅市', 3),
(1132, 140, '河间市', 3),
(1133, 140, '沧县', 3),
(1134, 140, '青县', 3),
(1135, 140, '东光县', 3),
(1136, 140, '海兴县', 3),
(1137, 140, '盐山县', 3),
(1138, 140, '肃宁县', 3),
(1139, 140, '南皮县', 3),
(1140, 140, '吴桥县', 3),
(1141, 140, '献县', 3),
(1142, 140, '孟村', 3),
(1143, 141, '双桥区', 3),
(1144, 141, '双滦区', 3),
(1145, 141, '鹰手营子矿区', 3),
(1146, 141, '承德县', 3),
(1147, 141, '兴隆县', 3),
(1148, 141, '平泉县', 3),
(1149, 141, '滦平县', 3),
(1150, 141, '隆化县', 3),
(1151, 141, '丰宁', 3),
(1152, 141, '宽城', 3),
(1153, 141, '围场', 3),
(1154, 142, '从台区', 3),
(1155, 142, '复兴区', 3),
(1156, 142, '邯山区', 3),
(1157, 142, '峰峰矿区', 3),
(1158, 142, '武安市', 3),
(1159, 142, '邯郸县', 3),
(1160, 142, '临漳县', 3),
(1161, 142, '成安县', 3),
(1162, 142, '大名县', 3),
(1163, 142, '涉县', 3),
(1164, 142, '磁县', 3),
(1165, 142, '肥乡县', 3),
(1166, 142, '永年县', 3),
(1167, 142, '邱县', 3),
(1168, 142, '鸡泽县', 3),
(1169, 142, '广平县', 3),
(1170, 142, '馆陶县', 3),
(1171, 142, '魏县', 3),
(1172, 142, '曲周县', 3),
(1173, 143, '桃城区', 3),
(1174, 143, '冀州市', 3),
(1175, 143, '深州市', 3),
(1176, 143, '枣强县', 3),
(1177, 143, '武邑县', 3),
(1178, 143, '武强县', 3),
(1179, 143, '饶阳县', 3),
(1180, 143, '安平县', 3),
(1181, 143, '故城县', 3),
(1182, 143, '景县', 3),
(1183, 143, '阜城县', 3),
(1184, 144, '安次区', 3),
(1185, 144, '广阳区', 3),
(1186, 144, '霸州市', 3),
(1187, 144, '三河市', 3),
(1188, 144, '固安县', 3),
(1189, 144, '永清县', 3),
(1190, 144, '香河县', 3),
(1191, 144, '大城县', 3),
(1192, 144, '文安县', 3),
(1193, 144, '大厂', 3),
(1194, 145, '海港区', 3),
(1195, 145, '山海关区', 3),
(1196, 145, '北戴河区', 3),
(1197, 145, '昌黎县', 3),
(1198, 145, '抚宁县', 3),
(1199, 145, '卢龙县', 3),
(1200, 145, '青龙', 3),
(1201, 146, '路北区', 3),
(1202, 146, '路南区', 3),
(1203, 146, '古冶区', 3),
(1204, 146, '开平区', 3),
(1205, 146, '丰南区', 3),
(1206, 146, '丰润区', 3),
(1207, 146, '遵化市', 3),
(1208, 146, '迁安市', 3),
(1209, 146, '滦县', 3),
(1210, 146, '滦南县', 3),
(1211, 146, '乐亭县', 3),
(1212, 146, '迁西县', 3),
(1213, 146, '玉田县', 3),
(1214, 146, '唐海县', 3),
(1215, 147, '桥东区', 3),
(1216, 147, '桥西区', 3),
(1217, 147, '南宫市', 3),
(1218, 147, '沙河市', 3),
(1219, 147, '邢台县', 3),
(1220, 147, '临城县', 3),
(1221, 147, '内丘县', 3),
(1222, 147, '柏乡县', 3),
(1223, 147, '隆尧县', 3),
(1224, 147, '任县', 3),
(1225, 147, '南和县', 3),
(1226, 147, '宁晋县', 3),
(1227, 147, '巨鹿县', 3),
(1228, 147, '新河县', 3),
(1229, 147, '广宗县', 3),
(1230, 147, '平乡县', 3),
(1231, 147, '威县', 3),
(1232, 147, '清河县', 3),
(1233, 147, '临西县', 3),
(1234, 148, '桥西区', 3),
(1235, 148, '桥东区', 3),
(1236, 148, '宣化区', 3),
(1237, 148, '下花园区', 3),
(1238, 148, '宣化县', 3),
(1239, 148, '张北县', 3),
(1240, 148, '康保县', 3),
(1241, 148, '沽源县', 3),
(1242, 148, '尚义县', 3),
(1243, 148, '蔚县', 3),
(1244, 148, '阳原县', 3),
(1245, 148, '怀安县', 3),
(1246, 148, '万全县', 3),
(1247, 148, '怀来县', 3),
(1248, 148, '涿鹿县', 3),
(1249, 148, '赤城县', 3),
(1250, 148, '崇礼县', 3),
(1251, 149, '金水区', 3),
(1252, 149, '邙山区', 3),
(1253, 149, '二七区', 3),
(1254, 149, '管城区', 3),
(1255, 149, '中原区', 3),
(1256, 149, '上街区', 3),
(1257, 149, '惠济区', 3),
(1258, 149, '郑东新区', 3),
(1259, 149, '经济技术开发区', 3),
(1260, 149, '高新开发区', 3),
(1261, 149, '出口加工区', 3),
(1262, 149, '巩义市', 3),
(1263, 149, '荥阳市', 3),
(1264, 149, '新密市', 3),
(1265, 149, '新郑市', 3),
(1266, 149, '登封市', 3),
(1267, 149, '中牟县', 3),
(1268, 150, '西工区', 3),
(1269, 150, '老城区', 3),
(1270, 150, '涧西区', 3),
(1271, 150, '瀍河回族区', 3),
(1272, 150, '洛龙区', 3),
(1273, 150, '吉利区', 3),
(1274, 150, '偃师市', 3),
(1275, 150, '孟津县', 3),
(1276, 150, '新安县', 3),
(1277, 150, '栾川县', 3),
(1278, 150, '嵩县', 3),
(1279, 150, '汝阳县', 3),
(1280, 150, '宜阳县', 3),
(1281, 150, '洛宁县', 3),
(1282, 150, '伊川县', 3),
(1283, 151, '鼓楼区', 3),
(1284, 151, '龙亭区', 3),
(1285, 151, '顺河回族区', 3),
(1286, 151, '金明区', 3),
(1287, 151, '禹王台区', 3),
(1288, 151, '杞县', 3),
(1289, 151, '通许县', 3),
(1290, 151, '尉氏县', 3),
(1291, 151, '开封县', 3),
(1292, 151, '兰考县', 3),
(1293, 152, '北关区', 3),
(1294, 152, '文峰区', 3),
(1295, 152, '殷都区', 3),
(1296, 152, '龙安区', 3),
(1297, 152, '林州市', 3),
(1298, 152, '安阳县', 3),
(1299, 152, '汤阴县', 3),
(1300, 152, '滑县', 3),
(1301, 152, '内黄县', 3),
(1302, 153, '淇滨区', 3),
(1303, 153, '山城区', 3),
(1304, 153, '鹤山区', 3),
(1305, 153, '浚县', 3),
(1306, 153, '淇县', 3),
(1307, 154, '济源市', 3),
(1308, 155, '解放区', 3),
(1309, 155, '中站区', 3),
(1310, 155, '马村区', 3),
(1311, 155, '山阳区', 3),
(1312, 155, '沁阳市', 3),
(1313, 155, '孟州市', 3),
(1314, 155, '修武县', 3),
(1315, 155, '博爱县', 3),
(1316, 155, '武陟县', 3),
(1317, 155, '温县', 3),
(1318, 156, '卧龙区', 3),
(1319, 156, '宛城区', 3),
(1320, 156, '邓州市', 3),
(1321, 156, '南召县', 3),
(1322, 156, '方城县', 3),
(1323, 156, '西峡县', 3),
(1324, 156, '镇平县', 3),
(1325, 156, '内乡县', 3),
(1326, 156, '淅川县', 3),
(1327, 156, '社旗县', 3),
(1328, 156, '唐河县', 3),
(1329, 156, '新野县', 3),
(1330, 156, '桐柏县', 3),
(1331, 157, '新华区', 3),
(1332, 157, '卫东区', 3),
(1333, 157, '湛河区', 3),
(1334, 157, '石龙区', 3),
(1335, 157, '舞钢市', 3),
(1336, 157, '汝州市', 3),
(1337, 157, '宝丰县', 3),
(1338, 157, '叶县', 3),
(1339, 157, '鲁山县', 3),
(1340, 157, '郏县', 3),
(1341, 158, '湖滨区', 3),
(1342, 158, '义马市', 3),
(1343, 158, '灵宝市', 3),
(1344, 158, '渑池县', 3),
(1345, 158, '陕县', 3),
(1346, 158, '卢氏县', 3),
(1347, 159, '梁园区', 3),
(1348, 159, '睢阳区', 3),
(1349, 159, '永城市', 3),
(1350, 159, '民权县', 3),
(1351, 159, '睢县', 3),
(1352, 159, '宁陵县', 3),
(1353, 159, '虞城县', 3),
(1354, 159, '柘城县', 3),
(1355, 159, '夏邑县', 3),
(1356, 160, '卫滨区', 3),
(1357, 160, '红旗区', 3),
(1358, 160, '凤泉区', 3),
(1359, 160, '牧野区', 3),
(1360, 160, '卫辉市', 3),
(1361, 160, '辉县市', 3),
(1362, 160, '新乡县', 3),
(1363, 160, '获嘉县', 3),
(1364, 160, '原阳县', 3),
(1365, 160, '延津县', 3),
(1366, 160, '封丘县', 3),
(1367, 160, '长垣县', 3),
(1368, 161, '浉河区', 3),
(1369, 161, '平桥区', 3),
(1370, 161, '罗山县', 3),
(1371, 161, '光山县', 3),
(1372, 161, '新县', 3),
(1373, 161, '商城县', 3),
(1374, 161, '固始县', 3),
(1375, 161, '潢川县', 3),
(1376, 161, '淮滨县', 3),
(1377, 161, '息县', 3),
(1378, 162, '魏都区', 3),
(1379, 162, '禹州市', 3),
(1380, 162, '长葛市', 3),
(1381, 162, '许昌县', 3),
(1382, 162, '鄢陵县', 3),
(1383, 162, '襄城县', 3),
(1384, 163, '川汇区', 3),
(1385, 163, '项城市', 3),
(1386, 163, '扶沟县', 3),
(1387, 163, '西华县', 3),
(1388, 163, '商水县', 3),
(1389, 163, '沈丘县', 3),
(1390, 163, '郸城县', 3),
(1391, 163, '淮阳县', 3),
(1392, 163, '太康县', 3),
(1393, 163, '鹿邑县', 3),
(1394, 164, '驿城区', 3),
(1395, 164, '西平县', 3),
(1396, 164, '上蔡县', 3),
(1397, 164, '平舆县', 3),
(1398, 164, '正阳县', 3),
(1399, 164, '确山县', 3),
(1400, 164, '泌阳县', 3),
(1401, 164, '汝南县', 3),
(1402, 164, '遂平县', 3),
(1403, 164, '新蔡县', 3),
(1404, 165, '郾城区', 3),
(1405, 165, '源汇区', 3),
(1406, 165, '召陵区', 3),
(1407, 165, '舞阳县', 3),
(1408, 165, '临颍县', 3),
(1409, 166, '华龙区', 3),
(1410, 166, '清丰县', 3),
(1411, 166, '南乐县', 3),
(1412, 166, '范县', 3),
(1413, 166, '台前县', 3),
(1414, 166, '濮阳县', 3),
(1415, 167, '道里区', 3),
(1416, 167, '南岗区', 3),
(1417, 167, '动力区', 3),
(1418, 167, '平房区', 3),
(1419, 167, '香坊区', 3),
(1420, 167, '太平区', 3),
(1421, 167, '道外区', 3),
(1422, 167, '阿城区', 3),
(1423, 167, '呼兰区', 3),
(1424, 167, '松北区', 3),
(1425, 167, '尚志市', 3),
(1426, 167, '双城市', 3),
(1427, 167, '五常市', 3),
(1428, 167, '方正县', 3),
(1429, 167, '宾县', 3),
(1430, 167, '依兰县', 3),
(1431, 167, '巴彦县', 3),
(1432, 167, '通河县', 3),
(1433, 167, '木兰县', 3),
(1434, 167, '延寿县', 3),
(1435, 168, '萨尔图区', 3),
(1436, 168, '红岗区', 3),
(1437, 168, '龙凤区', 3),
(1438, 168, '让胡路区', 3),
(1439, 168, '大同区', 3),
(1440, 168, '肇州县', 3),
(1441, 168, '肇源县', 3),
(1442, 168, '林甸县', 3),
(1443, 168, '杜尔伯特', 3),
(1444, 169, '呼玛县', 3),
(1445, 169, '漠河县', 3),
(1446, 169, '塔河县', 3),
(1447, 170, '兴山区', 3),
(1448, 170, '工农区', 3),
(1449, 170, '南山区', 3),
(1450, 170, '兴安区', 3),
(1451, 170, '向阳区', 3),
(1452, 170, '东山区', 3),
(1453, 170, '萝北县', 3),
(1454, 170, '绥滨县', 3),
(1455, 171, '爱辉区', 3),
(1456, 171, '五大连池市', 3),
(1457, 171, '北安市', 3),
(1458, 171, '嫩江县', 3),
(1459, 171, '逊克县', 3),
(1460, 171, '孙吴县', 3),
(1461, 172, '鸡冠区', 3),
(1462, 172, '恒山区', 3),
(1463, 172, '城子河区', 3),
(1464, 172, '滴道区', 3),
(1465, 172, '梨树区', 3),
(1466, 172, '虎林市', 3),
(1467, 172, '密山市', 3),
(1468, 172, '鸡东县', 3),
(1469, 173, '前进区', 3),
(1470, 173, '郊区', 3),
(1471, 173, '向阳区', 3),
(1472, 173, '东风区', 3),
(1473, 173, '同江市', 3),
(1474, 173, '富锦市', 3),
(1475, 173, '桦南县', 3),
(1476, 173, '桦川县', 3),
(1477, 173, '汤原县', 3),
(1478, 173, '抚远县', 3),
(1479, 174, '爱民区', 3),
(1480, 174, '东安区', 3),
(1481, 174, '阳明区', 3),
(1482, 174, '西安区', 3),
(1483, 174, '绥芬河市', 3),
(1484, 174, '海林市', 3),
(1485, 174, '宁安市', 3),
(1486, 174, '穆棱市', 3),
(1487, 174, '东宁县', 3),
(1488, 174, '林口县', 3),
(1489, 175, '桃山区', 3),
(1490, 175, '新兴区', 3),
(1491, 175, '茄子河区', 3),
(1492, 175, '勃利县', 3),
(1493, 176, '龙沙区', 3),
(1494, 176, '昂昂溪区', 3),
(1495, 176, '铁峰区', 3),
(1496, 176, '建华区', 3),
(1497, 176, '富拉尔基区', 3),
(1498, 176, '碾子山区', 3),
(1499, 176, '梅里斯达斡尔区', 3),
(1500, 176, '讷河市', 3),
(1501, 176, '龙江县', 3),
(1502, 176, '依安县', 3),
(1503, 176, '泰来县', 3),
(1504, 176, '甘南县', 3),
(1505, 176, '富裕县', 3),
(1506, 176, '克山县', 3),
(1507, 176, '克东县', 3),
(1508, 176, '拜泉县', 3),
(1509, 177, '尖山区', 3),
(1510, 177, '岭东区', 3),
(1511, 177, '四方台区', 3),
(1512, 177, '宝山区', 3),
(1513, 177, '集贤县', 3),
(1514, 177, '友谊县', 3),
(1515, 177, '宝清县', 3),
(1516, 177, '饶河县', 3),
(1517, 178, '北林区', 3),
(1518, 178, '安达市', 3),
(1519, 178, '肇东市', 3),
(1520, 178, '海伦市', 3),
(1521, 178, '望奎县', 3),
(1522, 178, '兰西县', 3),
(1523, 178, '青冈县', 3),
(1524, 178, '庆安县', 3),
(1525, 178, '明水县', 3),
(1526, 178, '绥棱县', 3),
(1527, 179, '伊春区', 3),
(1528, 179, '带岭区', 3),
(1529, 179, '南岔区', 3),
(1530, 179, '金山屯区', 3),
(1531, 179, '西林区', 3),
(1532, 179, '美溪区', 3),
(1533, 179, '乌马河区', 3),
(1534, 179, '翠峦区', 3),
(1535, 179, '友好区', 3),
(1536, 179, '上甘岭区', 3),
(1537, 179, '五营区', 3),
(1538, 179, '红星区', 3),
(1539, 179, '新青区', 3),
(1540, 179, '汤旺河区', 3),
(1541, 179, '乌伊岭区', 3),
(1542, 179, '铁力市', 3),
(1543, 179, '嘉荫县', 3),
(1544, 180, '江岸区', 3),
(1545, 180, '武昌区', 3),
(1546, 180, '江汉区', 3),
(1547, 180, '硚口区', 3),
(1548, 180, '汉阳区', 3),
(1549, 180, '青山区', 3),
(1550, 180, '洪山区', 3),
(1551, 180, '东西湖区', 3),
(1552, 180, '汉南区', 3),
(1553, 180, '蔡甸区', 3),
(1554, 180, '江夏区', 3),
(1555, 180, '黄陂区', 3),
(1556, 180, '新洲区', 3),
(1557, 180, '经济开发区', 3),
(1558, 181, '仙桃市', 3),
(1559, 182, '鄂城区', 3),
(1560, 182, '华容区', 3),
(1561, 182, '梁子湖区', 3),
(1562, 183, '黄州区', 3),
(1563, 183, '麻城市', 3),
(1564, 183, '武穴市', 3),
(1565, 183, '团风县', 3),
(1566, 183, '红安县', 3),
(1567, 183, '罗田县', 3),
(1568, 183, '英山县', 3),
(1569, 183, '浠水县', 3),
(1570, 183, '蕲春县', 3),
(1571, 183, '黄梅县', 3),
(1572, 184, '黄石港区', 3),
(1573, 184, '西塞山区', 3),
(1574, 184, '下陆区', 3),
(1575, 184, '铁山区', 3),
(1576, 184, '大冶市', 3),
(1577, 184, '阳新县', 3),
(1578, 185, '东宝区', 3),
(1579, 185, '掇刀区', 3),
(1580, 185, '钟祥市', 3),
(1581, 185, '京山县', 3),
(1582, 185, '沙洋县', 3),
(1583, 186, '沙市区', 3),
(1584, 186, '荆州区', 3),
(1585, 186, '石首市', 3),
(1586, 186, '洪湖市', 3),
(1587, 186, '松滋市', 3),
(1588, 186, '公安县', 3),
(1589, 186, '监利县', 3),
(1590, 186, '江陵县', 3),
(1591, 187, '潜江市', 3),
(1592, 188, '神农架林区', 3),
(1593, 189, '张湾区', 3),
(1594, 189, '茅箭区', 3),
(1595, 189, '丹江口市', 3),
(1596, 189, '郧县', 3),
(1597, 189, '郧西县', 3),
(1598, 189, '竹山县', 3),
(1599, 189, '竹溪县', 3),
(1600, 189, '房县', 3),
(1601, 190, '曾都区', 3),
(1602, 190, '广水市', 3),
(1603, 191, '天门市', 3),
(1604, 192, '咸安区', 3),
(1605, 192, '赤壁市', 3),
(1606, 192, '嘉鱼县', 3),
(1607, 192, '通城县', 3),
(1608, 192, '崇阳县', 3),
(1609, 192, '通山县', 3),
(1610, 193, '襄城区', 3),
(1611, 193, '樊城区', 3),
(1612, 193, '襄阳区', 3),
(1613, 193, '老河口市', 3),
(1614, 193, '枣阳市', 3),
(1615, 193, '宜城市', 3),
(1616, 193, '南漳县', 3),
(1617, 193, '谷城县', 3),
(1618, 193, '保康县', 3),
(1619, 194, '孝南区', 3),
(1620, 194, '应城市', 3),
(1621, 194, '安陆市', 3),
(1622, 194, '汉川市', 3),
(1623, 194, '孝昌县', 3),
(1624, 194, '大悟县', 3),
(1625, 194, '云梦县', 3),
(1626, 195, '长阳', 3),
(1627, 195, '五峰', 3),
(1628, 195, '西陵区', 3),
(1629, 195, '伍家岗区', 3),
(1630, 195, '点军区', 3),
(1631, 195, '猇亭区', 3),
(1632, 195, '夷陵区', 3),
(1633, 195, '宜都市', 3),
(1634, 195, '当阳市', 3),
(1635, 195, '枝江市', 3),
(1636, 195, '远安县', 3),
(1637, 195, '兴山县', 3),
(1638, 195, '秭归县', 3),
(1639, 196, '恩施市', 3),
(1640, 196, '利川市', 3),
(1641, 196, '建始县', 3),
(1642, 196, '巴东县', 3),
(1643, 196, '宣恩县', 3),
(1644, 196, '咸丰县', 3),
(1645, 196, '来凤县', 3),
(1646, 196, '鹤峰县', 3),
(1647, 197, '岳麓区', 3),
(1648, 197, '芙蓉区', 3),
(1649, 197, '天心区', 3),
(1650, 197, '开福区', 3),
(1651, 197, '雨花区', 3),
(1652, 197, '开发区', 3),
(1653, 197, '浏阳市', 3),
(1654, 197, '长沙县', 3),
(1655, 197, '望城县', 3),
(1656, 197, '宁乡县', 3),
(1657, 198, '永定区', 3),
(1658, 198, '武陵源区', 3),
(1659, 198, '慈利县', 3),
(1660, 198, '桑植县', 3),
(1661, 199, '武陵区', 3),
(1662, 199, '鼎城区', 3),
(1663, 199, '津市市', 3),
(1664, 199, '安乡县', 3),
(1665, 199, '汉寿县', 3),
(1666, 199, '澧县', 3),
(1667, 199, '临澧县', 3),
(1668, 199, '桃源县', 3),
(1669, 199, '石门县', 3),
(1670, 200, '北湖区', 3),
(1671, 200, '苏仙区', 3),
(1672, 200, '资兴市', 3),
(1673, 200, '桂阳县', 3),
(1674, 200, '宜章县', 3),
(1675, 200, '永兴县', 3),
(1676, 200, '嘉禾县', 3),
(1677, 200, '临武县', 3),
(1678, 200, '汝城县', 3),
(1679, 200, '桂东县', 3),
(1680, 200, '安仁县', 3),
(1681, 201, '雁峰区', 3),
(1682, 201, '珠晖区', 3),
(1683, 201, '石鼓区', 3),
(1684, 201, '蒸湘区', 3),
(1685, 201, '南岳区', 3),
(1686, 201, '耒阳市', 3),
(1687, 201, '常宁市', 3),
(1688, 201, '衡阳县', 3),
(1689, 201, '衡南县', 3),
(1690, 201, '衡山县', 3),
(1691, 201, '衡东县', 3),
(1692, 201, '祁东县', 3),
(1693, 202, '鹤城区', 3),
(1694, 202, '靖州', 3),
(1695, 202, '麻阳', 3),
(1696, 202, '通道', 3),
(1697, 202, '新晃', 3),
(1698, 202, '芷江', 3),
(1699, 202, '沅陵县', 3),
(1700, 202, '辰溪县', 3),
(1701, 202, '溆浦县', 3),
(1702, 202, '中方县', 3),
(1703, 202, '会同县', 3),
(1704, 202, '洪江市', 3),
(1705, 203, '娄星区', 3),
(1706, 203, '冷水江市', 3),
(1707, 203, '涟源市', 3),
(1708, 203, '双峰县', 3),
(1709, 203, '新化县', 3),
(1710, 204, '城步', 3),
(1711, 204, '双清区', 3),
(1712, 204, '大祥区', 3),
(1713, 204, '北塔区', 3),
(1714, 204, '武冈市', 3),
(1715, 204, '邵东县', 3),
(1716, 204, '新邵县', 3),
(1717, 204, '邵阳县', 3),
(1718, 204, '隆回县', 3),
(1719, 204, '洞口县', 3),
(1720, 204, '绥宁县', 3),
(1721, 204, '新宁县', 3),
(1722, 205, '岳塘区', 3),
(1723, 205, '雨湖区', 3),
(1724, 205, '湘乡市', 3),
(1725, 205, '韶山市', 3),
(1726, 205, '湘潭县', 3),
(1727, 206, '吉首市', 3),
(1728, 206, '泸溪县', 3),
(1729, 206, '凤凰县', 3),
(1730, 206, '花垣县', 3),
(1731, 206, '保靖县', 3),
(1732, 206, '古丈县', 3),
(1733, 206, '永顺县', 3),
(1734, 206, '龙山县', 3),
(1735, 207, '赫山区', 3),
(1736, 207, '资阳区', 3),
(1737, 207, '沅江市', 3),
(1738, 207, '南县', 3),
(1739, 207, '桃江县', 3),
(1740, 207, '安化县', 3),
(1741, 208, '江华', 3),
(1742, 208, '冷水滩区', 3),
(1743, 208, '零陵区', 3),
(1744, 208, '祁阳县', 3),
(1745, 208, '东安县', 3),
(1746, 208, '双牌县', 3),
(1747, 208, '道县', 3),
(1748, 208, '江永县', 3),
(1749, 208, '宁远县', 3),
(1750, 208, '蓝山县', 3),
(1751, 208, '新田县', 3),
(1752, 209, '岳阳楼区', 3),
(1753, 209, '君山区', 3),
(1754, 209, '云溪区', 3),
(1755, 209, '汨罗市', 3),
(1756, 209, '临湘市', 3),
(1757, 209, '岳阳县', 3),
(1758, 209, '华容县', 3),
(1759, 209, '湘阴县', 3),
(1760, 209, '平江县', 3),
(1761, 210, '天元区', 3),
(1762, 210, '荷塘区', 3),
(1763, 210, '芦淞区', 3),
(1764, 210, '石峰区', 3),
(1765, 210, '醴陵市', 3),
(1766, 210, '株洲县', 3),
(1767, 210, '攸县', 3),
(1768, 210, '茶陵县', 3),
(1769, 210, '炎陵县', 3),
(1770, 211, '朝阳区', 3),
(1771, 211, '宽城区', 3),
(1772, 211, '二道区', 3),
(1773, 211, '南关区', 3),
(1774, 211, '绿园区', 3),
(1775, 211, '双阳区', 3),
(1776, 211, '净月潭开发区', 3),
(1777, 211, '高新技术开发区', 3),
(1778, 211, '经济技术开发区', 3),
(1779, 211, '汽车产业开发区', 3),
(1780, 211, '德惠市', 3),
(1781, 211, '九台市', 3),
(1782, 211, '榆树市', 3),
(1783, 211, '农安县', 3),
(1784, 212, '船营区', 3),
(1785, 212, '昌邑区', 3),
(1786, 212, '龙潭区', 3),
(1787, 212, '丰满区', 3),
(1788, 212, '蛟河市', 3),
(1789, 212, '桦甸市', 3),
(1790, 212, '舒兰市', 3),
(1791, 212, '磐石市', 3),
(1792, 212, '永吉县', 3),
(1793, 213, '洮北区', 3),
(1794, 213, '洮南市', 3),
(1795, 213, '大安市', 3),
(1796, 213, '镇赉县', 3),
(1797, 213, '通榆县', 3),
(1798, 214, '江源区', 3),
(1799, 214, '八道江区', 3),
(1800, 214, '长白', 3),
(1801, 214, '临江市', 3),
(1802, 214, '抚松县', 3),
(1803, 214, '靖宇县', 3),
(1804, 215, '龙山区', 3),
(1805, 215, '西安区', 3),
(1806, 215, '东丰县', 3),
(1807, 215, '东辽县', 3),
(1808, 216, '铁西区', 3),
(1809, 216, '铁东区', 3),
(1810, 216, '伊通', 3),
(1811, 216, '公主岭市', 3),
(1812, 216, '双辽市', 3),
(1813, 216, '梨树县', 3),
(1814, 217, '前郭尔罗斯', 3),
(1815, 217, '宁江区', 3),
(1816, 217, '长岭县', 3),
(1817, 217, '乾安县', 3),
(1818, 217, '扶余县', 3),
(1819, 218, '东昌区', 3),
(1820, 218, '二道江区', 3),
(1821, 218, '梅河口市', 3),
(1822, 218, '集安市', 3),
(1823, 218, '通化县', 3),
(1824, 218, '辉南县', 3),
(1825, 218, '柳河县', 3),
(1826, 219, '延吉市', 3),
(1827, 219, '图们市', 3),
(1828, 219, '敦化市', 3),
(1829, 219, '珲春市', 3),
(1830, 219, '龙井市', 3),
(1831, 219, '和龙市', 3),
(1832, 219, '安图县', 3),
(1833, 219, '汪清县', 3),
(1834, 220, '玄武区', 3),
(1835, 220, '鼓楼区', 3),
(1836, 220, '白下区', 3),
(1837, 220, '建邺区', 3),
(1838, 220, '秦淮区', 3),
(1839, 220, '雨花台区', 3),
(1840, 220, '下关区', 3),
(1841, 220, '栖霞区', 3),
(1842, 220, '浦口区', 3),
(1843, 220, '江宁区', 3),
(1844, 220, '六合区', 3),
(1845, 220, '溧水县', 3),
(1846, 220, '高淳县', 3),
(1847, 221, '沧浪区', 3),
(1848, 221, '金阊区', 3),
(1849, 221, '平江区', 3),
(1850, 221, '虎丘区', 3),
(1851, 221, '吴中区', 3),
(1852, 221, '相城区', 3),
(1853, 221, '园区', 3),
(1854, 221, '新区', 3),
(1855, 221, '常熟市', 3),
(1856, 221, '张家港市', 3),
(1857, 221, '玉山镇', 3),
(1858, 221, '巴城镇', 3),
(1859, 221, '周市镇', 3),
(1860, 221, '陆家镇', 3),
(1861, 221, '花桥镇', 3),
(1862, 221, '淀山湖镇', 3),
(1863, 221, '张浦镇', 3),
(1864, 221, '周庄镇', 3),
(1865, 221, '千灯镇', 3),
(1866, 221, '锦溪镇', 3),
(1867, 221, '开发区', 3),
(1868, 221, '吴江市', 3),
(1869, 221, '太仓市', 3),
(1870, 222, '崇安区', 3),
(1871, 222, '北塘区', 3),
(1872, 222, '南长区', 3),
(1873, 222, '锡山区', 3),
(1874, 222, '惠山区', 3),
(1875, 222, '滨湖区', 3),
(1876, 222, '新区', 3),
(1877, 222, '江阴市', 3),
(1878, 222, '宜兴市', 3),
(1879, 223, '天宁区', 3),
(1880, 223, '钟楼区', 3),
(1881, 223, '戚墅堰区', 3),
(1882, 223, '郊区', 3),
(1883, 223, '新北区', 3),
(1884, 223, '武进区', 3),
(1885, 223, '溧阳市', 3),
(1886, 223, '金坛市', 3),
(1887, 224, '清河区', 3),
(1888, 224, '清浦区', 3),
(1889, 224, '楚州区', 3),
(1890, 224, '淮阴区', 3),
(1891, 224, '涟水县', 3),
(1892, 224, '洪泽县', 3),
(1893, 224, '盱眙县', 3),
(1894, 224, '金湖县', 3),
(1895, 225, '新浦区', 3),
(1896, 225, '连云区', 3),
(1897, 225, '海州区', 3),
(1898, 225, '赣榆县', 3),
(1899, 225, '东海县', 3),
(1900, 225, '灌云县', 3),
(1901, 225, '灌南县', 3),
(1902, 226, '崇川区', 3),
(1903, 226, '港闸区', 3),
(1904, 226, '经济开发区', 3),
(1905, 226, '启东市', 3),
(1906, 226, '如皋市', 3),
(1907, 226, '通州市', 3),
(1908, 226, '海门市', 3),
(1909, 226, '海安县', 3),
(1910, 226, '如东县', 3),
(1911, 227, '宿城区', 3),
(1912, 227, '宿豫区', 3),
(1913, 227, '宿豫县', 3),
(1914, 227, '沭阳县', 3),
(1915, 227, '泗阳县', 3),
(1916, 227, '泗洪县', 3),
(1917, 228, '海陵区', 3),
(1918, 228, '高港区', 3),
(1919, 228, '兴化市', 3),
(1920, 228, '靖江市', 3),
(1921, 228, '泰兴市', 3),
(1922, 228, '姜堰市', 3),
(1923, 229, '云龙区', 3),
(1924, 229, '鼓楼区', 3),
(1925, 229, '九里区', 3),
(1926, 229, '贾汪区', 3),
(1927, 229, '泉山区', 3),
(1928, 229, '新沂市', 3),
(1929, 229, '邳州市', 3),
(1930, 229, '丰县', 3),
(1931, 229, '沛县', 3),
(1932, 229, '铜山县', 3),
(1933, 229, '睢宁县', 3),
(1934, 230, '城区', 3),
(1935, 230, '亭湖区', 3),
(1936, 230, '盐都区', 3),
(1937, 230, '盐都县', 3),
(1938, 230, '东台市', 3),
(1939, 230, '大丰市', 3),
(1940, 230, '响水县', 3),
(1941, 230, '滨海县', 3),
(1942, 230, '阜宁县', 3),
(1943, 230, '射阳县', 3),
(1944, 230, '建湖县', 3),
(1945, 231, '广陵区', 3),
(1946, 231, '维扬区', 3),
(1947, 231, '邗江区', 3),
(1948, 231, '仪征市', 3),
(1949, 231, '高邮市', 3),
(1950, 231, '江都市', 3),
(1951, 231, '宝应县', 3),
(1952, 232, '京口区', 3),
(1953, 232, '润州区', 3),
(1954, 232, '丹徒区', 3),
(1955, 232, '丹阳市', 3),
(1956, 232, '扬中市', 3),
(1957, 232, '句容市', 3),
(1958, 233, '东湖区', 3),
(1959, 233, '西湖区', 3),
(1960, 233, '青云谱区', 3),
(1961, 233, '湾里区', 3),
(1962, 233, '青山湖区', 3),
(1963, 233, '红谷滩新区', 3),
(1964, 233, '昌北区', 3),
(1965, 233, '高新区', 3),
(1966, 233, '南昌县', 3),
(1967, 233, '新建县', 3),
(1968, 233, '安义县', 3),
(1969, 233, '进贤县', 3),
(1970, 234, '临川区', 3),
(1971, 234, '南城县', 3),
(1972, 234, '黎川县', 3),
(1973, 234, '南丰县', 3),
(1974, 234, '崇仁县', 3),
(1975, 234, '乐安县', 3),
(1976, 234, '宜黄县', 3),
(1977, 234, '金溪县', 3),
(1978, 234, '资溪县', 3),
(1979, 234, '东乡县', 3),
(1980, 234, '广昌县', 3),
(1981, 235, '章贡区', 3),
(1982, 235, '于都县', 3),
(1983, 235, '瑞金市', 3),
(1984, 235, '南康市', 3),
(1985, 235, '赣县', 3),
(1986, 235, '信丰县', 3),
(1987, 235, '大余县', 3),
(1988, 235, '上犹县', 3),
(1989, 235, '崇义县', 3),
(1990, 235, '安远县', 3),
(1991, 235, '龙南县', 3),
(1992, 235, '定南县', 3),
(1993, 235, '全南县', 3),
(1994, 235, '宁都县', 3),
(1995, 235, '兴国县', 3),
(1996, 235, '会昌县', 3),
(1997, 235, '寻乌县', 3),
(1998, 235, '石城县', 3),
(1999, 236, '安福县', 3),
(2000, 236, '吉州区', 3),
(2001, 236, '青原区', 3),
(2002, 236, '井冈山市', 3),
(2003, 236, '吉安县', 3),
(2004, 236, '吉水县', 3),
(2005, 236, '峡江县', 3),
(2006, 236, '新干县', 3),
(2007, 236, '永丰县', 3),
(2008, 236, '泰和县', 3),
(2009, 236, '遂川县', 3),
(2010, 236, '万安县', 3),
(2011, 236, '永新县', 3),
(2012, 237, '珠山区', 3),
(2013, 237, '昌江区', 3),
(2014, 237, '乐平市', 3),
(2015, 237, '浮梁县', 3),
(2016, 238, '浔阳区', 3),
(2017, 238, '庐山区', 3),
(2018, 238, '瑞昌市', 3),
(2019, 238, '九江县', 3),
(2020, 238, '武宁县', 3),
(2021, 238, '修水县', 3),
(2022, 238, '永修县', 3),
(2023, 238, '德安县', 3),
(2024, 238, '星子县', 3),
(2025, 238, '都昌县', 3),
(2026, 238, '湖口县', 3),
(2027, 238, '彭泽县', 3),
(2028, 239, '安源区', 3),
(2029, 239, '湘东区', 3),
(2030, 239, '莲花县', 3),
(2031, 239, '芦溪县', 3),
(2032, 239, '上栗县', 3),
(2033, 240, '信州区', 3),
(2034, 240, '德兴市', 3),
(2035, 240, '上饶县', 3),
(2036, 240, '广丰县', 3),
(2037, 240, '玉山县', 3),
(2038, 240, '铅山县', 3),
(2039, 240, '横峰县', 3),
(2040, 240, '弋阳县', 3),
(2041, 240, '余干县', 3),
(2042, 240, '波阳县', 3),
(2043, 240, '万年县', 3),
(2044, 240, '婺源县', 3),
(2045, 241, '渝水区', 3),
(2046, 241, '分宜县', 3),
(2047, 242, '袁州区', 3),
(2048, 242, '丰城市', 3),
(2049, 242, '樟树市', 3),
(2050, 242, '高安市', 3),
(2051, 242, '奉新县', 3),
(2052, 242, '万载县', 3),
(2053, 242, '上高县', 3),
(2054, 242, '宜丰县', 3),
(2055, 242, '靖安县', 3),
(2056, 242, '铜鼓县', 3),
(2057, 243, '月湖区', 3),
(2058, 243, '贵溪市', 3),
(2059, 243, '余江县', 3),
(2060, 244, '沈河区', 3),
(2061, 244, '皇姑区', 3),
(2062, 244, '和平区', 3),
(2063, 244, '大东区', 3),
(2064, 244, '铁西区', 3),
(2065, 244, '苏家屯区', 3),
(2066, 244, '东陵区', 3),
(2067, 244, '沈北新区', 3),
(2068, 244, '于洪区', 3),
(2069, 244, '浑南新区', 3),
(2070, 244, '新民市', 3),
(2071, 244, '辽中县', 3),
(2072, 244, '康平县', 3),
(2073, 244, '法库县', 3),
(2074, 245, '西岗区', 3),
(2075, 245, '中山区', 3),
(2076, 245, '沙河口区', 3),
(2077, 245, '甘井子区', 3),
(2078, 245, '旅顺口区', 3),
(2079, 245, '金州区', 3),
(2080, 245, '开发区', 3),
(2081, 245, '瓦房店市', 3),
(2082, 245, '普兰店市', 3),
(2083, 245, '庄河市', 3),
(2084, 245, '长海县', 3),
(2085, 246, '铁东区', 3),
(2086, 246, '铁西区', 3),
(2087, 246, '立山区', 3),
(2088, 246, '千山区', 3),
(2089, 246, '岫岩', 3),
(2090, 246, '海城市', 3),
(2091, 246, '台安县', 3),
(2092, 247, '本溪', 3),
(2093, 247, '平山区', 3),
(2094, 247, '明山区', 3),
(2095, 247, '溪湖区', 3),
(2096, 247, '南芬区', 3),
(2097, 247, '桓仁', 3),
(2098, 248, '双塔区', 3),
(2099, 248, '龙城区', 3),
(2100, 248, '喀喇沁左翼蒙古族自治县', 3),
(2101, 248, '北票市', 3),
(2102, 248, '凌源市', 3),
(2103, 248, '朝阳县', 3),
(2104, 248, '建平县', 3),
(2105, 249, '振兴区', 3),
(2106, 249, '元宝区', 3),
(2107, 249, '振安区', 3),
(2108, 249, '宽甸', 3),
(2109, 249, '东港市', 3),
(2110, 249, '凤城市', 3),
(2111, 250, '顺城区', 3),
(2112, 250, '新抚区', 3),
(2113, 250, '东洲区', 3),
(2114, 250, '望花区', 3),
(2115, 250, '清原', 3),
(2116, 250, '新宾', 3),
(2117, 250, '抚顺县', 3),
(2118, 251, '阜新', 3),
(2119, 251, '海州区', 3),
(2120, 251, '新邱区', 3),
(2121, 251, '太平区', 3),
(2122, 251, '清河门区', 3),
(2123, 251, '细河区', 3),
(2124, 251, '彰武县', 3),
(2125, 252, '龙港区', 3),
(2126, 252, '南票区', 3),
(2127, 252, '连山区', 3),
(2128, 252, '兴城市', 3),
(2129, 252, '绥中县', 3),
(2130, 252, '建昌县', 3),
(2131, 253, '太和区', 3),
(2132, 253, '古塔区', 3),
(2133, 253, '凌河区', 3),
(2134, 253, '凌海市', 3),
(2135, 253, '北镇市', 3),
(2136, 253, '黑山县', 3),
(2137, 253, '义县', 3),
(2138, 254, '白塔区', 3),
(2139, 254, '文圣区', 3),
(2140, 254, '宏伟区', 3),
(2141, 254, '太子河区', 3),
(2142, 254, '弓长岭区', 3),
(2143, 254, '灯塔市', 3),
(2144, 254, '辽阳县', 3),
(2145, 255, '双台子区', 3),
(2146, 255, '兴隆台区', 3),
(2147, 255, '大洼县', 3),
(2148, 255, '盘山县', 3),
(2149, 256, '银州区', 3),
(2150, 256, '清河区', 3),
(2151, 256, '调兵山市', 3),
(2152, 256, '开原市', 3),
(2153, 256, '铁岭县', 3),
(2154, 256, '西丰县', 3),
(2155, 256, '昌图县', 3),
(2156, 257, '站前区', 3),
(2157, 257, '西市区', 3),
(2158, 257, '鲅鱼圈区', 3),
(2159, 257, '老边区', 3),
(2160, 257, '盖州市', 3),
(2161, 257, '大石桥市', 3),
(2162, 258, '回民区', 3),
(2163, 258, '玉泉区', 3),
(2164, 258, '新城区', 3),
(2165, 258, '赛罕区', 3),
(2166, 258, '清水河县', 3),
(2167, 258, '土默特左旗', 3),
(2168, 258, '托克托县', 3),
(2169, 258, '和林格尔县', 3),
(2170, 258, '武川县', 3),
(2171, 259, '阿拉善左旗', 3),
(2172, 259, '阿拉善右旗', 3),
(2173, 259, '额济纳旗', 3),
(2174, 260, '临河区', 3),
(2175, 260, '五原县', 3),
(2176, 260, '磴口县', 3),
(2177, 260, '乌拉特前旗', 3),
(2178, 260, '乌拉特中旗', 3),
(2179, 260, '乌拉特后旗', 3),
(2180, 260, '杭锦后旗', 3),
(2181, 261, '昆都仑区', 3),
(2182, 261, '青山区', 3),
(2183, 261, '东河区', 3),
(2184, 261, '九原区', 3),
(2185, 261, '石拐区', 3),
(2186, 261, '白云矿区', 3),
(2187, 261, '土默特右旗', 3),
(2188, 261, '固阳县', 3),
(2189, 261, '达尔罕茂明安联合旗', 3),
(2190, 262, '红山区', 3),
(2191, 262, '元宝山区', 3),
(2192, 262, '松山区', 3),
(2193, 262, '阿鲁科尔沁旗', 3),
(2194, 262, '巴林左旗', 3),
(2195, 262, '巴林右旗', 3),
(2196, 262, '林西县', 3),
(2197, 262, '克什克腾旗', 3),
(2198, 262, '翁牛特旗', 3),
(2199, 262, '喀喇沁旗', 3),
(2200, 262, '宁城县', 3),
(2201, 262, '敖汉旗', 3),
(2202, 263, '东胜区', 3),
(2203, 263, '达拉特旗', 3),
(2204, 263, '准格尔旗', 3),
(2205, 263, '鄂托克前旗', 3),
(2206, 263, '鄂托克旗', 3),
(2207, 263, '杭锦旗', 3),
(2208, 263, '乌审旗', 3),
(2209, 263, '伊金霍洛旗', 3),
(2210, 264, '海拉尔区', 3),
(2211, 264, '莫力达瓦', 3),
(2212, 264, '满洲里市', 3),
(2213, 264, '牙克石市', 3),
(2214, 264, '扎兰屯市', 3),
(2215, 264, '额尔古纳市', 3),
(2216, 264, '根河市', 3),
(2217, 264, '阿荣旗', 3),
(2218, 264, '鄂伦春自治旗', 3),
(2219, 264, '鄂温克族自治旗', 3),
(2220, 264, '陈巴尔虎旗', 3),
(2221, 264, '新巴尔虎左旗', 3),
(2222, 264, '新巴尔虎右旗', 3),
(2223, 265, '科尔沁区', 3),
(2224, 265, '霍林郭勒市', 3),
(2225, 265, '科尔沁左翼中旗', 3),
(2226, 265, '科尔沁左翼后旗', 3),
(2227, 265, '开鲁县', 3),
(2228, 265, '库伦旗', 3),
(2229, 265, '奈曼旗', 3),
(2230, 265, '扎鲁特旗', 3),
(2231, 266, '海勃湾区', 3),
(2232, 266, '乌达区', 3),
(2233, 266, '海南区', 3),
(2234, 267, '化德县', 3),
(2235, 267, '集宁区', 3),
(2236, 267, '丰镇市', 3),
(2237, 267, '卓资县', 3),
(2238, 267, '商都县', 3),
(2239, 267, '兴和县', 3),
(2240, 267, '凉城县', 3),
(2241, 267, '察哈尔右翼前旗', 3),
(2242, 267, '察哈尔右翼中旗', 3),
(2243, 267, '察哈尔右翼后旗', 3),
(2244, 267, '四子王旗', 3),
(2245, 268, '二连浩特市', 3),
(2246, 268, '锡林浩特市', 3),
(2247, 268, '阿巴嘎旗', 3),
(2248, 268, '苏尼特左旗', 3),
(2249, 268, '苏尼特右旗', 3),
(2250, 268, '东乌珠穆沁旗', 3),
(2251, 268, '西乌珠穆沁旗', 3),
(2252, 268, '太仆寺旗', 3),
(2253, 268, '镶黄旗', 3),
(2254, 268, '正镶白旗', 3),
(2255, 268, '正蓝旗', 3),
(2256, 268, '多伦县', 3),
(2257, 269, '乌兰浩特市', 3),
(2258, 269, '阿尔山市', 3),
(2259, 269, '科尔沁右翼前旗', 3),
(2260, 269, '科尔沁右翼中旗', 3),
(2261, 269, '扎赉特旗', 3),
(2262, 269, '突泉县', 3),
(2263, 270, '西夏区', 3),
(2264, 270, '金凤区', 3),
(2265, 270, '兴庆区', 3),
(2266, 270, '灵武市', 3),
(2267, 270, '永宁县', 3),
(2268, 270, '贺兰县', 3),
(2269, 271, '原州区', 3),
(2270, 271, '海原县', 3),
(2271, 271, '西吉县', 3),
(2272, 271, '隆德县', 3),
(2273, 271, '泾源县', 3),
(2274, 271, '彭阳县', 3),
(2275, 272, '惠农县', 3),
(2276, 272, '大武口区', 3),
(2277, 272, '惠农区', 3),
(2278, 272, '陶乐县', 3),
(2279, 272, '平罗县', 3),
(2280, 273, '利通区', 3),
(2281, 273, '中卫县', 3),
(2282, 273, '青铜峡市', 3),
(2283, 273, '中宁县', 3),
(2284, 273, '盐池县', 3),
(2285, 273, '同心县', 3),
(2286, 274, '沙坡头区', 3),
(2287, 274, '海原县', 3),
(2288, 274, '中宁县', 3),
(2289, 275, '城中区', 3),
(2290, 275, '城东区', 3),
(2291, 275, '城西区', 3),
(2292, 275, '城北区', 3),
(2293, 275, '湟中县', 3),
(2294, 275, '湟源县', 3),
(2295, 275, '大通', 3),
(2296, 276, '玛沁县', 3),
(2297, 276, '班玛县', 3),
(2298, 276, '甘德县', 3),
(2299, 276, '达日县', 3),
(2300, 276, '久治县', 3),
(2301, 276, '玛多县', 3),
(2302, 277, '海晏县', 3),
(2303, 277, '祁连县', 3),
(2304, 277, '刚察县', 3),
(2305, 277, '门源', 3),
(2306, 278, '平安县', 3),
(2307, 278, '乐都县', 3),
(2308, 278, '民和', 3),
(2309, 278, '互助', 3),
(2310, 278, '化隆', 3),
(2311, 278, '循化', 3),
(2312, 279, '共和县', 3),
(2313, 279, '同德县', 3),
(2314, 279, '贵德县', 3),
(2315, 279, '兴海县', 3),
(2316, 279, '贵南县', 3),
(2317, 280, '德令哈市', 3),
(2318, 280, '格尔木市', 3),
(2319, 280, '乌兰县', 3),
(2320, 280, '都兰县', 3),
(2321, 280, '天峻县', 3),
(2322, 281, '同仁县', 3),
(2323, 281, '尖扎县', 3),
(2324, 281, '泽库县', 3),
(2325, 281, '河南蒙古族自治县', 3),
(2326, 282, '玉树县', 3),
(2327, 282, '杂多县', 3),
(2328, 282, '称多县', 3),
(2329, 282, '治多县', 3),
(2330, 282, '囊谦县', 3),
(2331, 282, '曲麻莱县', 3),
(2332, 283, '市中区', 3),
(2333, 283, '历下区', 3),
(2334, 283, '天桥区', 3),
(2335, 283, '槐荫区', 3),
(2336, 283, '历城区', 3),
(2337, 283, '长清区', 3),
(2338, 283, '章丘市', 3),
(2339, 283, '平阴县', 3),
(2340, 283, '济阳县', 3),
(2341, 283, '商河县', 3),
(2342, 284, '市南区', 3),
(2343, 284, '市北区', 3),
(2344, 284, '城阳区', 3),
(2345, 284, '四方区', 3),
(2346, 284, '李沧区', 3),
(2347, 284, '黄岛区', 3),
(2348, 284, '崂山区', 3),
(2349, 284, '胶州市', 3),
(2350, 284, '即墨市', 3),
(2351, 284, '平度市', 3),
(2352, 284, '胶南市', 3),
(2353, 284, '莱西市', 3),
(2354, 285, '滨城区', 3),
(2355, 285, '惠民县', 3),
(2356, 285, '阳信县', 3),
(2357, 285, '无棣县', 3),
(2358, 285, '沾化县', 3),
(2359, 285, '博兴县', 3),
(2360, 285, '邹平县', 3),
(2361, 286, '德城区', 3),
(2362, 286, '陵县', 3),
(2363, 286, '乐陵市', 3),
(2364, 286, '禹城市', 3),
(2365, 286, '宁津县', 3),
(2366, 286, '庆云县', 3),
(2367, 286, '临邑县', 3),
(2368, 286, '齐河县', 3),
(2369, 286, '平原县', 3),
(2370, 286, '夏津县', 3),
(2371, 286, '武城县', 3),
(2372, 287, '东营区', 3),
(2373, 287, '河口区', 3),
(2374, 287, '垦利县', 3),
(2375, 287, '利津县', 3),
(2376, 287, '广饶县', 3),
(2377, 288, '牡丹区', 3),
(2378, 288, '曹县', 3),
(2379, 288, '单县', 3),
(2380, 288, '成武县', 3),
(2381, 288, '巨野县', 3),
(2382, 288, '郓城县', 3),
(2383, 288, '鄄城县', 3),
(2384, 288, '定陶县', 3),
(2385, 288, '东明县', 3),
(2386, 289, '市中区', 3),
(2387, 289, '任城区', 3),
(2388, 289, '曲阜市', 3),
(2389, 289, '兖州市', 3),
(2390, 289, '邹城市', 3),
(2391, 289, '微山县', 3),
(2392, 289, '鱼台县', 3),
(2393, 289, '金乡县', 3),
(2394, 289, '嘉祥县', 3),
(2395, 289, '汶上县', 3),
(2396, 289, '泗水县', 3),
(2397, 289, '梁山县', 3),
(2398, 290, '莱城区', 3),
(2399, 290, '钢城区', 3),
(2400, 291, '东昌府区', 3),
(2401, 291, '临清市', 3),
(2402, 291, '阳谷县', 3),
(2403, 291, '莘县', 3),
(2404, 291, '茌平县', 3),
(2405, 291, '东阿县', 3),
(2406, 291, '冠县', 3),
(2407, 291, '高唐县', 3),
(2408, 292, '兰山区', 3),
(2409, 292, '罗庄区', 3),
(2410, 292, '河东区', 3),
(2411, 292, '沂南县', 3),
(2412, 292, '郯城县', 3),
(2413, 292, '沂水县', 3),
(2414, 292, '苍山县', 3),
(2415, 292, '费县', 3),
(2416, 292, '平邑县', 3),
(2417, 292, '莒南县', 3),
(2418, 292, '蒙阴县', 3),
(2419, 292, '临沭县', 3),
(2420, 293, '东港区', 3),
(2421, 293, '岚山区', 3),
(2422, 293, '五莲县', 3),
(2423, 293, '莒县', 3),
(2424, 294, '泰山区', 3),
(2425, 294, '岱岳区', 3),
(2426, 294, '新泰市', 3),
(2427, 294, '肥城市', 3),
(2428, 294, '宁阳县', 3),
(2429, 294, '东平县', 3),
(2430, 295, '荣成市', 3),
(2431, 295, '乳山市', 3),
(2432, 295, '环翠区', 3),
(2433, 295, '文登市', 3),
(2434, 296, '潍城区', 3),
(2435, 296, '寒亭区', 3),
(2436, 296, '坊子区', 3),
(2437, 296, '奎文区', 3),
(2438, 296, '青州市', 3),
(2439, 296, '诸城市', 3),
(2440, 296, '寿光市', 3),
(2441, 296, '安丘市', 3),
(2442, 296, '高密市', 3),
(2443, 296, '昌邑市', 3),
(2444, 296, '临朐县', 3),
(2445, 296, '昌乐县', 3),
(2446, 297, '芝罘区', 3),
(2447, 297, '福山区', 3),
(2448, 297, '牟平区', 3),
(2449, 297, '莱山区', 3),
(2450, 297, '开发区', 3),
(2451, 297, '龙口市', 3),
(2452, 297, '莱阳市', 3),
(2453, 297, '莱州市', 3),
(2454, 297, '蓬莱市', 3),
(2455, 297, '招远市', 3),
(2456, 297, '栖霞市', 3),
(2457, 297, '海阳市', 3),
(2458, 297, '长岛县', 3),
(2459, 298, '市中区', 3),
(2460, 298, '山亭区', 3),
(2461, 298, '峄城区', 3),
(2462, 298, '台儿庄区', 3),
(2463, 298, '薛城区', 3),
(2464, 298, '滕州市', 3),
(2465, 299, '张店区', 3),
(2466, 299, '临淄区', 3),
(2467, 299, '淄川区', 3),
(2468, 299, '博山区', 3),
(2469, 299, '周村区', 3),
(2470, 299, '桓台县', 3),
(2471, 299, '高青县', 3),
(2472, 299, '沂源县', 3),
(2473, 300, '杏花岭区', 3),
(2474, 300, '小店区', 3),
(2475, 300, '迎泽区', 3),
(2476, 300, '尖草坪区', 3),
(2477, 300, '万柏林区', 3),
(2478, 300, '晋源区', 3),
(2479, 300, '高新开发区', 3),
(2480, 300, '民营经济开发区', 3),
(2481, 300, '经济技术开发区', 3),
(2482, 300, '清徐县', 3),
(2483, 300, '阳曲县', 3),
(2484, 300, '娄烦县', 3),
(2485, 300, '古交市', 3),
(2486, 301, '城区', 3),
(2487, 301, '郊区', 3);
INSERT INTO `cool_region` (`id`, `pid`, `name`, `type`) VALUES
(2488, 301, '沁县', 3),
(2489, 301, '潞城市', 3),
(2490, 301, '长治县', 3),
(2491, 301, '襄垣县', 3),
(2492, 301, '屯留县', 3),
(2493, 301, '平顺县', 3),
(2494, 301, '黎城县', 3),
(2495, 301, '壶关县', 3),
(2496, 301, '长子县', 3),
(2497, 301, '武乡县', 3),
(2498, 301, '沁源县', 3),
(2499, 302, '城区', 3),
(2500, 302, '矿区', 3),
(2501, 302, '南郊区', 3),
(2502, 302, '新荣区', 3),
(2503, 302, '阳高县', 3),
(2504, 302, '天镇县', 3),
(2505, 302, '广灵县', 3),
(2506, 302, '灵丘县', 3),
(2507, 302, '浑源县', 3),
(2508, 302, '左云县', 3),
(2509, 302, '大同县', 3),
(2510, 303, '城区', 3),
(2511, 303, '高平市', 3),
(2512, 303, '沁水县', 3),
(2513, 303, '阳城县', 3),
(2514, 303, '陵川县', 3),
(2515, 303, '泽州县', 3),
(2516, 304, '榆次区', 3),
(2517, 304, '介休市', 3),
(2518, 304, '榆社县', 3),
(2519, 304, '左权县', 3),
(2520, 304, '和顺县', 3),
(2521, 304, '昔阳县', 3),
(2522, 304, '寿阳县', 3),
(2523, 304, '太谷县', 3),
(2524, 304, '祁县', 3),
(2525, 304, '平遥县', 3),
(2526, 304, '灵石县', 3),
(2527, 305, '尧都区', 3),
(2528, 305, '侯马市', 3),
(2529, 305, '霍州市', 3),
(2530, 305, '曲沃县', 3),
(2531, 305, '翼城县', 3),
(2532, 305, '襄汾县', 3),
(2533, 305, '洪洞县', 3),
(2534, 305, '吉县', 3),
(2535, 305, '安泽县', 3),
(2536, 305, '浮山县', 3),
(2537, 305, '古县', 3),
(2538, 305, '乡宁县', 3),
(2539, 305, '大宁县', 3),
(2540, 305, '隰县', 3),
(2541, 305, '永和县', 3),
(2542, 305, '蒲县', 3),
(2543, 305, '汾西县', 3),
(2544, 306, '离石市', 3),
(2545, 306, '离石区', 3),
(2546, 306, '孝义市', 3),
(2547, 306, '汾阳市', 3),
(2548, 306, '文水县', 3),
(2549, 306, '交城县', 3),
(2550, 306, '兴县', 3),
(2551, 306, '临县', 3),
(2552, 306, '柳林县', 3),
(2553, 306, '石楼县', 3),
(2554, 306, '岚县', 3),
(2555, 306, '方山县', 3),
(2556, 306, '中阳县', 3),
(2557, 306, '交口县', 3),
(2558, 307, '朔城区', 3),
(2559, 307, '平鲁区', 3),
(2560, 307, '山阴县', 3),
(2561, 307, '应县', 3),
(2562, 307, '右玉县', 3),
(2563, 307, '怀仁县', 3),
(2564, 308, '忻府区', 3),
(2565, 308, '原平市', 3),
(2566, 308, '定襄县', 3),
(2567, 308, '五台县', 3),
(2568, 308, '代县', 3),
(2569, 308, '繁峙县', 3),
(2570, 308, '宁武县', 3),
(2571, 308, '静乐县', 3),
(2572, 308, '神池县', 3),
(2573, 308, '五寨县', 3),
(2574, 308, '岢岚县', 3),
(2575, 308, '河曲县', 3),
(2576, 308, '保德县', 3),
(2577, 308, '偏关县', 3),
(2578, 309, '城区', 3),
(2579, 309, '矿区', 3),
(2580, 309, '郊区', 3),
(2581, 309, '平定县', 3),
(2582, 309, '盂县', 3),
(2583, 310, '盐湖区', 3),
(2584, 310, '永济市', 3),
(2585, 310, '河津市', 3),
(2586, 310, '临猗县', 3),
(2587, 310, '万荣县', 3),
(2588, 310, '闻喜县', 3),
(2589, 310, '稷山县', 3),
(2590, 310, '新绛县', 3),
(2591, 310, '绛县', 3),
(2592, 310, '垣曲县', 3),
(2593, 310, '夏县', 3),
(2594, 310, '平陆县', 3),
(2595, 310, '芮城县', 3),
(2596, 311, '莲湖区', 3),
(2597, 311, '新城区', 3),
(2598, 311, '碑林区', 3),
(2599, 311, '雁塔区', 3),
(2600, 311, '灞桥区', 3),
(2601, 311, '未央区', 3),
(2602, 311, '阎良区', 3),
(2603, 311, '临潼区', 3),
(2604, 311, '长安区', 3),
(2605, 311, '蓝田县', 3),
(2606, 311, '周至县', 3),
(2607, 311, '户县', 3),
(2608, 311, '高陵县', 3),
(2609, 312, '汉滨区', 3),
(2610, 312, '汉阴县', 3),
(2611, 312, '石泉县', 3),
(2612, 312, '宁陕县', 3),
(2613, 312, '紫阳县', 3),
(2614, 312, '岚皋县', 3),
(2615, 312, '平利县', 3),
(2616, 312, '镇坪县', 3),
(2617, 312, '旬阳县', 3),
(2618, 312, '白河县', 3),
(2619, 313, '陈仓区', 3),
(2620, 313, '渭滨区', 3),
(2621, 313, '金台区', 3),
(2622, 313, '凤翔县', 3),
(2623, 313, '岐山县', 3),
(2624, 313, '扶风县', 3),
(2625, 313, '眉县', 3),
(2626, 313, '陇县', 3),
(2627, 313, '千阳县', 3),
(2628, 313, '麟游县', 3),
(2629, 313, '凤县', 3),
(2630, 313, '太白县', 3),
(2631, 314, '汉台区', 3),
(2632, 314, '南郑县', 3),
(2633, 314, '城固县', 3),
(2634, 314, '洋县', 3),
(2635, 314, '西乡县', 3),
(2636, 314, '勉县', 3),
(2637, 314, '宁强县', 3),
(2638, 314, '略阳县', 3),
(2639, 314, '镇巴县', 3),
(2640, 314, '留坝县', 3),
(2641, 314, '佛坪县', 3),
(2642, 315, '商州区', 3),
(2643, 315, '洛南县', 3),
(2644, 315, '丹凤县', 3),
(2645, 315, '商南县', 3),
(2646, 315, '山阳县', 3),
(2647, 315, '镇安县', 3),
(2648, 315, '柞水县', 3),
(2649, 316, '耀州区', 3),
(2650, 316, '王益区', 3),
(2651, 316, '印台区', 3),
(2652, 316, '宜君县', 3),
(2653, 317, '临渭区', 3),
(2654, 317, '韩城市', 3),
(2655, 317, '华阴市', 3),
(2656, 317, '华县', 3),
(2657, 317, '潼关县', 3),
(2658, 317, '大荔县', 3),
(2659, 317, '合阳县', 3),
(2660, 317, '澄城县', 3),
(2661, 317, '蒲城县', 3),
(2662, 317, '白水县', 3),
(2663, 317, '富平县', 3),
(2664, 318, '秦都区', 3),
(2665, 318, '渭城区', 3),
(2666, 318, '杨陵区', 3),
(2667, 318, '兴平市', 3),
(2668, 318, '三原县', 3),
(2669, 318, '泾阳县', 3),
(2670, 318, '乾县', 3),
(2671, 318, '礼泉县', 3),
(2672, 318, '永寿县', 3),
(2673, 318, '彬县', 3),
(2674, 318, '长武县', 3),
(2675, 318, '旬邑县', 3),
(2676, 318, '淳化县', 3),
(2677, 318, '武功县', 3),
(2678, 319, '吴起县', 3),
(2679, 319, '宝塔区', 3),
(2680, 319, '延长县', 3),
(2681, 319, '延川县', 3),
(2682, 319, '子长县', 3),
(2683, 319, '安塞县', 3),
(2684, 319, '志丹县', 3),
(2685, 319, '甘泉县', 3),
(2686, 319, '富县', 3),
(2687, 319, '洛川县', 3),
(2688, 319, '宜川县', 3),
(2689, 319, '黄龙县', 3),
(2690, 319, '黄陵县', 3),
(2691, 320, '榆阳区', 3),
(2692, 320, '神木县', 3),
(2693, 320, '府谷县', 3),
(2694, 320, '横山县', 3),
(2695, 320, '靖边县', 3),
(2696, 320, '定边县', 3),
(2697, 320, '绥德县', 3),
(2698, 320, '米脂县', 3),
(2699, 320, '佳县', 3),
(2700, 320, '吴堡县', 3),
(2701, 320, '清涧县', 3),
(2702, 320, '子洲县', 3),
(2703, 321, '长宁区', 3),
(2704, 321, '闸北区', 3),
(2705, 321, '闵行区', 3),
(2706, 321, '徐汇区', 3),
(2707, 321, '浦东新区', 3),
(2708, 321, '杨浦区', 3),
(2709, 321, '普陀区', 3),
(2710, 321, '静安区', 3),
(2711, 321, '卢湾区', 3),
(2712, 321, '虹口区', 3),
(2713, 321, '黄浦区', 3),
(2714, 321, '南汇区', 3),
(2715, 321, '松江区', 3),
(2716, 321, '嘉定区', 3),
(2717, 321, '宝山区', 3),
(2718, 321, '青浦区', 3),
(2719, 321, '金山区', 3),
(2720, 321, '奉贤区', 3),
(2721, 321, '崇明县', 3),
(2722, 322, '青羊区', 3),
(2723, 322, '锦江区', 3),
(2724, 322, '金牛区', 3),
(2725, 322, '武侯区', 3),
(2726, 322, '成华区', 3),
(2727, 322, '龙泉驿区', 3),
(2728, 322, '青白江区', 3),
(2729, 322, '新都区', 3),
(2730, 322, '温江区', 3),
(2731, 322, '高新区', 3),
(2732, 322, '高新西区', 3),
(2733, 322, '都江堰市', 3),
(2734, 322, '彭州市', 3),
(2735, 322, '邛崃市', 3),
(2736, 322, '崇州市', 3),
(2737, 322, '金堂县', 3),
(2738, 322, '双流县', 3),
(2739, 322, '郫县', 3),
(2740, 322, '大邑县', 3),
(2741, 322, '蒲江县', 3),
(2742, 322, '新津县', 3),
(2743, 322, '都江堰市', 3),
(2744, 322, '彭州市', 3),
(2745, 322, '邛崃市', 3),
(2746, 322, '崇州市', 3),
(2747, 322, '金堂县', 3),
(2748, 322, '双流县', 3),
(2749, 322, '郫县', 3),
(2750, 322, '大邑县', 3),
(2751, 322, '蒲江县', 3),
(2752, 322, '新津县', 3),
(2753, 323, '涪城区', 3),
(2754, 323, '游仙区', 3),
(2755, 323, '江油市', 3),
(2756, 323, '盐亭县', 3),
(2757, 323, '三台县', 3),
(2758, 323, '平武县', 3),
(2759, 323, '安县', 3),
(2760, 323, '梓潼县', 3),
(2761, 323, '北川县', 3),
(2762, 324, '马尔康县', 3),
(2763, 324, '汶川县', 3),
(2764, 324, '理县', 3),
(2765, 324, '茂县', 3),
(2766, 324, '松潘县', 3),
(2767, 324, '九寨沟县', 3),
(2768, 324, '金川县', 3),
(2769, 324, '小金县', 3),
(2770, 324, '黑水县', 3),
(2771, 324, '壤塘县', 3),
(2772, 324, '阿坝县', 3),
(2773, 324, '若尔盖县', 3),
(2774, 324, '红原县', 3),
(2775, 325, '巴州区', 3),
(2776, 325, '通江县', 3),
(2777, 325, '南江县', 3),
(2778, 325, '平昌县', 3),
(2779, 326, '通川区', 3),
(2780, 326, '万源市', 3),
(2781, 326, '达县', 3),
(2782, 326, '宣汉县', 3),
(2783, 326, '开江县', 3),
(2784, 326, '大竹县', 3),
(2785, 326, '渠县', 3),
(2786, 327, '旌阳区', 3),
(2787, 327, '广汉市', 3),
(2788, 327, '什邡市', 3),
(2789, 327, '绵竹市', 3),
(2790, 327, '罗江县', 3),
(2791, 327, '中江县', 3),
(2792, 328, '康定县', 3),
(2793, 328, '丹巴县', 3),
(2794, 328, '泸定县', 3),
(2795, 328, '炉霍县', 3),
(2796, 328, '九龙县', 3),
(2797, 328, '甘孜县', 3),
(2798, 328, '雅江县', 3),
(2799, 328, '新龙县', 3),
(2800, 328, '道孚县', 3),
(2801, 328, '白玉县', 3),
(2802, 328, '理塘县', 3),
(2803, 328, '德格县', 3),
(2804, 328, '乡城县', 3),
(2805, 328, '石渠县', 3),
(2806, 328, '稻城县', 3),
(2807, 328, '色达县', 3),
(2808, 328, '巴塘县', 3),
(2809, 328, '得荣县', 3),
(2810, 329, '广安区', 3),
(2811, 329, '华蓥市', 3),
(2812, 329, '岳池县', 3),
(2813, 329, '武胜县', 3),
(2814, 329, '邻水县', 3),
(2815, 330, '利州区', 3),
(2816, 330, '元坝区', 3),
(2817, 330, '朝天区', 3),
(2818, 330, '旺苍县', 3),
(2819, 330, '青川县', 3),
(2820, 330, '剑阁县', 3),
(2821, 330, '苍溪县', 3),
(2822, 331, '峨眉山市', 3),
(2823, 331, '乐山市', 3),
(2824, 331, '犍为县', 3),
(2825, 331, '井研县', 3),
(2826, 331, '夹江县', 3),
(2827, 331, '沐川县', 3),
(2828, 331, '峨边', 3),
(2829, 331, '马边', 3),
(2830, 332, '西昌市', 3),
(2831, 332, '盐源县', 3),
(2832, 332, '德昌县', 3),
(2833, 332, '会理县', 3),
(2834, 332, '会东县', 3),
(2835, 332, '宁南县', 3),
(2836, 332, '普格县', 3),
(2837, 332, '布拖县', 3),
(2838, 332, '金阳县', 3),
(2839, 332, '昭觉县', 3),
(2840, 332, '喜德县', 3),
(2841, 332, '冕宁县', 3),
(2842, 332, '越西县', 3),
(2843, 332, '甘洛县', 3),
(2844, 332, '美姑县', 3),
(2845, 332, '雷波县', 3),
(2846, 332, '木里', 3),
(2847, 333, '东坡区', 3),
(2848, 333, '仁寿县', 3),
(2849, 333, '彭山县', 3),
(2850, 333, '洪雅县', 3),
(2851, 333, '丹棱县', 3),
(2852, 333, '青神县', 3),
(2853, 334, '阆中市', 3),
(2854, 334, '南部县', 3),
(2855, 334, '营山县', 3),
(2856, 334, '蓬安县', 3),
(2857, 334, '仪陇县', 3),
(2858, 334, '顺庆区', 3),
(2859, 334, '高坪区', 3),
(2860, 334, '嘉陵区', 3),
(2861, 334, '西充县', 3),
(2862, 335, '市中区', 3),
(2863, 335, '东兴区', 3),
(2864, 335, '威远县', 3),
(2865, 335, '资中县', 3),
(2866, 335, '隆昌县', 3),
(2867, 336, '东  区', 3),
(2868, 336, '西  区', 3),
(2869, 336, '仁和区', 3),
(2870, 336, '米易县', 3),
(2871, 336, '盐边县', 3),
(2872, 337, '船山区', 3),
(2873, 337, '安居区', 3),
(2874, 337, '蓬溪县', 3),
(2875, 337, '射洪县', 3),
(2876, 337, '大英县', 3),
(2877, 338, '雨城区', 3),
(2878, 338, '名山县', 3),
(2879, 338, '荥经县', 3),
(2880, 338, '汉源县', 3),
(2881, 338, '石棉县', 3),
(2882, 338, '天全县', 3),
(2883, 338, '芦山县', 3),
(2884, 338, '宝兴县', 3),
(2885, 339, '翠屏区', 3),
(2886, 339, '宜宾县', 3),
(2887, 339, '南溪县', 3),
(2888, 339, '江安县', 3),
(2889, 339, '长宁县', 3),
(2890, 339, '高县', 3),
(2891, 339, '珙县', 3),
(2892, 339, '筠连县', 3),
(2893, 339, '兴文县', 3),
(2894, 339, '屏山县', 3),
(2895, 340, '雁江区', 3),
(2896, 340, '简阳市', 3),
(2897, 340, '安岳县', 3),
(2898, 340, '乐至县', 3),
(2899, 341, '大安区', 3),
(2900, 341, '自流井区', 3),
(2901, 341, '贡井区', 3),
(2902, 341, '沿滩区', 3),
(2903, 341, '荣县', 3),
(2904, 341, '富顺县', 3),
(2905, 342, '江阳区', 3),
(2906, 342, '纳溪区', 3),
(2907, 342, '龙马潭区', 3),
(2908, 342, '泸县', 3),
(2909, 342, '合江县', 3),
(2910, 342, '叙永县', 3),
(2911, 342, '古蔺县', 3),
(2912, 343, '和平区', 3),
(2913, 343, '河西区', 3),
(2914, 343, '南开区', 3),
(2915, 343, '河北区', 3),
(2916, 343, '河东区', 3),
(2917, 343, '红桥区', 3),
(2918, 343, '东丽区', 3),
(2919, 343, '津南区', 3),
(2920, 343, '西青区', 3),
(2921, 343, '北辰区', 3),
(2922, 343, '塘沽区', 3),
(2923, 343, '汉沽区', 3),
(2924, 343, '大港区', 3),
(2925, 343, '武清区', 3),
(2926, 343, '宝坻区', 3),
(2927, 343, '经济开发区', 3),
(2928, 343, '宁河县', 3),
(2929, 343, '静海县', 3),
(2930, 343, '蓟县', 3),
(2931, 344, '城关区', 3),
(2932, 344, '林周县', 3),
(2933, 344, '当雄县', 3),
(2934, 344, '尼木县', 3),
(2935, 344, '曲水县', 3),
(2936, 344, '堆龙德庆县', 3),
(2937, 344, '达孜县', 3),
(2938, 344, '墨竹工卡县', 3),
(2939, 345, '噶尔县', 3),
(2940, 345, '普兰县', 3),
(2941, 345, '札达县', 3),
(2942, 345, '日土县', 3),
(2943, 345, '革吉县', 3),
(2944, 345, '改则县', 3),
(2945, 345, '措勤县', 3),
(2946, 346, '昌都县', 3),
(2947, 346, '江达县', 3),
(2948, 346, '贡觉县', 3),
(2949, 346, '类乌齐县', 3),
(2950, 346, '丁青县', 3),
(2951, 346, '察雅县', 3),
(2952, 346, '八宿县', 3),
(2953, 346, '左贡县', 3),
(2954, 346, '芒康县', 3),
(2955, 346, '洛隆县', 3),
(2956, 346, '边坝县', 3),
(2957, 347, '林芝县', 3),
(2958, 347, '工布江达县', 3),
(2959, 347, '米林县', 3),
(2960, 347, '墨脱县', 3),
(2961, 347, '波密县', 3),
(2962, 347, '察隅县', 3),
(2963, 347, '朗县', 3),
(2964, 348, '那曲县', 3),
(2965, 348, '嘉黎县', 3),
(2966, 348, '比如县', 3),
(2967, 348, '聂荣县', 3),
(2968, 348, '安多县', 3),
(2969, 348, '申扎县', 3),
(2970, 348, '索县', 3),
(2971, 348, '班戈县', 3),
(2972, 348, '巴青县', 3),
(2973, 348, '尼玛县', 3),
(2974, 349, '日喀则市', 3),
(2975, 349, '南木林县', 3),
(2976, 349, '江孜县', 3),
(2977, 349, '定日县', 3),
(2978, 349, '萨迦县', 3),
(2979, 349, '拉孜县', 3),
(2980, 349, '昂仁县', 3),
(2981, 349, '谢通门县', 3),
(2982, 349, '白朗县', 3),
(2983, 349, '仁布县', 3),
(2984, 349, '康马县', 3),
(2985, 349, '定结县', 3),
(2986, 349, '仲巴县', 3),
(2987, 349, '亚东县', 3),
(2988, 349, '吉隆县', 3),
(2989, 349, '聂拉木县', 3),
(2990, 349, '萨嘎县', 3),
(2991, 349, '岗巴县', 3),
(2992, 350, '乃东县', 3),
(2993, 350, '扎囊县', 3),
(2994, 350, '贡嘎县', 3),
(2995, 350, '桑日县', 3),
(2996, 350, '琼结县', 3),
(2997, 350, '曲松县', 3),
(2998, 350, '措美县', 3),
(2999, 350, '洛扎县', 3),
(3000, 350, '加查县', 3),
(3001, 350, '隆子县', 3),
(3002, 350, '错那县', 3),
(3003, 350, '浪卡子县', 3),
(3004, 351, '天山区', 3),
(3005, 351, '沙依巴克区', 3),
(3006, 351, '新市区', 3),
(3007, 351, '水磨沟区', 3),
(3008, 351, '头屯河区', 3),
(3009, 351, '达坂城区', 3),
(3010, 351, '米东区', 3),
(3011, 351, '乌鲁木齐县', 3),
(3012, 352, '阿克苏市', 3),
(3013, 352, '温宿县', 3),
(3014, 352, '库车县', 3),
(3015, 352, '沙雅县', 3),
(3016, 352, '新和县', 3),
(3017, 352, '拜城县', 3),
(3018, 352, '乌什县', 3),
(3019, 352, '阿瓦提县', 3),
(3020, 352, '柯坪县', 3),
(3021, 353, '阿拉尔市', 3),
(3022, 354, '库尔勒市', 3),
(3023, 354, '轮台县', 3),
(3024, 354, '尉犁县', 3),
(3025, 354, '若羌县', 3),
(3026, 354, '且末县', 3),
(3027, 354, '焉耆', 3),
(3028, 354, '和静县', 3),
(3029, 354, '和硕县', 3),
(3030, 354, '博湖县', 3),
(3031, 355, '博乐市', 3),
(3032, 355, '精河县', 3),
(3033, 355, '温泉县', 3),
(3034, 356, '呼图壁县', 3),
(3035, 356, '米泉市', 3),
(3036, 356, '昌吉市', 3),
(3037, 356, '阜康市', 3),
(3038, 356, '玛纳斯县', 3),
(3039, 356, '奇台县', 3),
(3040, 356, '吉木萨尔县', 3),
(3041, 356, '木垒', 3),
(3042, 357, '哈密市', 3),
(3043, 357, '伊吾县', 3),
(3044, 357, '巴里坤', 3),
(3045, 358, '和田市', 3),
(3046, 358, '和田县', 3),
(3047, 358, '墨玉县', 3),
(3048, 358, '皮山县', 3),
(3049, 358, '洛浦县', 3),
(3050, 358, '策勒县', 3),
(3051, 358, '于田县', 3),
(3052, 358, '民丰县', 3),
(3053, 359, '喀什市', 3),
(3054, 359, '疏附县', 3),
(3055, 359, '疏勒县', 3),
(3056, 359, '英吉沙县', 3),
(3057, 359, '泽普县', 3),
(3058, 359, '莎车县', 3),
(3059, 359, '叶城县', 3),
(3060, 359, '麦盖提县', 3),
(3061, 359, '岳普湖县', 3),
(3062, 359, '伽师县', 3),
(3063, 359, '巴楚县', 3),
(3064, 359, '塔什库尔干', 3),
(3065, 360, '克拉玛依市', 3),
(3066, 361, '阿图什市', 3),
(3067, 361, '阿克陶县', 3),
(3068, 361, '阿合奇县', 3),
(3069, 361, '乌恰县', 3),
(3070, 362, '石河子市', 3),
(3071, 363, '图木舒克市', 3),
(3072, 364, '吐鲁番市', 3),
(3073, 364, '鄯善县', 3),
(3074, 364, '托克逊县', 3),
(3075, 365, '五家渠市', 3),
(3076, 366, '阿勒泰市', 3),
(3077, 366, '布克赛尔', 3),
(3078, 366, '伊宁市', 3),
(3079, 366, '布尔津县', 3),
(3080, 366, '奎屯市', 3),
(3081, 366, '乌苏市', 3),
(3082, 366, '额敏县', 3),
(3083, 366, '富蕴县', 3),
(3084, 366, '伊宁县', 3),
(3085, 366, '福海县', 3),
(3086, 366, '霍城县', 3),
(3087, 366, '沙湾县', 3),
(3088, 366, '巩留县', 3),
(3089, 366, '哈巴河县', 3),
(3090, 366, '托里县', 3),
(3091, 366, '青河县', 3),
(3092, 366, '新源县', 3),
(3093, 366, '裕民县', 3),
(3094, 366, '和布克赛尔', 3),
(3095, 366, '吉木乃县', 3),
(3096, 366, '昭苏县', 3),
(3097, 366, '特克斯县', 3),
(3098, 366, '尼勒克县', 3),
(3099, 366, '察布查尔', 3),
(3100, 367, '盘龙区', 3),
(3101, 367, '五华区', 3),
(3102, 367, '官渡区', 3),
(3103, 367, '西山区', 3),
(3104, 367, '东川区', 3),
(3105, 367, '安宁市', 3),
(3106, 367, '呈贡县', 3),
(3107, 367, '晋宁县', 3),
(3108, 367, '富民县', 3),
(3109, 367, '宜良县', 3),
(3110, 367, '嵩明县', 3),
(3111, 367, '石林县', 3),
(3112, 367, '禄劝', 3),
(3113, 367, '寻甸', 3),
(3114, 368, '兰坪', 3),
(3115, 368, '泸水县', 3),
(3116, 368, '福贡县', 3),
(3117, 368, '贡山', 3),
(3118, 369, '宁洱', 3),
(3119, 369, '思茅区', 3),
(3120, 369, '墨江', 3),
(3121, 369, '景东', 3),
(3122, 369, '景谷', 3),
(3123, 369, '镇沅', 3),
(3124, 369, '江城', 3),
(3125, 369, '孟连', 3),
(3126, 369, '澜沧', 3),
(3127, 369, '西盟', 3),
(3128, 370, '古城区', 3),
(3129, 370, '宁蒗', 3),
(3130, 370, '玉龙', 3),
(3131, 370, '永胜县', 3),
(3132, 370, '华坪县', 3),
(3133, 371, '隆阳区', 3),
(3134, 371, '施甸县', 3),
(3135, 371, '腾冲县', 3),
(3136, 371, '龙陵县', 3),
(3137, 371, '昌宁县', 3),
(3138, 372, '楚雄市', 3),
(3139, 372, '双柏县', 3),
(3140, 372, '牟定县', 3),
(3141, 372, '南华县', 3),
(3142, 372, '姚安县', 3),
(3143, 372, '大姚县', 3),
(3144, 372, '永仁县', 3),
(3145, 372, '元谋县', 3),
(3146, 372, '武定县', 3),
(3147, 372, '禄丰县', 3),
(3148, 373, '大理市', 3),
(3149, 373, '祥云县', 3),
(3150, 373, '宾川县', 3),
(3151, 373, '弥渡县', 3),
(3152, 373, '永平县', 3),
(3153, 373, '云龙县', 3),
(3154, 373, '洱源县', 3),
(3155, 373, '剑川县', 3),
(3156, 373, '鹤庆县', 3),
(3157, 373, '漾濞', 3),
(3158, 373, '南涧', 3),
(3159, 373, '巍山', 3),
(3160, 374, '潞西市', 3),
(3161, 374, '瑞丽市', 3),
(3162, 374, '梁河县', 3),
(3163, 374, '盈江县', 3),
(3164, 374, '陇川县', 3),
(3165, 375, '香格里拉县', 3),
(3166, 375, '德钦县', 3),
(3167, 375, '维西', 3),
(3168, 376, '泸西县', 3),
(3169, 376, '蒙自县', 3),
(3170, 376, '个旧市', 3),
(3171, 376, '开远市', 3),
(3172, 376, '绿春县', 3),
(3173, 376, '建水县', 3),
(3174, 376, '石屏县', 3),
(3175, 376, '弥勒县', 3),
(3176, 376, '元阳县', 3),
(3177, 376, '红河县', 3),
(3178, 376, '金平', 3),
(3179, 376, '河口', 3),
(3180, 376, '屏边', 3),
(3181, 377, '临翔区', 3),
(3182, 377, '凤庆县', 3),
(3183, 377, '云县', 3),
(3184, 377, '永德县', 3),
(3185, 377, '镇康县', 3),
(3186, 377, '双江', 3),
(3187, 377, '耿马', 3),
(3188, 377, '沧源', 3),
(3189, 378, '麒麟区', 3),
(3190, 378, '宣威市', 3),
(3191, 378, '马龙县', 3),
(3192, 378, '陆良县', 3),
(3193, 378, '师宗县', 3),
(3194, 378, '罗平县', 3),
(3195, 378, '富源县', 3),
(3196, 378, '会泽县', 3),
(3197, 378, '沾益县', 3),
(3198, 379, '文山县', 3),
(3199, 379, '砚山县', 3),
(3200, 379, '西畴县', 3),
(3201, 379, '麻栗坡县', 3),
(3202, 379, '马关县', 3),
(3203, 379, '丘北县', 3),
(3204, 379, '广南县', 3),
(3205, 379, '富宁县', 3),
(3206, 380, '景洪市', 3),
(3207, 380, '勐海县', 3),
(3208, 380, '勐腊县', 3),
(3209, 381, '红塔区', 3),
(3210, 381, '江川县', 3),
(3211, 381, '澄江县', 3),
(3212, 381, '通海县', 3),
(3213, 381, '华宁县', 3),
(3214, 381, '易门县', 3),
(3215, 381, '峨山', 3),
(3216, 381, '新平', 3),
(3217, 381, '元江', 3),
(3218, 382, '昭阳区', 3),
(3219, 382, '鲁甸县', 3),
(3220, 382, '巧家县', 3),
(3221, 382, '盐津县', 3),
(3222, 382, '大关县', 3),
(3223, 382, '永善县', 3),
(3224, 382, '绥江县', 3),
(3225, 382, '镇雄县', 3),
(3226, 382, '彝良县', 3),
(3227, 382, '威信县', 3),
(3228, 382, '水富县', 3),
(3229, 383, '西湖区', 3),
(3230, 383, '上城区', 3),
(3231, 383, '下城区', 3),
(3232, 383, '拱墅区', 3),
(3233, 383, '滨江区', 3),
(3234, 383, '江干区', 3),
(3235, 383, '萧山区', 3),
(3236, 383, '余杭区', 3),
(3237, 383, '市郊', 3),
(3238, 383, '建德市', 3),
(3239, 383, '富阳市', 3),
(3240, 383, '临安市', 3),
(3241, 383, '桐庐县', 3),
(3242, 383, '淳安县', 3),
(3243, 384, '吴兴区', 3),
(3244, 384, '南浔区', 3),
(3245, 384, '德清县', 3),
(3246, 384, '长兴县', 3),
(3247, 384, '安吉县', 3),
(3248, 385, '南湖区', 3),
(3249, 385, '秀洲区', 3),
(3250, 385, '海宁市', 3),
(3251, 385, '嘉善县', 3),
(3252, 385, '平湖市', 3),
(3253, 385, '桐乡市', 3),
(3254, 385, '海盐县', 3),
(3255, 386, '婺城区', 3),
(3256, 386, '金东区', 3),
(3257, 386, '兰溪市', 3),
(3258, 386, '市区', 3),
(3259, 386, '佛堂镇', 3),
(3260, 386, '上溪镇', 3),
(3261, 386, '义亭镇', 3),
(3262, 386, '大陈镇', 3),
(3263, 386, '苏溪镇', 3),
(3264, 386, '赤岸镇', 3),
(3265, 386, '东阳市', 3),
(3266, 386, '永康市', 3),
(3267, 386, '武义县', 3),
(3268, 386, '浦江县', 3),
(3269, 386, '磐安县', 3),
(3270, 387, '莲都区', 3),
(3271, 387, '龙泉市', 3),
(3272, 387, '青田县', 3),
(3273, 387, '缙云县', 3),
(3274, 387, '遂昌县', 3),
(3275, 387, '松阳县', 3),
(3276, 387, '云和县', 3),
(3277, 387, '庆元县', 3),
(3278, 387, '景宁', 3),
(3279, 388, '海曙区', 3),
(3280, 388, '江东区', 3),
(3281, 388, '江北区', 3),
(3282, 388, '镇海区', 3),
(3283, 388, '北仑区', 3),
(3284, 388, '鄞州区', 3),
(3285, 388, '余姚市', 3),
(3286, 388, '慈溪市', 3),
(3287, 388, '奉化市', 3),
(3288, 388, '象山县', 3),
(3289, 388, '宁海县', 3),
(3290, 389, '越城区', 3),
(3291, 389, '上虞市', 3),
(3292, 389, '嵊州市', 3),
(3293, 389, '绍兴县', 3),
(3294, 389, '新昌县', 3),
(3295, 389, '诸暨市', 3),
(3296, 390, '椒江区', 3),
(3297, 390, '黄岩区', 3),
(3298, 390, '路桥区', 3),
(3299, 390, '温岭市', 3),
(3300, 390, '临海市', 3),
(3301, 390, '玉环县', 3),
(3302, 390, '三门县', 3),
(3303, 390, '天台县', 3),
(3304, 390, '仙居县', 3),
(3305, 391, '鹿城区', 3),
(3306, 391, '龙湾区', 3),
(3307, 391, '瓯海区', 3),
(3308, 391, '瑞安市', 3),
(3309, 391, '乐清市', 3),
(3310, 391, '洞头县', 3),
(3311, 391, '永嘉县', 3),
(3312, 391, '平阳县', 3),
(3313, 391, '苍南县', 3),
(3314, 391, '文成县', 3),
(3315, 391, '泰顺县', 3),
(3316, 392, '定海区', 3),
(3317, 392, '普陀区', 3),
(3318, 392, '岱山县', 3),
(3319, 392, '嵊泗县', 3),
(3320, 393, '衢州市', 3),
(3321, 393, '江山市', 3),
(3322, 393, '常山县', 3),
(3323, 393, '开化县', 3),
(3324, 393, '龙游县', 3),
(3325, 394, '合川区', 3),
(3326, 394, '江津区', 3),
(3327, 394, '南川区', 3),
(3328, 394, '永川区', 3),
(3329, 394, '南岸区', 3),
(3330, 394, '渝北区', 3),
(3331, 394, '万盛区', 3),
(3332, 394, '大渡口区', 3),
(3333, 394, '万州区', 3),
(3334, 394, '北碚区', 3),
(3335, 394, '沙坪坝区', 3),
(3336, 394, '巴南区', 3),
(3337, 394, '涪陵区', 3),
(3338, 394, '江北区', 3),
(3339, 394, '九龙坡区', 3),
(3340, 394, '渝中区', 3),
(3341, 394, '黔江开发区', 3),
(3342, 394, '长寿区', 3),
(3343, 394, '双桥区', 3),
(3344, 394, '綦江县', 3),
(3345, 394, '潼南县', 3),
(3346, 394, '铜梁县', 3),
(3347, 394, '大足县', 3),
(3348, 394, '荣昌县', 3),
(3349, 394, '璧山县', 3),
(3350, 394, '垫江县', 3),
(3351, 394, '武隆县', 3),
(3352, 394, '丰都县', 3),
(3353, 394, '城口县', 3),
(3354, 394, '梁平县', 3),
(3355, 394, '开县', 3),
(3356, 394, '巫溪县', 3),
(3357, 394, '巫山县', 3),
(3358, 394, '奉节县', 3),
(3359, 394, '云阳县', 3),
(3360, 394, '忠县', 3),
(3361, 394, '石柱', 3),
(3362, 394, '彭水', 3),
(3363, 394, '酉阳', 3),
(3364, 394, '秀山', 3),
(3365, 395, '沙田区', 3),
(3366, 395, '东区', 3),
(3367, 395, '观塘区', 3),
(3368, 395, '黄大仙区', 3),
(3369, 395, '九龙城区', 3),
(3370, 395, '屯门区', 3),
(3371, 395, '葵青区', 3),
(3372, 395, '元朗区', 3),
(3373, 395, '深水埗区', 3),
(3374, 395, '西贡区', 3),
(3375, 395, '大埔区', 3),
(3376, 395, '湾仔区', 3),
(3377, 395, '油尖旺区', 3),
(3378, 395, '北区', 3),
(3379, 395, '南区', 3),
(3380, 395, '荃湾区', 3),
(3381, 395, '中西区', 3),
(3382, 395, '离岛区', 3),
(3383, 396, '澳门', 3),
(3384, 397, '台北', 3),
(3385, 397, '高雄', 3),
(3386, 397, '基隆', 3),
(3387, 397, '台中', 3),
(3388, 397, '台南', 3),
(3389, 397, '新竹', 3),
(3390, 397, '嘉义', 3),
(3391, 397, '宜兰县', 3),
(3392, 397, '桃园县', 3),
(3393, 397, '苗栗县', 3),
(3394, 397, '彰化县', 3),
(3395, 397, '南投县', 3),
(3396, 397, '云林县', 3),
(3397, 397, '屏东县', 3),
(3398, 397, '台东县', 3),
(3399, 397, '花莲县', 3),
(3400, 397, '澎湖县', 3),
(3401, 3, '合肥', 2),
(3402, 3401, '庐阳区', 3),
(3403, 3401, '瑶海区', 3),
(3404, 3401, '蜀山区', 3),
(3405, 3401, '包河区', 3),
(3406, 3401, '长丰县', 3),
(3407, 3401, '肥东县', 3),
(3408, 3401, '肥西县', 3),
(3409, 0, '国外', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cool_role`
--

CREATE TABLE IF NOT EXISTS `cool_role` (
  `id` smallint(6) unsigned NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_role`
--

INSERT INTO `cool_role` (`id`, `name`, `status`, `remark`, `pid`, `listorder`) VALUES
(1, '超级管理员', 1, '超级管理', 0, 0),
(2, '普通管理员', 1, '普通管理员', 0, 0),
(3, '注册用户', 1, '注册用户', 0, 0),
(4, '游客', 1, '游客', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cool_role_user`
--

CREATE TABLE IF NOT EXISTS `cool_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT '0',
  `user_id` char(32) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_service`
--

CREATE TABLE IF NOT EXISTS `cool_service` (
  `id` int(11) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `tubiao` varchar(255) NOT NULL DEFAULT 'lnr-laptop-phone'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_service`
--

INSERT INTO `cool_service` (`id`, `catid`, `userid`, `username`, `title`, `title_style`, `thumb`, `keywords`, `description`, `content`, `template`, `posid`, `status`, `recommend`, `readgroup`, `readpoint`, `listorder`, `hits`, `createtime`, `updatetime`, `tubiao`) VALUES
(1, 13, 1, 'admin', '专业线上沟通', 'color:;font-weight:normal;', '', '', '', '<p>项目的每个流程，都会非常清楚的演示给客户，沟通到位，技术人员全程跟踪，确保反馈及时处理</p><p><br/></p>', '0', 0, 1, 0, '', 0, 1, 0, 1506388696, 0, 'lnr-laptop-phone'),
(2, 13, 1, 'admin', '网站维护培训', 'color:;font-weight:normal;', '', '', '', '<p>整个网站制作完成后，全程指导操作提供免费售后技术支持，直到教会为止。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 2, 0, 1506388750, 0, 'lnr-eye'),
(3, 13, 1, 'admin', '免费咨询', 'color:;font-weight:normal;', '', '', '', '<p>任何时期如果需要我们的技术知识，我们免费提供专业咨询支持，帮您答疑解惑。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 3, 0, 1506388791, 0, 'lnr-rocket'),
(4, 13, 1, 'admin', '网站维护', 'color:;font-weight:normal;', '', '', '', '<p>提供网站维护服务，挂马、网站打不开、服务器等，快速解决，确保网站正常运行。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 4, 0, 1506388818, 0, 'lnr-keyboard'),
(5, 13, 1, 'admin', '数据备份', 'color:;font-weight:normal;', '', '', '', '<p>我们将会对客户项目源码进行保密型存档，确保客户平台遇到故障时，避免数据丢失。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 5, 0, 1506388991, 0, 'lnr-laptop-phone'),
(6, 13, 1, 'admin', '1V1客服', 'color:;font-weight:normal;', '', '', '', '<p>提供7*24小时解决客户的问题，公司实行本地化一对一的服务，快速帮您解决网站问题。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 6, 0, 1506389011, 0, 'lnr-eye'),
(7, 13, 1, 'admin', '网站备案', 'color:;font-weight:normal;', '', '', '', '<p>提供专业优质的网站备案协助服务，国内空间必须经过备案才能上线，访问速度高于香港服务器。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 7, 0, 1506389032, 0, 'lnr-rocket'),
(8, 13, 1, 'admin', '网站修改', 'color:;font-weight:normal;', '', '', '', '<p>原功能基础上的页面、文字、图片简单上传修改。此项修改不包括版面调整和加功能。</p><p><br/></p>', '0', 0, 1, 0, '', 0, 8, 0, 1506389058, 0, 'lnr-keyboard');

-- --------------------------------------------------------

--
-- 表的结构 `cool_sys`
--

CREATE TABLE IF NOT EXISTS `cool_sys` (
  `sys_id` int(36) unsigned NOT NULL,
  `sys_name` char(36) NOT NULL DEFAULT '',
  `sys_url` varchar(36) NOT NULL DEFAULT '',
  `sys_title` varchar(200) NOT NULL,
  `sys_key` varchar(200) NOT NULL,
  `sys_des` varchar(200) NOT NULL,
  `email_open` tinyint(2) NOT NULL COMMENT '邮箱发送是否开启',
  `email_name` varchar(50) NOT NULL COMMENT '发送邮箱账号',
  `email_pwd` varchar(50) NOT NULL COMMENT '发送邮箱密码',
  `email_smtpname` varchar(50) NOT NULL COMMENT 'smtp服务器账号',
  `email_emname` varchar(30) NOT NULL COMMENT '邮件名',
  `email_rename` varchar(30) NOT NULL COMMENT '发件人姓名',
  `wesys_name` varchar(30) NOT NULL COMMENT '微信名称',
  `wesys_number` varchar(30) NOT NULL COMMENT '微信号',
  `wesys_id` varchar(20) NOT NULL COMMENT '微信原始ID',
  `wesys_type` tinyint(2) NOT NULL COMMENT '1=订阅号 2=服务号',
  `wesys_appid` varchar(30) NOT NULL COMMENT '微信appid',
  `wesys_appsecret` varchar(50) NOT NULL COMMENT '微信AppSecret',
  `wesys_token` varchar(50) NOT NULL COMMENT '微信token',
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_sys`
--

INSERT INTO `cool_sys` (`sys_id`, `sys_name`, `sys_url`, `sys_title`, `sys_key`, `sys_des`, `email_open`, `email_name`, `email_pwd`, `email_smtpname`, `email_emname`, `email_rename`, `wesys_name`, `wesys_number`, `wesys_id`, `wesys_type`, `wesys_appid`, `wesys_appsecret`, `wesys_token`, `bah`, `copyright`, `ads`, `tel`, `email`) VALUES
(1, 'CLTLAYUI', 'http://www.cltphp.com/', 'CLTPHP后台管理系统', 'CLTPHP,CLTPHP后台管理系统，thinkphp,thinkphp后台管理系统', 'CLTPHP后台管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。', 1, '876902658@qq.com', 'maggie198586', 'smtp.qq.com', '876902658', '网站管理员', 'chichu', 'chichu12345', '12231231231231111', 1, '12312312312', '123123123123123', 'weixin', '陕ICP备15008093号', '2015-2020', '南京市白下区虎踞南路40-8号1-4楼', '025-86530015', '1109305987@qq.com');

-- --------------------------------------------------------

--
-- 表的结构 `cool_system`
--

CREATE TABLE IF NOT EXISTS `cool_system` (
  `id` int(36) unsigned NOT NULL,
  `name` char(36) NOT NULL DEFAULT '',
  `url` varchar(36) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL,
  `key` varchar(200) NOT NULL,
  `des` varchar(200) NOT NULL,
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_system`
--

INSERT INTO `cool_system` (`id`, `name`, `url`, `title`, `key`, `des`, `bah`, `copyright`, `ads`, `tel`, `email`, `logo`) VALUES
(1, '哈尔滨酷创网络', 'http://api.hrbkcwl.com', '哈尔滨酷创网络', '酷创网络,哈尔滨网站建设,哈尔滨网站制作,哈尔滨网页设计,哈尔滨微信开发,哈尔滨网络公司', '哈尔滨酷创网络科技有限公司，企业致力于网站建设，网页设计，网站优化，手机网站制作，微信开发，小程序，网络营销的互联网公司。最好的技术服务让您放心。方案订制、报价合理，期待您的合作！', '黑ICP备17007278号-1', '2017', '黑龙江哈尔滨', '13204660513', '1003418012@qq.com', '/uploads/20170904/9f04d8be2a05d926bc3e328eded02378.png');

-- --------------------------------------------------------

--
-- 表的结构 `cool_users`
--

CREATE TABLE IF NOT EXISTS `cool_users` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 男 0 女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL COMMENT '手机号码',
  `mobile_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `email_validated` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `username` varchar(50) DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `sign` varchar(255) DEFAULT '' COMMENT '签名',
  `status` varchar(20) DEFAULT 'hide' COMMENT '登录状态'
) ENGINE=MyISAM AUTO_INCREMENT=2596 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_user_level`
--

CREATE TABLE IF NOT EXISTS `cool_user_level` (
  `level_id` smallint(4) unsigned NOT NULL COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `bomlimit` int(5) DEFAULT '0' COMMENT '积分下限',
  `toplimit` int(5) DEFAULT '0' COMMENT '积分上限'
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_user_level`
--

INSERT INTO `cool_user_level` (`level_id`, `level_name`, `sort`, `bomlimit`, `toplimit`) VALUES
(1, '注册会员', 1, 0, 500),
(2, '铜牌会员', 2, 501, 1000),
(3, '白银会员', 3, 1001, 2000),
(4, '黄金会员', 4, 2001, 3500),
(5, '钻石会员', 5, 3501, 5500),
(6, '超级VIP', 6, 5500, 99999);

-- --------------------------------------------------------

--
-- 表的结构 `cool_visit_day`
--

CREATE TABLE IF NOT EXISTS `cool_visit_day` (
  `id` int(11) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `acctime` int(10) NOT NULL,
  `visitpage` varchar(255) NOT NULL,
  `antepage` varchar(255) NOT NULL,
  `columnid` int(11) NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL DEFAULT '0',
  `browser` varchar(255) NOT NULL,
  `dizhi` varchar(255) NOT NULL DEFAULT '',
  `network` varchar(100) NOT NULL DEFAULT '',
  `lang` varchar(50) NOT NULL DEFAULT '',
  `keystr` varchar(255) DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_visit_day`
--

INSERT INTO `cool_visit_day` (`id`, `ip`, `acctime`, `visitpage`, `antepage`, `columnid`, `listid`, `browser`, `dizhi`, `network`, `lang`, `keystr`) VALUES
(61, '111.41.173.246', 1511706915, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '518d64f8c67e622307d80a1a717a5220'),
(62, '111.41.173.246', 1511706930, 'http://www.hrbkcwl.com/about_2.html', 'http://www.hrbkcwl.com/', 0, 0, 'Chrome', '', '', '', '518d64f8c67e622307d80a1a717a5220'),
(63, '111.41.173.246', 1511706935, 'http://www.hrbkcwl.com/case_10.html', 'http://www.hrbkcwl.com/about_2.html', 0, 0, 'Chrome', '', '', '', '518d64f8c67e622307d80a1a717a5220'),
(64, '111.41.173.246', 1511706937, 'http://www.hrbkcwl.com/products_9.html', 'http://www.hrbkcwl.com/case_10.html', 0, 0, 'Chrome', '', '', '', '518d64f8c67e622307d80a1a717a5220'),
(65, '111.41.173.246', 1511706963, 'http://www.hrbkcwl.com/services_13.html', 'http://www.hrbkcwl.com/products_9.html', 0, 0, 'Chrome', '', '', '', '518d64f8c67e622307d80a1a717a5220'),
(66, '111.41.173.246', 1511707123, 'http://www.hrbkcwl.com/services_13.html', 'http://www.hrbkcwl.com/products_9.html', 0, 0, 'Chrome', '', '', '', '518d64f8c67e622307d80a1a717a5220'),
(67, '111.206.221.83', 1511716227, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(68, '220.181.108.185', 1511719690, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(69, '111.206.221.45', 1511738468, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '31986c83f936311d30fe476040d8fb4f'),
(70, '111.206.221.66', 1511745061, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(71, '123.165.245.117', 1511755778, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(72, '123.165.245.117', 1511755843, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '8057bc91ff77c193fd3e6f49e8e7c5f6'),
(73, '123.165.245.117', 1511755916, 'http://www.hrbkcwl.com/index.html', 'http://www.hrbkcwl.com/admin/index/index.html', 0, 0, 'Chrome', '', '', '', '8057bc91ff77c193fd3e6f49e8e7c5f6'),
(74, '123.165.245.117', 1511755921, 'http://www.hrbkcwl.com/about_2.html', 'http://www.hrbkcwl.com/index.html', 0, 0, 'Chrome', '', '', '', '8057bc91ff77c193fd3e6f49e8e7c5f6'),
(75, '123.165.245.117', 1511755922, 'http://www.hrbkcwl.com/products_9.html', 'http://www.hrbkcwl.com/about_2.html', 0, 0, 'Chrome', '', '', '', '8057bc91ff77c193fd3e6f49e8e7c5f6'),
(76, '123.165.245.117', 1511755969, 'http://www.hrbkcwl.com/index.html', 'http://www.hrbkcwl.com/admin/index/index.html', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(77, '123.165.245.117', 1511755971, 'http://www.hrbkcwl.com/blog_14.html', 'http://www.hrbkcwl.com/index.html', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(78, '123.165.245.117', 1511768822, 'http://www.hrbkcwl.com/blog_14.html', 'http://www.hrbkcwl.com/index.html', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(79, '123.165.245.117', 1511769289, 'http://www.hrbkcwl.com/', 'https://www.baidu.com/link?url=Yf46CJvCvF2hvuuilJjw7PZCvr8rmp1CDgP3mLVtbEm', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(80, '111.206.221.108', 1511769588, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(81, '1.62.108.134', 1511774760, 'http://www.hrbkcwl.com/', 'https://www.baidu.com/link?url=6PtaxqOAesdQ-3kWRu1XoMDIi0jK4gsa0BexQim2Z3a', 0, 0, 'Chrome', '', '', '', 'c0e18a9b3b22f37e4e05de4814d29d21'),
(82, '1.62.108.134', 1511774881, 'http://www.hrbkcwl.com/', 'https://www.baidu.com/link?url=6PtaxqOAesdQ-3kWRu1XoMDIi0jK4gsa0BexQim2Z3a', 0, 0, 'Chrome', '', '', '', 'c0e18a9b3b22f37e4e05de4814d29d21'),
(83, '111.206.221.44', 1511784011, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(84, '111.41.173.246', 1511791963, 'http://www.hrbkcwl.com/', 'https://www.baidu.com/link?url=KOlir-JL5gVDrEtwRn3bAFJrxbdOAGzmYfgbpBxUpyd1oP2K0Iu7i9Z8LBSlZ-9g', 0, 0, 'Chrome', '', '', '', '518d64f8c67e622307d80a1a717a5220'),
(85, '111.206.221.43', 1511809852, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(86, '111.206.221.107', 1511831445, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(87, '220.181.108.117', 1511831812, 'http://www.hrbkcwl.com/', '', 0, 0, 'Safari', '', '', '', '56ab9f8fa438dd2485e29360ee827a12'),
(88, '123.165.249.85', 1511837400, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(89, '123.165.249.85', 1511837483, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(90, '123.165.249.85', 1511838073, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(91, '111.206.221.33', 1511838706, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '31986c83f936311d30fe476040d8fb4f'),
(92, '123.165.249.85', 1511847672, 'http://www.hrbkcwl.com/', '', 0, 0, 'Chrome', '', '', '', '1b2cceb67aa2527bfcf2d4e5f3e6a271'),
(93, '222.171.195.197', 1511854359, 'http://www.hrbkcwl.com/', 'http://www.hrbkcwl.com/admin/index/main.html', 0, 0, 'Chrome', '', '', '', 'bba8bf9e6bdefb5dc8a6929c49da5ef2'),
(94, '222.171.195.197', 1511854388, 'http://www.hrbkcwl.com/index.html', 'http://www.hrbkcwl.com/admin/index/index.html', 0, 0, 'Chrome', '', '', '', 'bba8bf9e6bdefb5dc8a6929c49da5ef2');

-- --------------------------------------------------------

--
-- 表的结构 `cool_visit_detail`
--

CREATE TABLE IF NOT EXISTS `cool_visit_detail` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pv` int(11) NOT NULL DEFAULT '0',
  `uv` int(11) NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL DEFAULT '0',
  `alone` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT '0',
  `columnid` int(11) NOT NULL DEFAULT '0',
  `listid` int(11) NOT NULL DEFAULT '0',
  `stattime` int(11) NOT NULL,
  `lang` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_visit_detail`
--

INSERT INTO `cool_visit_detail` (`id`, `name`, `pv`, `uv`, `ip`, `alone`, `remark`, `type`, `columnid`, `listid`, `stattime`, `lang`) VALUES
(23, 'http://www.hrbkcwl.com/', 1, 1, 1, 0, '', 0, 0, 0, 1511625600, ''),
(24, 'http://www.hrbkcwl.com/about_2.html', 1, 1, 1, 0, '', 0, 0, 0, 1511625600, ''),
(25, 'http://www.hrbkcwl.com/case_10.html', 1, 1, 1, 0, '', 0, 0, 0, 1511625600, ''),
(26, 'http://www.hrbkcwl.com/products_9.html', 1, 1, 1, 0, '', 0, 0, 0, 1511625600, ''),
(27, 'http://www.hrbkcwl.com/services_13.html', 2, 1, 1, 0, '', 0, 0, 0, 1511625600, ''),
(28, 'http://www.hrbkcwl.com/', 12, 10, 9, 0, '', 0, 0, 0, 1511712000, ''),
(29, 'http://www.hrbkcwl.com/index.html', 2, 2, 1, 0, '', 0, 0, 0, 1511712000, ''),
(30, 'http://www.hrbkcwl.com/about_2.html', 1, 1, 1, 0, '', 0, 0, 0, 1511712000, ''),
(31, 'http://www.hrbkcwl.com/products_9.html', 1, 1, 1, 0, '', 0, 0, 0, 1511712000, ''),
(32, 'http://www.hrbkcwl.com/blog_14.html', 2, 1, 1, 0, '', 0, 0, 0, 1511712000, ''),
(33, 'http://www.hrbkcwl.com/', 9, 6, 6, 0, '', 0, 0, 0, 1511798400, ''),
(34, 'http://www.hrbkcwl.com/index.html', 1, 1, 1, 0, '', 0, 0, 0, 1511798400, '');

-- --------------------------------------------------------

--
-- 表的结构 `cool_visit_summary`
--

CREATE TABLE IF NOT EXISTS `cool_visit_summary` (
  `id` int(11) NOT NULL,
  `pv` int(11) NOT NULL DEFAULT '0',
  `ip` int(11) NOT NULL DEFAULT '0',
  `alone` int(11) NOT NULL,
  `parttime` text NOT NULL,
  `stattime` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_wdjcontent`
--

CREATE TABLE IF NOT EXISTS `cool_wdjcontent` (
  `wid` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `ct` varchar(255) DEFAULT NULL,
  `round_head_img` varchar(255) DEFAULT NULL,
  `msg_desc` varchar(255) DEFAULT NULL,
  `content` text,
  `hits` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_wdjcontent`
--

INSERT INTO `cool_wdjcontent` (`wid`, `url`, `title`, `cover`, `nickname`, `ct`, `round_head_img`, `msg_desc`, `content`, `hits`, `addtime`) VALUES
(48, 'http://mp.weixin.qq.com/s/nGSzP3XsBB0GTnEwL54CYg', '惊叹！这个盲人程序员是这样写代码的', 'http://mmbiz.qpic.cn/mmbiz_jpg/zPh0erYjkib04QNFoC9VwOf5UZxKFxZsJQvGLWtM03bKdmI5V3ibtEm3bkT8rlnnaadcjic8PzKwrD3WRkOhk7JCg/0?wx_fmt=jpeg', '前端大全', '1506762000', './image/round_head_img_gh_1828302cb1b3.png', NULL, '<p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;">&nbsp;<span style="max-width: 100%;color: rgb(255, 41, 65);font-size: 14px;line-height: 22.4px;box-sizing: border-box !important;word-wrap: break-word !important;">（点击</span><span style="max-width: 100%;font-size: 14px;line-height: 22.4px;color: rgb(0, 128, 255);box-sizing: border-box !important;word-wrap: break-word !important;">上方公众号</span><span style="max-width: 100%;color: rgb(255, 41, 65);font-size: 14px;line-height: 22.4px;box-sizing: border-box !important;word-wrap: break-word !important;">，可快速关注）</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;line-height: 25.6px;text-align: center;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;color: rgb(255, 41, 65);font-size: 14px;line-height: 22.4px;box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><blockquote style="max-width: 100%;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><p style="max-width: 100%;min-height: 1em;line-height: 25.6px;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 14px;box-sizing: border-box !important;word-wrap: break-word !important;"></span><span style="font-size: 14px;">编译：伯乐在线/孙腾浩</span><span style="max-width: 100%;font-size: 14px;box-sizing: border-box !important;word-wrap: break-word !important;"></span></p><p style="max-width: 100%;min-height: 1em;line-height: 25.6px;box-sizing: border-box !important;word-wrap: break-word !important;"><a href="http://mp.weixin.qq.com/s?__biz=MzAxODE2MjM1MA==&amp;mid=402764500&amp;idx=1&amp;sn=cfcc178c7718d548b7cdc04758502bd9&amp;scene=21#wechat_redirect" target="_blank" data_ue_src="http://mp.weixin.qq.com/s?__biz=MzAxODE2MjM1MA==&amp;mid=402764500&amp;idx=1&amp;sn=cfcc178c7718d548b7cdc04758502bd9&amp;scene=21#wechat_redirect" style="color: rgb(0, 128, 255);text-decoration: underline;max-width: 100%;font-size: 14px;box-sizing: border-box !important;word-wrap: break-word !important;">如有好文章投稿，请点击 → 这里了解详情</a></p></blockquote><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: pre-wrap;line-height: 25.6px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;line-height: 1.6;box-sizing: border-box !important;word-wrap: break-word !important;"></strong></p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.7507246376811594" src="./image/KovAgJ2aWyYic4lvUGJYaZTOdpt5oiaunsxGVKCmMZypfRnWiaUGT1RK0BL6xibQ7R3WxBMukndoFbNbY43NTn0Gcw.jpeg" data-type="jpeg" data-w="690" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">我想你第一次看到我的工位时，总会感觉少点什么。没有显示器和鼠标，却有个人敲打着键盘，不知注视着哪里。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">这就是我，我同事可以证明我没问题。我是位于坦佩雷（芬兰西南部一座城市）的 Vincit 写字楼中的一名软件开发者。我双目失明。这篇文章中我将讲述有关我工作中的事情。</p><h2 style="margin-bottom: 20px;font-weight: bold;font-size: 24px;max-width: 100%;color: rgb(62, 62, 62);white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-stretch: normal;line-height: 36px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;">你真的什么都看不到吗？</span></h2><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">准确来说，我觉察到阳光和其他明亮的光线，不过也仅限这些。其实，这对我的工作也并没有什么帮助。</p><h2 style="margin-bottom: 20px;font-weight: bold;font-size: 24px;max-width: 100%;color: rgb(62, 62, 62);white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-stretch: normal;line-height: 36px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;">你工作内容是什么？</span></h2><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">和大部分人一样：忙时写代码，闲时和同事侃大山。我做全栈项目，主攻后端。兼职访问顾问 – 或称监管，随你如何称呼。</p><h2 style="margin-bottom: 20px;font-weight: bold;font-size: 24px;max-width: 100%;color: rgb(62, 62, 62);white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-stretch: normal;line-height: 36px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;">你如何使用电脑？</span></h2><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">我用的电脑是一台运行 Windows 10 的普通笔记本。是其中的软件让一切变得神奇。我使用一款叫做屏幕阅读器的程序来访问电脑。屏幕阅读器监听屏幕上的变化并通过盲文（需要单独的盲文设备）或合成的声音来展示给用户。这并不是你如今听到的各种智能助理的合成声音。我使用一种机械声音，每分钟能说 450 个单词。相比较而言，英语正常语速每分钟 120-150 个单词。我有一个怪癖：我既说英语也说芬兰语，我用芬兰语合成器读英语，因为老旧的屏幕阅读器在语言之间切换不够智能，所以我习惯这样做。下面是个例子是阅读这个段落，我能听懂。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">https://www.vincit.fi/wp-content/uploads/2017/08/mpsample.mp3?_=1</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">下面是英语合成器发出的声音：</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">https://www.vincit.fi/wp-content/uploads/2017/08/essample.mp3?_=2</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">鼠标对于我来说并不是非常有用，所以我仅仅通过键盘工作。在座的各位应该十分熟悉我用到的命令：方向键和 tab 键控制窗口内的移动，alt+tab 切换窗口等等。屏幕阅读器也有很多自己的快捷键，比如阅读活动窗口的不同区域或开关一些功能特性。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">有趣的是阅读网页和其他格式化文档。你看，屏幕阅读器分块呈现信息。每一块可能是一行，也可能是一个单词、一个字母，亦或是文本的片段。举个例子，我在网页中按向下的方向键，我听到页面的下一行。我并不能像正常人一样用眼睛从屏幕上阅读内容。相反，我听到一块一块的内容，或跳过我不感兴趣的部分。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">语音或盲文并不能描绘出窗口的显示布局。信息以线性方式呈现给我。如果你把网页复制粘贴进记事本，你就能明白我看到的网页是什么样子的。就是剥离大部分格式的多行文本。然而屏幕阅读器可以获取网页上的 HTML 语法，所以我也能知道超链接、标题、表单等等。事实上，如果非复选框元素展示成复选框样式，我并不能知道这是复选框。我之后将写一篇文章详细讲述这些内容，记住我刚刚举的是个“反人类”例子。 （译者注：突然感到自责和羞愧，深深明白了一个道理：不要用各种有含意义的传统标签 hack 布局和样式，也不要因为 css 的强大而懒得使用各种有含义的传统标签。共勉）</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">我花费大量时间工作在命令行上。事实上我通常用浏览器和编辑器，很少用其他图形应用程序。相比那些为鼠标用户打造的图形界面，我发现用命令行处理手边的工作更加高效。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">既然我如此热爱命令行，为什么我却要选择 Windows 这个并不以命令行出名的操作系统呢？答案很简单：Windows 是最方便的操作系统。NVDA是我所选择的屏幕阅读器，它是开源的并且维护比其他阅读器更频繁。如果上天再我一次机会，我可能会选 Mac 系统，因为我认为它是易用性和功能性平衡的典范。不幸的是 Mac 系统上的屏幕阅读器&nbsp;VoiceOver&nbsp;经历了漫长的发布周期从而被遗忘，并且它的导航模型和我独特的工作方式并不协调。当然这里也有一个 Gnome 桌面上的屏幕阅读器，虽然用户很少，依然被很好地维护着，不过还有一些不完善的地方和我日常工作不协调。所以，我选择 Windows。由 GNU 诞生的 Git Bash 和其他命令行工具弥补了 Windows 内置命令行的缺陷。</p><h2 style="margin-bottom: 20px;font-weight: bold;font-size: 24px;max-width: 100%;color: rgb(62, 62, 62);white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-stretch: normal;line-height: 36px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;">你如何写代码？</span></h2><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">我花费好长时间才明白为什么大家觉得这个问题是个很高深的问题。记得我上面说过一行一行地阅读文本吗？我也是通过这种方式读代码。通常我会跳过无用的行，或仅听半行来获取内容，但当我需要知道完整信息的时候，我不得不像读小说一样读完所有东西。我当然无法阅读整个代码库。这种情况下我会在脑中抽象一部分代码：这个组件输入 x 返回 y，并不用关心细节逻辑。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">这种阅读方式让我和正常同事的工作方式有些区别。举个例子，当代码审查时，我喜欢看原始 diff 输出，并列窗口显示 diff 对我并不适用，而且还容易让人分心。有修改的代码行上用符号 + 和 – 比用不同背景色标注也要好太多，并不是因为我不能获知颜色名字，而是因为在新增的一行中，读“加”这个字比读“带复杂阴影的高亮红色”用更短的时间。（嘿，我说你呢 Gerrit (一款代码审查工具)）</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">你或许会认为缩进和其他代码格式和我无关，因为都是基本的视觉问题。并不是这样，正确的缩进对我的帮助和正常开发者一样。当我用盲文（比语音更加高效）读代码时，我像其他正常程序员一样清楚代码结构。当我进入一段有缩进或无缩进的代码时，我也会得到语音提醒。这些信息帮助我在脑中描绘代码结构。事实上我学的第一门语言就是 Python （PHP 不算），它强制使用代码缩进，这对我来说并不是问题。我有众多理由来强烈建议使用整洁统一的代码风格，其中之一就是不要让我的生活变得更加艰难了，好吗。</p><h2 style="margin-bottom: 20px;font-weight: bold;font-size: 24px;max-width: 100%;color: rgb(62, 62, 62);white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-stretch: normal;line-height: 36px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;">你喜欢哪款编辑器？</span></h2><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">剧透一下：这个答案并不是以 V 或者 E 开头（我虽然通过命令行用 Vim 来写 git commit 信息和其他备注。我认为我在这场圣战中是中立的）（<span style="max-width: 100%;background-color: rgb(255, 254, 213);box-sizing: border-box !important;word-wrap: break-word !important;">译者注：Vim 和 Emacs 梗</span>）一年前我认为 Notepad++ 最棒，它是轻量级的做工精细的文本编辑器。然而一年前我还没有接触大规模 Java 项目，当我接触这种项目时，意味着我应该在 Notepad++ 和理智之间做个选择。最后我选择理智，抛弃 Notepad++ 转投 IntelliJ IDEA 的怀抱。从那之后 IntelliJ IDEA 便是我首选编辑器。我曾对各种 IDE 有深深怨念，它们大多数在纯键盘流操作下麻烦又低效。如果我视力没问题，我肯定早就跳到 IDE 阵营了。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">但你可能会问，为什么当初选 Notepad++。还有其他很多更先进的轻量级编辑器，比如 Sublime 或 Atom。原因很简单：屏幕阅读器无法访问它们。Vim 一类的文本编辑器也是如此，我使用的屏幕阅读器对命令行程序的支持有问题，在这些编辑器上无法处理多于 commit 信息的文本。很遗憾，可用性决定了我能够使用的工具。即使我不能高效工作，也不是什么大问题。</p><h2 style="margin-bottom: 20px;font-weight: bold;font-size: 24px;max-width: 100%;color: rgb(62, 62, 62);white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-stretch: normal;line-height: 36px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;">你编写过前端代码吗？</span></h2><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">你应该认为前端开发和视觉有关，注定与盲人程序员无缘。基本上是这样。我从来不自己做概念原型，我做都是有界面，需要随后加入功能的项目。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">然而，我也做过 Angular 和 React 工作任务。怎么会这样？如今很多 APP 基于浏览器。举个例子，我曾花费两周时间为一个 Angular APP 增加国际化支持。我并不需要做任何视觉上的改动。</p><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">我发现对于我这类开发者开说，像 Bootstrap 这类的库简直是上天的礼物。正因为栅格系统（Bootstrap的响应式布局解决方案），我可以自己构建一个粗糙的界面。尽管如此，我做的有关界面的改动在呈现给用户之前仍然要有一双眼睛检查。所以，总而言之，我可以在一定程度上做些前端开发，至少不是和表现层太相关。</p><h2 style="margin-bottom: 20px;font-weight: bold;font-size: 24px;max-width: 100%;color: rgb(62, 62, 62);white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-stretch: normal;line-height: 36px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;">有什么其他没有提到的东西？</span></h2><p style="margin-bottom: 20px;max-width: 100%;min-height: 1em;white-space: normal;widows: 1;border-width: 0px;border-style: initial;border-color: initial;font-size: 15px;color: rgb(46, 46, 46);background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;">其实这篇文章有很多东西没有表达出来。正如上文所承诺，我将全力以赴写一篇文章，有关制作易访问网页的艺术，因为一言未尽是我讨厌的事情之一。我不会半途而废的，敬请期待。</p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 14px;color: rgb(255, 169, 0);box-sizing: border-box !important;word-wrap: break-word !important;">觉得本文对你有帮助？请分享给更多人</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;line-height: 25.6px;text-align: center;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;color: rgb(255, 169, 0);box-sizing: border-box !important;word-wrap: break-word !important;">关注「前端大全」，提升前端技能</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;line-height: 25.6px;text-align: center;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.9166666666666666" src="./image/zPh0erYjkib0lZCEKibSLcyLMVa3iaNzhWkSPnEBk28r5AAcL4fS03LQn1RWA5M58d7kvysRCibKpHibjs1szyRmnOQ.jpeg" data-type="png" data-w="600" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"  /></p>', 0, 1506764278),
(51, 'http://mp.weixin.qq.com/s/XKJt2J8DiYtJZCQ3u7xyLQ', '明月清风迎鸿运，桂花香里话团圆 | 千优科技祝大家中秋快乐', 'http://mmbiz.qpic.cn/mmbiz_jpg/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTu0X7lOLAiaJSFo1hLXXickHktrdbicW5Dia6PU2C5QYhUCKSmicjRbHYnWYg/0?wx_fmt=jpeg', '哈尔滨千优科技发展有限公司', '1506764583', './image/round_head_img_gh_7b26aa27f3b1.png', NULL, '<section data-role="outer" label="Powered by 135editor.com" style="font-family:微软雅黑;font-size:16px;"><section class="_135editor" data-tools="135编辑器" data-id="90800" style="border-width: 0px;border-style: none;border-color: initial;box-sizing: border-box;"><section data-role="outer" label="Powered by 135editor.com" style="font-family:微软雅黑;font-size:16px;"><section class="_135editor" data-tools="135编辑器" data-id="88069" style="border-width: 0px;border-style: none;border-color: initial;box-sizing: border-box;"><section style="width: 100%;text-align: left;" data-width="100%"><section style="width: 260px;height: 40px;background-image: url(&quot;./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTu2aAVfHo3tKNGesVBOLrqor5ibVQLMQdkYRw56AicE2s3U4pgJZpOeyOQ.png&quot;);background-size: 100% 100%;display: inline-block;overflow: hidden;"><section style="width: 180px;height: 40px;line-height: 45px;margin-left: 78px;"><span style="color: rgb(0, 128, 255);">点击蓝字关注我们</span></section></section></section></section></section></section></section><section data-role="outer" label="Powered by 135editor.com" style="font-family:微软雅黑;font-size:16px;"><section class="_135editor" data-tools="135编辑器" data-id="88048" style="border-width: 0px;border-style: none;border-color: initial;box-sizing: border-box;"><section style="margin-top: 4em;border-width: initial;border-style: none;border-color: initial;box-sizing: border-box;"><section style="border-width: 2px;border-style: dotted;border-color: rgb(196, 125, 137);border-radius: 0.5em;color: rgb(153, 129, 205);box-sizing: border-box;"><section style="border-radius: 0.5em;font-family: inherit;font-weight: inherit;text-align: center;text-decoration: inherit;color: rgb(0, 0, 0);border-color: rgb(255, 107, 145);background-color: rgb(247, 96, 121);padding: 15px;box-sizing: border-box;"><section style="margin-top: -3.6em;margin-right: auto;margin-left: auto;width: 114px;height: 114px;display: inline-block;vertical-align: middle;border-width: 1px;border-style: solid;border-color: pink;border-radius: 100%;box-shadow: rgb(204, 204, 204) 1px 1px 3px;color: rgb(153, 129, 205);box-sizing: border-box;"><section style="width: 112px;height: 112px;"><section data-role="circle" style="border-radius: 100%;overflow: hidden;margin-right: auto;margin-left: auto;width: 100%;padding-bottom: 100%;height: 0px;background-image: url(&quot;./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTuajzmXzqBbdU5oEPX2XVic0mKx3NNMibusPuQEIFWwhQwqyWhKZNAHqbw.jpeg&quot;);background-position: 50% 50%;background-size: cover;box-sizing: border-box;" data-width="100%"><img src="./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTuajzmXzqBbdU5oEPX2XVic0mKx3NNMibusPuQEIFWwhQwqyWhKZNAHqbw.jpeg" style="opacity:0;" class="" data-ratio="1.0057803468208093" data-w="173" data-type="jpeg"  /></section></section></section><section style="padding: 15px;box-sizing: border-box;"><span style="color: #FFFFFF;">中秋佳节</span></section><section class="135brush" data-autoskip="1" data-style="color:#FFF;"><p><span style="color: rgb(255, 255, 255);"><img class="" data-ratio="0.55625" src="./image/1iahlaCMvULrE007HiaEm2IRwGVTNJC0jn3yJB28S8sus1NicicVtM2ynbpa4KwvjzBMH4UibysjQbZhSjF4U2XibtWg.jpeg" data-type="jpeg" data-w="640" style="box-sizing: border-box;color: rgb(62, 62, 62);" width="90%"  /></span></p><p><span style="color: rgb(255, 255, 255);">月满花语 情深意浓</span></p><p><span style="color: rgb(255, 255, 255);">恰值月圆情浓日 正是花开倾语时</span></p><p><span style="color: rgb(255, 255, 255);font-family: inherit;font-weight: inherit;text-decoration: inherit;">“凉风有信，秋月无边，</span></p><p><span style="color: rgb(255, 255, 255);font-family: inherit;font-weight: inherit;text-decoration: inherit;">思家的情绪好比度日如年。”</span></p><p><span style="color: rgb(255, 255, 255);">一年一次的中秋佳节开挂似的就这么来了，</span></p><p><span style="color: rgb(255, 255, 255);">还沉浸在工作中无法自拔，怎么办？</span></p><p><span style="color: rgb(255, 255, 255);">还和国庆在一块，</span></p><p><span style="color: rgb(255, 255, 255);">这个长长的假期要怎么玩？</span></p><p><span style="color: rgb(255, 255, 255);">又是一年佳节时，</span></p><p><span style="color: rgb(255, 255, 255);">公司除了放假，还有没有其他福利？</span></p><p><span style="color: rgb(255, 255, 255);">看着朋友圈里发着各种福利，</span></p><p><span style="color: rgb(255, 255, 255);">不晒都对不起自己票圈？</span></p><p><span style="color: #FFFFFF;"></span></p><section class="_wxbEditor"><section label="Powered by 135editor.com" style="font-family: 微软雅黑;"><section class="135editor" style="box-sizing: border-box;border-width: 0px;border-style: none;border-color: initial;" data-id="2311"><section style="border-width: 0px;border-style: initial;border-color: initial;box-sizing: border-box;clear: both;"><section style="box-sizing: border-box;"><img border="0" class="" data-ratio="0.75" src="./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTuOoahb607iap6Dc9ZKiaiaLLudXWp8DLVV60ICtSrb0rg76ibg899VWOvYQ.jpeg" data-type="jpeg" data-w="1280" data-width="100%" height="auto" opacity="" style="box-sizing: border-box;width: 100%;" title="" vspace="0" width="100%"  /><section style="box-sizing: border-box;"><img border="0" class="" data-ratio="0.75" src="./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTu1Y6fwhXbPG5kIYfgX9tamoic7xBia9aK3Z8EF80k0pvT1427KOQwYW3w.jpeg" data-type="jpeg" data-w="1280" data-width="49%" height="auto" opacity="" style="box-sizing: border-box;float: left;width: 49%;" title="" vspace="0" width="49%"  /><img border="0" class="" data-ratio="0.75" src="./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTu1Sg45ku5BxBz6zPFVtbxSv3ica8X0rQhibR2KrvbUC6P8F5M4us6RRhw.jpeg" data-type="jpeg" data-w="1280" data-width="49%" height="auto" opacity="" style="box-sizing: border-box;float: right;width: 49%;" title="" vspace="0" width="49%"  /></section></section></section></section></section></section><p><br  /></p><p style="text-align: center;"><span style="color: rgb(255, 255, 255);">中秋节是团圆的节日。</span></p><p style="text-align: center;"><span style="color: rgb(255, 255, 255);">我们，因同一个梦想，相遇在千优；</span></p><p style="text-align: center;"><span style="color: rgb(255, 255, 255);">因世间的缘分，相距在<span style="color: rgb(255, 255, 255);font-family: 微软雅黑;font-size: 16px;text-align: center;background-color: rgb(247, 96, 121);">千优</span>。</span></p><p style="text-align: center;"><span style="color: rgb(255, 255, 255);">在这美好的日子，</span></p><p style="text-align: center;"><span style="color: rgb(255, 255, 255);"><span style="color: rgb(255, 255, 255);font-family: 微软雅黑;font-size: 16px;text-align: center;background-color: rgb(247, 96, 121);">千优</span>虽不曾与你共同度过，</span></p><p style="text-align: center;"><span style="color: rgb(255, 255, 255);">但<span style="color: rgb(255, 255, 255);font-family: 微软雅黑;font-size: 16px;text-align: center;background-color: rgb(247, 96, 121);">千优</span>会一直陪在你身边，</span></p><p style="text-align: center;"><span style="color: rgb(255, 255, 255);">为你送上一份薄礼，希望你能跟家人共聚。</span></p><p style="text-align: center;"><br  /></p><section data-role="outer" label="Powered by 135editor.com" style="font-family:微软雅黑;font-size:16px;"><section class="_135editor" data-tools="135编辑器" data-id="88659" style="border-width: 0px;border-style: none;border-color: initial;box-sizing: border-box;"><section style="display: inline-block;width: 100%;vertical-align: top;box-sizing: border-box;" data-width="100%"><section style="text-align: center;margin: 10px 0% -1px;height: 15px;background-image: url(&quot;./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTumMBtdjF62xSHH4Yb3lIRrbFoz21EnQzZwON479YTQrK1yp8oq6iaN7w.png&quot;);box-sizing: border-box;background-size: 100% 100%;background-repeat: no-repeat;"></section><section style="text-align: center;box-sizing: border-box;transform: translate3d(0px, 0px, 0px);-webkit-transform: translate3d(0px, 0px, 0px);-moz-transform: translate3d(0px, 0px, 0px);-ms-transform: translate3d(0px, 0px, 0px);-o-transform: translate3d(0px, 0px, 0px);"><section style="display: inline-block;width: 90%;vertical-align: top;background-image: url(&quot;./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTuqpiatb5vNTO5AJ8eljoJOpEtman2nEJhthrIymPoNZcGjVS28WNFa7Q.jpeg&quot;);background-position: 72.6852% 30.2013%;background-repeat: repeat;background-size: 49.1765%;background-attachment: scroll;padding: 20px 15px;box-sizing: border-box;" data-width="90%"><section style="display: inline-block;width: 100%;vertical-align: top;background-color: rgb(254, 255, 255);padding: 10px;box-sizing: border-box;" data-width="100%"><p><img data-s="300,640" data-type="jpeg" src="./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTuxlvM0t89wZTfVhfoWpGyVnWjpajstxviaviccjC8r49TDDP3J58QQ2ibA.jpeg" class="" data-ratio="0.75" data-w="1280"  /></p><p><img data-s="300,640" data-type="jpeg" src="./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTuzTtEC5r8RfCsQxEbjT8c8BVWSIoHeRIuxYzWZndhC2Q7BwCfWYYnIA.jpeg" class="" data-ratio="1.7777777777777777" data-w="1080"  /></p></section></section></section><section style="text-align: center;margin: -1px 0% 10px;height: 15px;background-image: url(&quot;./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTumMBtdjF62xSHH4Yb3lIRrbFoz21EnQzZwON479YTQrK1yp8oq6iaN7w.png&quot;);box-sizing: border-box;background-size: 100% 100%;background-repeat: no-repeat;"></section></section></section><p style="text-align: left;"><span style="background-color: transparent;color: rgb(255, 255, 255);font-family: inherit;font-weight: inherit;text-align: left;text-decoration: inherit;">我们没有阿里说，不过我们有千优说：</span></p><p style="text-align: left;"><span style="color: rgb(255, 255, 255);font-family: inherit;font-weight: inherit;text-decoration: inherit;">①你可以看山看水看月亮，也可以看书看画看手机，千优一直陪着你！</span></p></section><p style="text-align: left;"><span style="color: rgb(255, 255, 255);">②在千优，你是唯一的存在，有事别哭，你还有千优！</span></p><p style="text-align: left;"><span style="color: rgb(255, 255, 255);">③吃月饼的时候，不要忘记五仁馅的，毕竟它陪你走过童年！</span></p><p style="text-align: left;"><span style="color: rgb(255, 255, 255);">④亲，辛苦了，一路同行，感谢有你！</span></p><p style="text-align: left;"><span style="color: rgb(255, 255, 255);"></span></p><p><img data-s="300,640" data-type="png" src="./image/ibc6SrbQoSOo8TzPMj7uzibTBQBiaw7FMhjhicibRFYejCMQdjriag11OQ8BB6mA47ykNKkZfRibxhibsGMJibZPhLib3vVQ.png" class="" data-ratio="0.3794642857142857" data-w="224"  /></p><p><span style="color: rgb(255, 255, 255);">▼</span></p><p><span style="color: rgb(255, 255, 255);">而身为老板的你</span></p><p><span style="color: rgb(255, 255, 255);">还在四处奔波的<span style="color: rgb(216, 79, 169);background-color: rgb(255, 255, 255);"><strong><span style="color: rgb(216, 79, 169);background-color: rgb(255, 255, 255);font-size: 18px;">寻找客户</span></strong></span>吗？</span></p><p><span style="color: rgb(255, 255, 255);">那你就凹凸啦！</span></p><p><span style="color: rgb(255, 255, 255);">▼</span></p><p><span style="color: rgb(255, 255, 255);">移动互联网时代到来</span></p><p><span style="color: rgb(255, 255, 255);">大家都在<strong><span style="color: rgb(216, 79, 169);background-color: rgb(255, 255, 255);font-size: 18px;">千优科技做网络推广</span></strong></span></p><p><span style="color: rgb(255, 255, 255);">▼</span></p><p><strong><span style="color: rgb(255, 255, 255);">千优科技</span></strong></p><p><strong><span style="font-size: 18px;background-color: rgb(255, 255, 255);color: rgb(217, 33, 66);">帮您拥有更好的推广排名</span></strong></p><p><strong><span style="font-size: 18px;background-color: rgb(255, 255, 255);color: rgb(217, 33, 66);">展现企业魅力</span></strong></p><p><span style="color: rgb(255, 255, 255);">尽情放飞您的梦想</span></p><p><span style="color: rgb(255, 255, 255);">▼</span></p><p><span style="color: rgb(255, 255, 255);">最后</span></p><p><span style="color: rgb(255, 255, 255);"><span style="color: rgb(255, 255, 255);font-family: 微软雅黑;font-size: 16px;text-align: center;background-color: rgb(247, 96, 121);">▼</span></span></p><p><span style="color: rgb(255, 255, 255);">千优科技祝您中秋节快乐！</span></p><p style="text-align: center;"><br  /></p><section data-role="outer" label="Powered by 135editor.com" style="font-family:微软雅黑;font-size:16px;"><section class="_135editor" data-tools="135编辑器" data-id="90667" style="border-width: 0px;border-style: none;border-color: initial;box-sizing: border-box;"><section style="width:100%;" data-width="100%"><section style="width: 280px;height: 120px;margin: 10px auto;background-image: url(&quot;./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTu6ibsdLz42x4ibpwzdQhXW1cWhzIHCyJgaQzCSsqP2n6YFiasia8fnby9CA.jpeg&quot;);background-repeat: no-repeat;background-size: 100%;overflow: hidden;"><section style="width:95px;height:95px;margin-left:170px;margin-top:10px;"><img style="display: block;height: 100% !important;" src="./image/ibc6SrbQoSOpTCQqGbYhFAaOdxicYhrrTuialSgCzVibtR8LWTjcuwcpX6GnpJrojFVdKxfOHToleLN40icaLm5qTvQ.jpeg" data-width="100%" title="undefined" class="" data-ratio="1" data-w="430" data-type="jpeg"  /></section></section></section></section><p><span style="color: rgb(255, 255, 255);font-family: inherit;font-weight: inherit;text-decoration: inherit;"></span><br  /></p></section></section></section></section></section></section><p><br  /></p></section><p><br  /></p>', 0, 1507257222),
(53, 'https://kuaibao.qq.com/s/NEW2017100602178100?titleFlag=2&from=singlemessage', '习近平铸就“中国信仰”', './image/round_head_img_NEW2017100602178100.jpeg', '央视网', NULL, './image/round_head_img_NEW2017100602178100.jpeg', '', '<div class="content-box">\r\n                <p class="text">“人民有信仰，民族有希望，国家有力量。”</p><p class="text">——习近平</p><p class="text">1919年冬天，一位当过师范学校国文教员、叫陈望道的年轻人，回到了自己的家乡浙江省义乌市分水塘村。从寒冬到次年早春，他借着一盏昏暗的油灯，送走了一个又一个长夜，翻译《共产党宣言》。1920年8月，第一部《共产党宣言》中文全译本在上海出版。</p><p class="text">《共产党宣言》只有28000多个汉字。这本薄薄的小册子，成为中国共产党人信仰的起点。</p><p class="text">“人民有信仰，民族有希望，国家有力量。”这是习近平对理想信念作出的注脚。</p><p class="text">一个人有了坚定正确的理想信念，就能不懈努力、执着追求；一个国家和民族有了坚定正确的理想信念，就能披荆斩棘、攻坚克难。</p><p class="text">2012年11月17日，中央政治局组织第一次集体学习，习近平反复强调理想信念的重要性——</p><p class="text">“理想信念就是共产党人精神上的‘钙’，没有理想信念，理想信念不坚定，精神上就会‘缺钙’，就会得‘软骨病’。”</p><p class="text">党的十八大以来，以习近平同志为核心的党中央高度重视社会主义精神文明建设，着力全面从严治党，鼓舞和激励全国人民在党中央领导下为实现中华民族伟大复兴的中国梦不断奋进。</p><p class="text"><STRONG>精神文明建设 锻造中国信仰</STRONG></p><p class="text">“真正的社会主义不能仅仅理解为生产力的高度发展，还必须有高度发展的精神文明。”早在20多年前，习近平还在福建宁德工作时就提出这样的论断。</p><p class="text">2014年3月，习近平访问欧洲期间，又将精神文明这一概念带向世界：“实现中国梦，是物质文明和精神文明均衡发展、相互促进的结果。”“实现中国梦，是物质文明和精神文明比翼双飞的发展过程。”</p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2131216989/0" width= "100%" style="display:block;"/></p></p><p class="text">2015年2月28日，党和国家领导人习近平、刘云山等在北京人民大会堂会见第四届全国文明城市、文明村镇、文明单位和未成年人思想道德建设工作先进代表。（图片来源：新华社）</p><p class="text">党的十八大以来，以习近平同志为核心的党中央围绕精神文明建设多次召开会议，组织专题集体学习，进行全面研究部署：召开全国宣传思想工作会议；召开中央文明委全体会议；召开全国宣传部长、文明办主任会议；政府多次就精神文明建设领域工作出台各类意见、通知……</p><p class="text">对于一个民族、一个国家来说，最持久、最深层的力量是全社会共同认可的核心价值观，这关乎国家前途命运，关乎人民幸福安康。</p><p class="text">党的十八大提出，倡导富强、民主、文明、和谐，倡导自由、平等、公正、法治，倡导爱国、敬业、诚信、友善，从国家、社会、公民三个层面，积极培育和践行社会主义核心价值观。</p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2131216990/0" width= "100%" style="display:block;"/></p></p><p class="text">2013年9月26日，习近平在北京会见第四届全国道德模范及提名奖获得者。这是习近平同全国道德模范龚全珍亲切交谈。（图片来源：新华社）</p><p class="text">“向龚老前辈表示致敬！”2013年9月26日，北京京西宾馆会议楼前厅，习近平在会见第四届全国道德模范及提名奖获得者时，向一位“老阿姨”致以崇高敬意。</p><p class="text">伟大时代呼唤伟大精神，崇高事业需要榜样引领。</p><p class="text">各地区各部门按照党中央部署，不断推进道德建设，中华大地涌现出一大批道德模范、时代楷模、中国好人、最美人物。他们中间，有的助人为乐、见义勇为，有的诚实守信、敬业奉献，有的和睦邻里、孝老爱亲……</p><p class="text">航空英模罗阳、甘当“燃灯者”的邹碧华、“太行新愚公”李保国……一个个闪光的名字，照亮了整个社会的价值星空。</p><p class="text">通过持续发掘、宣传、学习，先进典型的社会影响力和“传帮带”作用不断发挥，越来越多的群众积极行动起来，把良好的道德情操体现在日常工作和生活中，使培育和践行社会主义精神文明建设落细落小落实，社会主义精神文明焕发新风。</p><p class="text"><STRONG>全面从严治党 传承中国信仰</STRONG></p><p class="text">改革开放30多年来，一些党员干部受到市场经济负面效应和各种腐朽思想的影响，开始出现以形式主义、官僚主义、享乐主义和奢靡之风为主要表现的“四风”问题，抹黑了党在人民群众心目中的良好形象，损害了党群关系。正如习近平所强调：“现实生活中，一些党员、干部出这样那样的问题，说到底是信仰迷茫、精神迷失。”</p><p class="text">铁一般的信仰、铁一般的信念、铁一般的纪律、铁一般的担当，这是习近平对领导干部的要求，也是对全党的要求。</p><p class="text">初冬的江苏草青风和，洋溢着蓬勃生机。2014年12月，习近平深入企业、乡村、农户，顶着夜色到科研院所考察调研。他强调：“全面从严治党是推进党的建设新的伟大工程的必然要求。”这次考察中，习近平首次公开将“全面从严治党”与“全面建成小康社会”“全面深化改革”“全面推进依法治国”一并提出。“四个全面”吹响了治国理政新号角。</p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2131216991/0" width= "100%" style="display:block;"/></p></p><p class="text">2016年1月12日，习近平在中国共产党第十八届中央纪律检查委员会第六次全体会议上发表重要讲话。（图片来源：新华社）</p><p class="text">时间回溯到2012年底，习近平主持召开的中共中央政治局会议审议通过了关于改进工作作风、密切联系群众的“八项规定”，并将其作为改进全党作风的第一步。随后，从严治党的配套措施相继实施：</p><p class="text">——明确底线、握紧戒尺、立起规矩，把纪律规矩挺在前面。党的十八大以来，出台或修订近80部党内法规，超过现有党内法规的40%，从严治党、从严治吏的制度笼子越扎越紧。</p><p class="text">——推动党的群众路线教育实践活动。“三严三实”专题教育、“两学一做”学习教育常态化制度化，严肃党内政治生活，净化党内政治生态，纯洁党的工作作风。</p><p class="text">——强化各级党组织在干部选拔任用中的领导和把关作用，培养对党忠诚、确实为老百姓想事干事、老百姓信赖的好干部，着力建设一支高素质干部队伍。</p><p class="text">——深入开展反腐败斗争，勇敢地向自己开刀，坚持无禁区、全覆盖、零容忍，“老虎”“苍蝇”一起打。</p><p class="text">截至2017年6月底，全国累计查处违反中央八项规定精神问题17万多起，处分13万多人。</p><p class="text">国家统计局开展的全国党风廉政建设民意调查数据显示，党的十八大召开前，人民群众对党风廉政建设和反腐败工作的满意度是75%。十八大以后，2013年是81%，2014年是88.4%，2015年是91.5%，2016年是92.9%，逐年走高。</p><p class="text">信仰在传承，事业在延续。如果说，在“革命理想高于天”的年代，英雄儿女为共产党人的信仰绘就了基本底色，在“激情燃烧的岁月”，先进典型为共产党人的信仰构筑了精神高地。那么，在与时俱进的改革开放新时期，站在时代潮头的先锋们，则展示出共产党人为了信仰，永葆先进纯洁的崭新面貌。</p><p class="text"><STRONG>民族复兴梦想 凝聚中国信仰</STRONG></p><p class="text">2012年11月29日，习近平和中央政治局常委在国家博物馆参观《复兴之路》展览。他神色坚定地说：“实现中华民族伟大复兴，就是中华民族近代以来最伟大的梦想。”</p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2131216992/0" width= "100%" style="display:block;"/></p></p><p class="text">2012年11月29日，习近平和中央政治局常委李克强、张德江、俞正声、刘云山、王岐山、张高丽等来到国家博物馆，参观《复兴之路》展览。（图片来源：新华社）</p><p class="text">回顾中华民族五千年文明史，中国在古代创造了辉煌灿烂的农业文明，但饱受欺凌的近代史却让每一个中国人不堪回首。一百多年来，正是由于强大的信仰，中华民族才能百折不挠奋勇前进，历经磨难不断壮大。</p><p class="text">“党的十八大以来的5年，是党和国家发展进程中很不平凡的5年。”</p><p class="text">2017年9月25日，党的十九大即将召开之际，习近平前往北京展览馆，参观“砥砺奋进的五年”大型成就展。一件件实物模型、一段段视频资料、一张张图片图表，吸引了习近平的目光。</p><p class="text">习近平强调，5年来，党中央团结带领全党全国各族人民，统筹推进“五位一体”总体布局、协调推进“四个全面”战略布局，团结一心，与时俱进，顽强拼搏，攻坚克难，推动中国特色社会主义事业取得长足发展、人民生活得到显著改善，党和国家事业取得历史性成就、发生历史性变革。</p><p class="text">“我坚信，到中国共产党成立100年时全面建成小康社会的目标一定能实现，到新中国成立100年时建成富强民主文明和谐的社会主义现代化国家的目标一定能实现，中华民族伟大复兴的梦想一定能实现。”习近平的话，为人民描绘了一张未来发展的美好蓝图。</p><p class="text">中国信仰拥有凝聚全党和全国人民的强大力量，也是实现中华民族伟大复兴中国梦的精神动力。党的十八大以来，新一代领导集体以“中国梦”为目标，进一步凝聚党心民意，努力践行群众路线，将全国人民团结在一起，为实现“两个一百年”目标而奋斗不止。（文/林孔仕）</p>\r\n                </div>', 0, 1507375144),
(54, 'https://kuaibao.qq.com/s/20171006A051DA00?refer=kb_news&titleFlag=2', '他，九年前破坏庾澄庆伊能静婚姻，如今晒照，网友：做作！', './image/round_head_img_20171006A051DA00.jpeg', '小新说娱', NULL, './image/round_head_img_20171006A051DA00.jpeg', '他，九年前破坏庾澄庆伊能静婚姻，如今晒照，网友：做作！', '<div class="content-box">\r\n                <p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2132892792/0" width= "100%" style="display:block;"/></p><p class="text">相信很多人都知道庾澄庆和伊能静曾经有过一段二十多年的感情，共同育有一子。伊能静甚至用吴静怡的化名为庾澄庆写了很多歌词。其中《春泥》这首歌就是伊能静为他们的爱情而作的，那时很多人都觉得这对金童玉女能像童话结局一般。</p></p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2132892783/0" width= "100%" style="display:block;"/></p><p class="text">然而2008年，有夫之妇的伊能静与演员黄维德被爆“牵手门”，两人的形象尽毁。</p></p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2132892797/0" width= "100%" style="display:block;"/></p><p class="text">而作为“小三”的黄维德更是被千夫指责，然而在舆论面前，两人去没有终止关系，2009年，伊能静正式公开离婚。</p></p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2132892773/0" width= "100%" style="display:block;"/></p><p class="text">不过，即便黄维德破坏了哈林的婚姻，却没有和伊能静走到最后。而如今成为伊能静第二任丈夫的是比之小10岁的秦昊。</p></p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2132892787/0" width= "100%" style="display:block;"/></p><p class="text">而因黄维德插足而导致婚姻破裂的哈林，如今已与主播妻子造人成功。</p></p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2132892834/0" width= "100%" style="display:block;"/></p><p class="text">但反观黄维德，这些年背负千万巨债，将近50岁也依然未婚，且演艺事业也一直没什么起色。直至前两年凭借《琅琊榜》的誉王一角才重回大众视野。</p></p><p class="text"><p align=center><img src="http://inews.gtimg.com/newsapp_match/0/2132892864/0" width= "100%" style="display:block;"/></p><p class="text">最近，黄维德晒出自己的近照，照片中的他没有一丝皱纹，看着一点都不像50岁的人。有网友评论：“大叔变鲜肉”，但也有网友评论p图太明显，做作了点。不管怎样，既然伊能静和庾澄庆都已经各自找到自己的幸福，也希望黄维德能安好。</p></p>\r\n                </div>', 0, 1507375648);
INSERT INTO `cool_wdjcontent` (`wid`, `url`, `title`, `cover`, `nickname`, `ct`, `round_head_img`, `msg_desc`, `content`, `hits`, `addtime`) VALUES
(60, 'https://mp.weixin.qq.com/s/oY09RJwYDdn7Q_fudlj8mw', '97年模特因太美遭遇校园暴力，退学后却走红INS，成宇宙第一直男杀手......', './image/cover_img_gh_4ef98011424e.jpeg', '背包旅行', '1507384800', './image/round_head_img_gh_4ef98011424e.png', '点击题目下方背包旅行，订阅中国顶尖旅行杂志', '<p style="max-width: 100%;min-height: 1em;white-space: pre-wrap;line-height: 23.2727px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.43" data-s="300,640" src="./image/Hk0NAXoSxTTJPoOMk5QtiaWdeEmzs0qnMpbcq5diamqiam6XG7ibzKnk8Sfkbfiax2yJaiaM43vHznyycgzq2UpeB1PA.jpeg" data-type="png" data-w="100" style="color: rgb(31, 73, 125);line-height: 31px;font-family: Helvetica;font-weight: bold;box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;white-space: pre-wrap;line-height: 23.2727px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><img class="__bg_gif" data-ratio="1.0909090909090908" src="./image/B3L0iaN0AXA3atNSuv2oVBx2NH9qEUcX8KNg9whpCPGW4echHicn9FicqqNg1ejA2fx1dAtrhb5n3qwdlJoiaaVg8w.gif" data-type="gif" data-w="11" style="box-sizing: border-box;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"><span style="max-width: 100%;box-sizing: border-box;color: rgb(89, 89, 89);font-size: 12px;word-wrap: break-word !important;">点击题目下方</span><span style="max-width: 100%;box-sizing: border-box;line-height: 2em;font-size: 12px;color: rgb(61, 170, 214);word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box;word-wrap: break-word !important;">背包旅行</strong></span><span style="max-width: 100%;box-sizing: border-box;color: rgb(89, 89, 89);font-size: 12px;word-wrap: break-word !important;">，<span style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;">订阅中国</span>顶尖旅行杂志</span></p><hr style="max-width: 100%;line-height: 23.2727px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"  /><p style="max-width: 100%;min-height: 1em;white-space: pre-wrap;line-height: 23.2727px;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p data-mpa-powered-by="yiban.io" style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">因为小时候长得Q萌可爱</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">集万千宠爱于一身的童星不在少数</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">幼时的成名对于每一个孩子来说</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">都如同一把双刃剑</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">享受着宠爱的同时</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">也可能会遭受一部分人的嘲讽</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7wWfygclJuDml6CdibSkUGDwMzIck5XOcuG47wSW1jYYY5PkpMib8votA.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">97年的Celine</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">因为长相甜美</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">3岁便签约知名模特经纪公司</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" src="./image/defult/defult.jpeg?" data-w="480" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">14岁却因为美，差点坠入深渊</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1.249074074074074" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA73icIgAZL21j9AavMZWoibALtajr4YxIOGlF95zLQGJR7HHTkBapyrNmQ.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">在同学中，或许是她的光芒</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">成为大家口中的另类<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">大家对她指指点点、渐渐疏远</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">甚至拿着她的海报说</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">“整天就知道在镜头前卖弄”</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7gZL95TCAnBWPQQndxxJJW401OCKx7UDXlhEyFXMDbjeYAs3GsK7O0Q.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">连唯一的朋友都被警告</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">“不允许跟她玩儿”</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">14岁的Celine一边面对工作一边面对学业</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">孤独、委屈、压力</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">这样的校园冷暴力压得她喘不过气</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">最终选择了退学</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.6648148148148149" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7iceIFdxcib4uMhFI9A2cVSImdrheicPmfCfMiaJBWJo06DX0eWnvZ6cJAg.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">退学之后，她更加的迷茫</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">她不明白自己到底做错了什么</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">直到把自己逼进了死胡同</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">患上了抑郁症<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7Gyv4rxlMuwruHkOt9NDMXL7tXgm2lA3QfibBaRulxN55IPloweXblsg.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">她不愿和人交流</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">唯一的伙伴是一只宠物狗</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1.0731481481481482" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">&nbsp;害怕因为外貌而被人评头论足</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">拍照故意不露脸<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="612" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="640" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">当她处在人生的低谷时</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">她的妈妈用音乐去鼓励和感染她</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="750" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">用音乐对抗内心的恶魔<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">写歌、谱曲、创作、表达内心</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">上传到网上之后，受到了许多人的鼓舞</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.75" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">因为音乐，原来的那个她好像重生了</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">她把所有的情感都唱出来</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">仿佛在发泄，又仿佛在淡淡讲述</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">“为什么要在乎别人的看法呢，</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">开心地做自己就好”</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">&nbsp;</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.996937212863706" data-s="300,640" src="./image/defult/defult.png?" data-type="png" data-w="653" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">重新认识和结交新朋友<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">一起玩音乐、一起参加音乐节</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1.006861063464837" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="583" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">还推出的第一首单曲《SEX》</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7IMj5PBic6UQ0047vCafepayBNKAcXCexUHmrqIShntNTcXVOAbcMYZw.jpeg" data-type="jpeg" data-w="1000" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">正在筹备自己的第一张专辑</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">预计将于今年年底推出</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="434" style="width: 670px;box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;" width="100%"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">舞台上的她重新找回了那个光芒四射的自己</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">“上帝给了你特别的容貌，</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">一定是想让你成为一个特别的人，”</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">美好的东西就应该大胆地展示出来”</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7M3at2UvKPicnLdsDcAxrPNicZPAn0nsibicuSrYeltbicTicywANYO7sChibA.jpeg" data-type="jpeg" data-w="692" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">于是她重新拾起自己的模特事业</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">开始健身、拳击、塑形</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="__bg_gif" data-ratio="1.25" src="./image/defult/defult.gif?" data-w="200" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">现在的Celine是这样的</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">自信、优雅、性感、活泼</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">任何一个美好的形容词用在她身上都不为过</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7ibibVGWgK6MKT0OHz772ib9JQd55sE8SYCDggZxFQkyaL2p68sxZl4bOw.jpeg" data-type="jpeg" data-w="746" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">剪刀手的俏皮可爱</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">把精致的五官，完美的无可挑剔</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.6666666666666666" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7Tkdl6E0wtqbMhwFEncTyeibaibtVbtZ21hbH1bmIubF1dmNSC6DHJcibA.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">傲人的身材让女生的目光都会追随于她</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7mlJ0KvpEc9YktXrIM2HPKUmSHnfXibMXwF0owLgYfWCL72B8et1kThA.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7KRHggPEL5aQ6njMMicQJXp7jrvaQnFbLc0YSsISjPgExYukmDNicibppw.jpeg" data-type="jpeg" data-w="1029" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">随风的秀发、迷离的眼神</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">知性？还是性感？</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">或许都有吧</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7P7XadygrdQ92DTFZ3sSAyFW4HBv8NSGGaqqRtSM8e9KZicjCWaSj1pw.jpeg" data-type="jpeg" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">微卷的头发，妥妥的增加了亲和力</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">有种邻家小姐姐的感觉</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1.0014492753623188" src="./image/defult/defult.jpeg?" data-w="690" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">阳光下，整个人都在发光</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1.2497331910352187" data-s="300,640" src="./image/L02icsLGvDxlV8L85xJe4YZ2Wicq1OWoA7BOQYLMEYW9LXUFbibuvWPms9ktib6X6veiaQGWzHWyYic1RIE5M4okFe5g.jpeg" data-type="jpeg" data-w="937" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">为各大品牌拍摄广告</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">相继登上香港MENCLUB杂志</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1.169064748201439" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="556" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">以及台湾版GQ封面</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="1.2497331910352187" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="937" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">她用自己的人生，实力证明着<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">杀不死你的，必定使你强大！</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">如今你用歌声和模特事业<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">回复那些曾经的嘲笑<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><strong style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;color: rgb(122, 68, 66);box-sizing: border-box !important;word-wrap: break-word !important;">用明媚的笑容和最好的自己向世界发功</span></strong></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.6648148148148149" src="./image/defult/defult.jpeg?" data-w="1080" style="box-sizing: border-box !important;word-wrap: break-word !important;width: auto !important;visibility: visible !important;"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">用阳光般的温暖<br style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">呼吁人们关注校园暴力和网络暴力<br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><span style="max-width: 100%;font-size: 15px;box-sizing: border-box !important;word-wrap: break-word !important;">积极帮助那些正在遭受校园霸凌的孩子</span></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);box-sizing: border-box !important;word-wrap: break-word !important;"><br data-filtered="filtered" style="max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;"  /></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62);font-size: 16px;white-space: normal;background-color: rgb(255, 255, 255);text-align: center;box-sizing: border-box !important;word-wrap: break-word !important;"><img class="" data-ratio="0.6927536231884058" data-s="300,640" src="./image/defult/defult.jpeg?" data-type="jpeg" data-w="690" style="box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;" width="auto"></p><p style="max-width: 100%;min-height: 1em;color: rgb(62, 62, 62)', 0, 1507388134);
INSERT INTO `cool_wdjcontent` (`wid`, `url`, `title`, `cover`, `nickname`, `ct`, `round_head_img`, `msg_desc`, `content`, `hits`, `addtime`) VALUES
(61, 'https://kuaibao.qq.com/s/20171007A017MX00?refer=kb_news', '诺基亚遗产N950亮相：这画面让粉丝飙泪！', './image/round_head_img_20171007A017MX00.jpeg', '快数码', NULL, './image/round_head_img_20171007A017MX00.jpeg', '你曾经最爱的是哪款诺基亚的手机呢？下面这款你觉得如何？现在，推特爆料大神@Evan Blass刚刚又戳了老诺粉的泪点，放出了诺基亚N950手机的渲染图，看起来还是原来熟悉的味道。你肯定没有听说过这款机型，因为它从未正式发布，也从未销售过，N950搭载诺基亚自家的Meego系统，外观设计继承了N9的2.5D聚碳酸酯一体式机身与N95...', '<div class="content-box">\r\n                <p class="text">你曾经最爱的是哪款诺基亚的手机呢？下面这款你觉得如何？</p><p class="text">现在，推特爆料大神@Evan Blass刚刚又戳了老诺粉的泪点，放出了诺基亚N950手机的渲染图，看起来还是原来熟悉的味道。</p><p class="text"><p align=center><img src="./image/2134203246.jpeg" width= "100%" style="display:block;"/></p></p><p class="text">你肯定没有听说过这款机型，因为它从未正式发布，也从未销售过，N950搭载诺基亚自家的Meego系统，外观设计继承了N9的2.5D聚碳酸酯一体式机身与N95的侧滑全键盘，这应该是这款机型命名为N950的原因。</p><p class="text">当然这这款机型并没有仅仅停留在渲染图上，目前一些外国网友已经放出了原型机的上手视频，证明当初诺基亚确实已经把这款机型做了出来。</p><p class="text"><p align=center><img src="./image/2134203296.jpeg" width= "100%" style="display:block;"/></p></p><p class="text">看着N950笔者不禁陷入沉思，如果当初诺基亚坚持自己的Meego会怎么样呢？可惜历史没有如果……</p>\r\n                </div>', 0, 1507430139),
(62, 'http://view.inews.qq.com/w/WXN2017100702490908', '千万只红螃蟹迁徙覆盖整个海岛 街道如同铺红毯(视频)', './image/cover_img_2162241823.jpeg', '腾讯视频', '2017-10-07 16:08:46', './image/cover_img_2162241823.jpeg', '千万只红螃蟹迁徙覆盖整个海岛 街道如同铺红毯(视频)', '\r\n    <div class="inner"></div>\r\n</div>\r\n<div class="header" bosszone="wxn_logo">\r\n    <a href="http://www.qq.com/"><img src="//mat1.gtimg.com/www/mobi/wx/images/icon-logo.jpg" alt="腾讯新闻事实派" class="logo"></a>\r\n   <!--  <div class="erweimaBox">\r\n        <dl>\r\n            <dt>\r\n                <img src="http://mat1.gtimg.com/news/2013/qqnews/qrcode2015.jpg">\r\n            </dt>\r\n            <dd>微信扫一扫</dd>\r\n            <dd>下载腾讯新闻客户端</dd>\r\n        </dl>\r\n    </div> -->\r\n</div>\r\n<div class="main">\r\n    <div class="cont">\r\n        <h1>千万只红螃蟹迁徙覆盖整个海岛 街道如同铺红毯(视频)</h1>\r\n        <div class="tit-bar">\r\n            <span class="origin">腾讯视频</span><span class="date">2017-10-07 16:08:46</span><span class="comment-num">1993评</span>\r\n        </div>\r\n        \r\n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <div class="mobvideonews" type="news"><div class="mobvideonews_imgArea" bosszone="wxn_spfmt" style="width:100%; min-height:150px;" data-mobvideoqnreading="0"><a href="/cmsid/NEW2017100702318603"><img src="//inews.gtimg.com/newsapp_ls/0/2135153159_580360/0" alt=""><div class="imgBg"></div><div class="playBtn"></div><div class="topDesc"><p class="mobvideoTitle">螃蟹大军迁徙覆盖海岛 街道似铺红毯</p></div><div class="bottomDesc">现场视频</div></a></div><a class="unified_downloader downloader_download" href="/cmsid/NEW2017100702318603" bosszone="wxn_spmc" type="news" style="visibility: visible;"><div class="downloader_progress"></div><div class="downloader_text">螃蟹大军迁徙覆盖海岛 街道似铺红毯</div></a></div><p class="text">最近在澳大利亚圣诞岛，成千上万只新生红螃蟹在海底出生后向陆地迁徙，使得岛上变成了一片红色海洋，看上去像是铺了一条巨大的红毯。</p><p class="text">幼蟹很难在海里变化无常的环境中生存下来，所以会迁徙到陆地上的丛林中，在这个岛上估计生活着数千万只红蟹。到今年11至12月间，岛上的成年螃蟹将进行另一次迁徙，回到海中产卵。</p><p class="text"><a href="http://news.qq.com/FERD/CJdown.htm">看新闻领红包！看红蟹迁徙奇观，领百万现金红包</a></p><p class="text"><a href="http://view.inews.qq.com/a/20171007A03LRL00">问答：澳洲红蟹是一种怎样的螃蟹？为什么会成群结队迁徙？</a></p>\r\n                </div>\r\n    <div class="tool-bar">\r\n        <a href="http://www.qq.com/" bosszone="wxn_zwfhsy" class="return">回到腾讯网，看更多今日热点</a>\r\n        <div class="sharebox">\r\n            <i>分享到：</i>\r\n            <a href="javascript:void(0)" bosszone="wxn_txwb" class="qqweibo">腾讯微博</a>\r\n            <a href="javascript:void(0)" bosszone="wxn_qqzone" class="qzone">QQ空间</a>\r\n            <a href="javascript:void(0)" bosszone="wxn_qq" class="qq">QQ</a>\r\n            <a href="javascript:void(0)" bosszone="wxn_sinawb" class="weibo">新浪微博</a>\r\n            <a href="javascript:void(0)" bosszone="wxn_weixin" class="wechat">微信</a>\r\n        </div>\r\n        <div class="wemcn" id="wemcn">\r\n            <div id="ewm" class="ewmDiv clearfix">\r\n                <div id="ewmimg" class="ewmimg" style="width: 85px; height: 85px; float: left; display: inline;"></div>\r\n                <div class="rwmtext">\r\n                    <p>扫一扫，用手机看新闻！</p>\r\n                    <p>用微信扫描还可以</p>\r\n                    <p>分享至好友和朋友圈</p>\r\n                </div>\r\n            </div>\r\n            <a href="javascript:void(0)" id="ewmkg"></a>\r\n            <i class="ewmsj"></i>\r\n        </div>\r\n    </div>\r\n\r\n        <div class="commentBox">\r\n        <div class="title"><span class="title_content">精选评论</span></div>\r\n        <div class="commentScrollWrap">\r\n            <ul>\r\n                                <li>\r\n                    <div class="liWrap">\r\n                        <div class="avatar"><img src="//q2.qlogo.cn/g?b=qq&k=nNtT4pTDAic33HYNia6IbnibA&s=40&t=1507392000"></div>\r\n                        <div class="nameBar">\r\n                            <span>曼珠沙华</span>\r\n                            <span class="time_need_reform">19小时前</span>\r\n                        </div>\r\n\r\n                        <div class="contentBox">\r\n                            <p class="content">八角 生姜 红叶 胡椒 清煮去味提鲜！捞出控干。锅里加油烧热下蟹！炸至酥脆。捞出撒上孜然粉 ，花椒粉，最后葱花撒上。上盘！</p>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                                <li>\r\n                    <div class="liWrap">\r\n                        <div class="avatar"><img src="//q2.qlogo.cn/g?b=qq&k=IIMoIicDImAmpHVXFN731uQ&s=40&t=1507392000"></div>\r\n                        <div class="nameBar">\r\n                            <span>一叶知秋</span>\r\n                            <span class="time_need_reform">2017-10-07</span>\r\n                        </div>\r\n\r\n                        <div class="contentBox">\r\n                            <p class="content">同样八条腿，如果换成是蜘蛛，那就变成了恐怖片……</p>\r\n                        </div>\r\n                    </div>\r\n                </li>\r\n                            </ul>\r\n            <a class="more-comment" bosszone="wxn_gdpl" href="http://wxn.qq.com/c/comments/2162241823/WXN2162241823">查看更多评论（1993）</a>\r\n        </div>\r\n    </div>\r\n    \r\n        <div class="title"><span class="title_content">相关新闻</span></div>\r\n    <ul class="newslist" bosszone="wxn_xgxw">\r\n                        <li class="txt">\r\n            <a href="//wxn.qq.com/cmsid/20171007A00G3600">\r\n            <div class="info">\r\n                <div class="cont-p">\r\n                    <p>女儿晒假期返程照 母亲送别场面引网友泪奔</p>\r\n                </div>\r\n                <p class="cont-bar">腾讯新闻 </p>\r\n            </div>\r\n            </a>\r\n        </li>\r\n                                <li class="txt">\r\n            <a href="//wxn.qq.com/cmsid/20171007A0204E00">\r\n            <div class="info">\r\n                <div class="cont-p">\r\n                    <p>知名厨师返乡开挖掘机 20多天赚9万</p>\r\n                </div>\r\n                <p class="cont-bar">腾讯新闻 </p>\r\n            </div>\r\n            </a>\r\n        </li>\r\n                    </ul>\r\n            <div class="title last"><span class="title_content">精彩推荐</span></div>\r\n    <ul class="newslist" id="paclist" bosszone="wxn_jctj">\r\n            </ul>\r\n        <!--ul class="newslist" id="paclist">\r\n    </ul>\r\n    <div class="morelist">点击查看更多</div>\r\n    <div class="more-txt">加载中...</div-->\r\n    <a href="http://www.qq.com/" bosszone="wxn_dbdh" class="goqq">回到腾讯网首页 看更多热点新闻</a>\r\n</div>\r\n<div class="naver">\r\n    <ul class="navlist" bosszone="wxn_dbfhsy">\r\n        <li><a href="http://www.qq.com/" target="_blank">首页</a></li>\r\n        <li><a href="http://news.qq.com/" target="_blank">新闻</a></li>\r\n        <li><a href="http://sports.qq.com/" target="_blank">体育</a></li>\r\n        <li><a href="http://ent.qq.com/" target="_blank">娱乐</a></li>\r\n        <li><a href="http://finance.qq.com/" target="_blank">财经</a></li>\r\n        <li><a href="http://fashion.qq.com/" target="_blank">时尚</a></li>\r\n        <li><a href="http://tech.qq.com/" target="_blank">科技</a></li>\r\n        <li><a href="http://auto.qq.com/" target="_blank">汽车</a></li>\r\n        <li class="none"><a href="http://edu.qq.com/" target="_blank">教育</a></li>\r\n        <li><a href="http://v.qq.com/" target="_blank">视频</a></li>\r\n        <li><a href="http://mil.qq.com/" target="_blank">军事</a></li>\r\n        <li><a href="http://sports.qq.com/nba/" target="_blank">NBA</a></li>\r\n        <li><a href="http://ent.qq.com/star/" target="_blank">明星</a></li>\r\n        <li><a href="http://stock.qq.com/" target="_blank">股票</a></li>\r\n        <li><a href="http://astro.fashion.qq.com/" target="_blank">星座</a></li>\r\n        <li><a href="http://digi.tech.qq.com/" target="_blank">数码</a></li>\r\n        <li><a href="http://cul.qq.com/" target="_blank">文化</a></li>\r\n        <li class="none"><a href="http://pp.qq.com/" target="_blank">图片</a></li>\r\n    </ul>\r\n</div>\r\n<a href="javascript:;" bosszone="wxn_top" class="go_top_btn" style="display: none;"></a>\r\n', 0, 1507445035);
INSERT INTO `cool_wdjcontent` (`wid`, `url`, `title`, `cover`, `nickname`, `ct`, `round_head_img`, `msg_desc`, `content`, `hits`, `addtime`) VALUES
(63, 'http://mp.weixin.qq.com/s/oiMvx_7AtOLV_2tRn1-RaQ', '过节胖了3斤？跟我这样吃，瘦6斤', './image/cover_img_gh_f75045bd27e4.jpeg', '美食菜谱小羽私厨', '1507608297', './image/round_head_img_gh_f75045bd27e4.jpeg', '减肥别挨饿，否则越来越胖', '<section style="background-color: rgb(255, 255, 255);box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="text-align: center;margin-top: 10px;margin-bottom: 10px;box-sizing: border-box;"><img style="vertical-align: middle;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeibXNQlTmapVLXF6CArFKo5w2EnvxRHmm8wNsPiaDH7khmnPNSsticrtHw.gif" data-ratio="0.2255859" data-w="1024" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="text-align: center;font-size: 29px;box-sizing: border-box;"><section class="" style="box-sizing: border-box;display: inline-block;vertical-align: bottom;margin-right: auto;margin-bottom: 0.2em;margin-left: auto;width: 3em;height: 3em;border-radius: 100%;background-position: center center;background-repeat: no-repeat;background-size: cover;box-shadow: rgb(102, 102, 102) 3.53553px 3.53553px 5px;background-image: url(&quot;./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15Xe60YtQKzib8P6FkibguObX6ibzTJlqAO7YZcar5eAKmYphIIU1nSFU3G1g.jpeg&quot;);"><section class="" style="width: 100%;height: 100%;overflow: hidden;box-sizing: border-box;"><img class="" style="width: 100%;height: 100%;opacity: 0;box-sizing: border-box;" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15Xe60YtQKzib8P6FkibguObX6ibzTJlqAO7YZcar5eAKmYphIIU1nSFU3G1g.jpeg" data-ratio="1" data-w="640" width="100%" data-type="jpeg"  /></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-right: 0%;margin-bottom: 10px;margin-left: 0%;box-sizing: border-box;"><section class="" style="font-size: 12px;letter-spacing: 2px;box-sizing: border-box;"><p style="text-align: center;box-sizing: border-box;">「用最简单的方法，做最美味的食物——小羽」<br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;color: rgb(255, 133, 133);line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="text-align: center;box-sizing: border-box;"><strong style="box-sizing: border-box;">↓↓ 先看视频，猜猜今天要做什么呢？&nbsp;</strong><strong style="box-sizing: border-box;">↓↓</strong></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><iframe class="video_iframe" data-vidtype="2" allowfullscreen="" frameborder="0" data-ratio="1.7666666666666666" data-w="848" src="https://v.qq.com/iframe/preview.html?vid=s05589lbifv&amp;width=500&amp;height=375&amp;auto=0"></iframe><br  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p><p style="box-sizing: border-box;"><br  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="transform: translate3d(0px, 0px, 0px);-webkit-transform: translate3d(0px, 0px, 0px);-moz-transform: translate3d(0px, 0px, 0px);-o-transform: translate3d(0px, 0px, 0px);text-align: center;box-sizing: border-box;"><section class="" style="display: inline-block;width: 60%;vertical-align: top;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;opacity: 0.8;box-sizing: border-box;"><img style="vertical-align: middle;width: 20%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeEVz16iaw7OZ4X5kJeDSCia4gQo7tCWet7mIERTnwicq39hR1IJMvx11kQ.png" data-ratio="0.4294479" data-w="163" width="20%" data-type="png"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;transform: translate3d(0px, 0px, 0px);-webkit-transform: translate3d(0px, 0px, 0px);-moz-transform: translate3d(0px, 0px, 0px);-o-transform: translate3d(0px, 0px, 0px);box-sizing: border-box;"><section class="" style="border-top: 0.1em solid rgb(0, 0, 0);border-bottom: 0.1em solid rgb(0, 0, 0);padding: 2px;line-height: 1.3;font-size: 14px;letter-spacing: 10px;color: rgb(255, 133, 133);box-sizing: border-box;"><p style="box-sizing: border-box;">五彩蔬菜钵</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="text-align: left;font-size: 12px;box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">最近中秋节加上国庆节，天天在外面好吃好喝，结果昨天一上班，悲催的发现裤子穿上已经紧绷的不行了，真是每逢佳节胖三斤，定睛一看还是“公斤”，你听得到我内心的呐喊不啦？</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 0.5em auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeCvQHiclIc8lEiaf5fzNQKtnZ57xZsoncajUPHykk8hZV1aShvQ0uIFdw.jpeg" data-ratio="0.6671875" data-w="640" width="85%" data-type="jpeg"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">哎，所以从上班开始，老老实实的回归清淡饮食。我是不提倡暴饮暴食之后再玩命把自己饿三天这种辣手摧花的做法的。毕竟身体是很聪明的，你饿他三天，他转身就会启动饥饿模式，把吃进肚子里的东西统统转化成脂肪贮存起来，因为他不知道你下次吃饭是什么时候，为了保证各个零部件能正常运转，他必须在你每次吃东西时，就把能量都储存起来，等你下次饿着他的时候，他才不会垮掉。<br style="box-sizing: border-box;"  /></p><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p><p style="box-sizing: border-box;">所以，我们要科学的吃好每餐饭，才能达到即瘦身排毒，又营养健康不胖的目的。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 0.5em auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeL4trJARMUE2dg7I7VqJ4TgaDVH1uJdeuLGG3anpxGb18tVIbodqdXg.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">今天跟你分享的就是<strong style="box-sizing: border-box;">五彩蔬菜钵</strong>，有青菜、香菇、鸡肉、胡萝卜和彩椒，营养全面，样子漂亮，让你适当控制饮食的时期，依然可以吃的开心又满足。<br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 0.5em auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeXyIN70udg7jDWMSxQoI97BgCGGTXLpzaSsDxgW9R1xg0zYOtnZpkKw.jpeg" data-ratio="1.4992679" data-w="683" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">今天的第二条，还有我专门为你准备的，当下国外非常流行的“<strong style="box-sizing: border-box;">罗汉碗</strong>”的做法，就是在一碗里把谷物、豆类、蔬菜、水果、高蛋白肉类、坚果等通通码齐，让你在这一碗里就把所有营养都一次吃全~<br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;font-size: 13px;box-sizing: border-box;"><section class="" style="display: inline-block;vertical-align: top;box-sizing: border-box;"><section style="display: inline-block;vertical-align: top;line-height: 1em;box-sizing: border-box;"><section style="width: 0px;margin-right: -0.5em;display: inline-block;vertical-align: top;border-top: 1em solid rgb(255, 126, 145);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section><section style="width: 0px;display: inline-block;vertical-align: top;border-bottom: 1em solid rgb(255, 230, 232);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section></section><section class="" style="display: inline-block;vertical-align: top;line-height: 1em;padding-left: 6px;padding-right: 6px;color: rgba(246, 134, 164, 0.83);font-size: 14px;box-sizing: border-box;"><p style="box-sizing: border-box;">用料</p></section><section style="display: inline-block;vertical-align: top;line-height: 1em;box-sizing: border-box;"><section style="width: 0px;display: inline-block;vertical-align: top;margin-right: -0.5em;border-bottom: 1em solid rgb(255, 126, 145);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section><section style="width: 0px;display: inline-block;vertical-align: top;border-top: 1em solid rgb(255, 230, 232);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XekQ7zrjHzzDhMjBcDLpv7dNzkQA0uic7xEtODvK7iaY3IxgVF46CNhGWw.jpeg" data-ratio="2.171875" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;font-size: 13px;box-sizing: border-box;"><section class="" style="display: inline-block;vertical-align: top;box-sizing: border-box;"><section style="display: inline-block;vertical-align: top;line-height: 1em;box-sizing: border-box;"><section style="width: 0px;margin-right: -0.5em;display: inline-block;vertical-align: top;border-top: 1em solid rgb(255, 126, 145);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section><section style="width: 0px;display: inline-block;vertical-align: top;border-bottom: 1em solid rgb(255, 230, 232);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section></section><section class="" style="display: inline-block;vertical-align: top;line-height: 1em;padding-left: 6px;padding-right: 6px;color: rgba(246, 134, 164, 0.83);font-size: 14px;box-sizing: border-box;"><p style="box-sizing: border-box;">步骤</p></section><section style="display: inline-block;vertical-align: top;line-height: 1em;box-sizing: border-box;"><section style="width: 0px;display: inline-block;vertical-align: top;margin-right: -0.5em;border-bottom: 1em solid rgb(255, 126, 145);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section><section style="width: 0px;display: inline-block;vertical-align: top;border-top: 1em solid rgb(255, 230, 232);border-left: 0.65em solid transparent;border-right: 0.65em solid transparent;box-sizing: border-box;"></section></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 0.5em auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15Xe4Blq2GTmUkZY0eel9oRgBnpQgSbo81KoPsIvls5JvXwEou9A8AibLNg.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-right: 0%;margin-bottom: 40px;margin-left: 0%;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">把小青菜用清水冲洗干净，注意缝隙里也洗干净。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeD9TNJfcqITicic3ayy0KsutmGlcoVbZ0Riaxl93uM8hAZtjCwZbaVDnfg.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 10px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">切掉叶子。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 0.5em auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15Xer5ez1VpIdxBgaldialpoNEcmaCpPibOvdeFsWGThoaKqGwwZYo8NfBUg.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">再把中间的芯儿挖空。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeLvXicDVHKU5foSUO28cnV1sy00eHQV9iaXGtJHItQOo6dlDBrqe3qNcw.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">红彩椒、黄彩椒、香菇、青菜叶子、胡萝卜分别切碎。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeAsI7gF2vLebLW9woa1Jl4Fd5iawRqbG2icYq2dFsDsuT0ZGnlxLX3NhA.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">2大勺生抽，1大勺米醋，1小勺芝麻香油，1小勺白糖，2克盐，1小勺玉米淀粉，1小勺蒜末，1小勺辣椒粉，混合搅拌均匀。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeprKJzPlJT7Xc4GSeT9R4kmEGggQVBmgBSXEJvEluD8kJssVZbI9wHQ.gif" data-ratio="0.5633333" data-w="600" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">炒锅倒油烧热，放入切碎的鸡胸肉，炒到变色。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeMUdCLf3DAlSQqomDgnYIFTGUugMKmGhuNwxKh19icYNk8JicorS7oeNQ.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">再放入之前切好的蔬菜碎。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15Xezrvic0Osyf1EvibsggunYII6d06Z4fB4JQqqX0GLiclQoArFMstHGT7Iw.gif" data-ratio="0.5633333" data-w="600" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">倒入调好的料汁，翻炒均匀，烧到8分熟。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeNWaLdfs4YmXYDHFIfuYicEVkJ0YGibKflkQDuMjnZSrGCSb9HRh2xiaxg.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">舀到之前准备好的青菜钵里。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeQWQyn3Yclys0cRFdoJu2q5hWSkDnt9Aot71VZWiamM5eBqXgsYrrsPw.gif" data-ratio="0.5633333" data-w="600" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;line-height: 0.8;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;border-bottom: 0.8em solid rgb(255, 225, 231);border-left: 0.7em solid transparent !important;border-right: 0.7em solid transparent !important;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">放入水开了的蒸锅里，中火蒸10分钟左右。</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 8px;margin-right: auto;margin-left: auto;text-align: center;box-sizing: border-box;"><img style="border-radius: 1em;width: 85%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XebqfvyxKQTiaqFh7qh6hbrM91MDDbQKFypjia253GQ0nCrIFxwIfiaRCVA.jpeg" data-ratio="0.5996094" data-w="1024" width="85%" data-type="gif"  /></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin: 20px 0% 40px;box-sizing: border-box;"><section class="" style="font-size: 14px;line-height: 2;letter-spacing: 1px;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">一盘热气腾腾、颜色漂亮的蔬菜钵就做好了~</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;box-sizing: border-box;"><section class="" style="line-height: 1.5em;border-width: 2px;border-style: solid;border-color: rgb(255, 225, 231);border-radius: 0.8em;box-sizing: border-box;"><section style="padding-top: 10px;padding-right: 10px;padding-left: 10px;box-sizing: border-box;"><section style="width: 0.5em;height: 0.5em;float: left;border-radius: 100%;background-color: rgb(255, 225, 231);box-sizing: border-box;"></section><section style="width: 0.5em;height: 0.5em;float: right;border-radius: 100%;background-color: rgb(255, 225, 231);box-sizing: border-box;"></section><section style="clear: both;box-sizing: border-box;"></section></section><section class="" style="padding: 10px;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="text-align: center;font-size: 14px;letter-spacing: 1px;line-height: 2;padding-right: 25px;padding-left: 25px;box-sizing: border-box;"><p style="box-sizing: border-box;">你还可以在对话框输入：<span style="color: rgb(255, 255, 255);background-color: rgb(255, 133, 133);box-sizing: border-box;">&nbsp; &nbsp;蔬菜&nbsp; &nbsp;</span></p><p style="box-sizing: border-box;">看看回复里更多简单又好吃的菜谱</p></section></section></section></section><section style="padding-right: 10px;padding-bottom: 10px;padding-left: 10px;box-sizing: border-box;"><section style="width: 0.5em;height: 0.5em;float: left;border-radius: 100%;background-color: rgb(255, 225, 231);box-sizing: border-box;"></section><section style="width: 0.5em;height: 0.5em;float: right;border-radius: 100%;background-color: rgb(255, 225, 231);box-sizing: border-box;"></section><section style="clear: both;box-sizing: border-box;"></section></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 10px;margin-bottom: 10px;text-align: center;opacity: 0.6;font-size: 10px;box-sizing: border-box;"><section class="" style="display: inline-block;vertical-align: middle;padding: 5px;box-sizing: border-box;"><section style="display: inline-block;vertical-align: middle;width: 1.2em;height: 1.2em;border-width: 2px;border-style: solid;border-color: rgb(255, 133, 133);transform: rotate(45deg);box-sizing: border-box;"></section><section style="display: inline-block;vertical-align: middle;width: 1.2em;height: 1.2em;border-width: 2px;border-style: solid;border-color: rgb(255, 133, 133);margin-left: -0.5em;transform: rotate(45deg);background-color: rgb(255, 133, 133);box-sizing: border-box;"></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-right: 0%;margin-left: 0%;transform: translate3d(0px, 0px, 0px);text-align: center;box-sizing: border-box;"><section class="" style="display: inline-block;width: 98%;vertical-align: top;background-color: rgb(254, 255, 255);box-shadow: rgb(116, 116, 116) 0px 0px 0px;padding: 10px;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="transform: translate3d(0px, 0px, 0px);-webkit-transform: translate3d(0px, 0px, 0px);-moz-transform: translate3d(0px, 0px, 0px);-o-transform: translate3d(0px, 0px, 0px);font-size: 14px;box-sizing: border-box;"><section class="" style="display: inline-block;width: 90%;vertical-align: top;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="group-empty" style="display: inline-block;width: 100%;vertical-align: top;box-sizing: border-box;"></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 5px;margin-right: 0%;margin-left: 0%;box-sizing: border-box;"><section class="" style="font-size: 16px;letter-spacing: 15px;line-height: 1;box-sizing: border-box;"><p style="box-sizing: border-box;"><strong style="box-sizing: border-box;">&nbsp;小</strong><strong style="box-sizing: border-box;">·羽·私·厨</strong></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 5px;margin-right: 0%;margin-left: 0%;box-sizing: border-box;"><section class="" style="text-align: left;font-size: 16px;letter-spacing: 0.5px;box-sizing: border-box;"><p style="text-align: center;box-sizing: border-box;">&nbsp;想都是问题 吃才是答案</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="font-size: 12px;box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="display: inline-block;vertical-align: middle;width: 33.33%;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-right: 0%;margin-left: 0%;box-sizing: border-box;"><section class="" style="text-align: right;font-size: 21px;color: rgba(11, 1, 1, 0.86);letter-spacing: 0px;box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 0.5em;margin-bottom: 0.5em;box-sizing: border-box;"><section class="" style="background-color: rgb(160, 160, 160);height: 1px;box-sizing: border-box;"></section></section></section></section><section class="" style="display: inline-block;vertical-align: middle;width: 33.33%;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-right: 0%;margin-left: 0%;box-sizing: border-box;"><img style="vertical-align: middle;box-shadow: rgb(124, 125, 126) 0px 0px 0px;width: 100%;box-sizing: border-box;" class="" src="./image/Qp7fCJoHWmxcB528NKGXwDhdUGgic15XeXnObwicVlZxw8w9pmvgdD2OralsjPI9lMtA4CPkPwa1ImThO0bPwBeA.jpeg" data-ratio="1" data-w="344" width="100%" data-type="jpeg"  /></section></section></section><section class="" style="display: inline-block;vertical-align: middle;width: 33.33%;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-right: 0%;margin-left: 0%;box-sizing: border-box;"><section class="" style="font-size: 21px;color: rgba(11, 1, 1, 0.86);letter-spacing: 0px;box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 0.5em;margin-bottom: 0.5em;box-sizing: border-box;"><section class="" style="background-color: rgb(160, 160, 160);height: 1px;box-sizing: border-box;"></section></section></section></section></section></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="font-size: 12px;box-sizing: border-box;"><p style="box-sizing: border-box;">简单 | 靠谱 | 好吃</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-right: 0%;margin-left: 0%;box-sizing: border-box;"><section class="" style="font-size: 10px;box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p><p style="box-sizing: border-box;"><strong style="letter-spacing: 0px;box-sizing: border-box;">长按并识别上面的二维码关注我们吧</strong><br style="box-sizing: border-box;"  /></p></section></section></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-top: 0.5em;margin-bottom: 0.5em;padding-left: 0.8em;padding-right: 0.8em;box-sizing: border-box;"><section class="" style="width: 2.5em;height: 2.5em;margin-right: -0.8em;margin-bottom: -2em;float: right;background-color: rgb(254, 255, 255);box-sizing: border-box;"><section style="transform: rotate(-45deg);-webkit-transform: rotate(-45deg);-moz-transform: rotate(-45deg);-o-transform: rotate(-45deg);transform-origin: 100% center 0px;-webkit-transform-origin: 100% center 0px;-moz-transform-origin: 100% center 0px;-o-transform-origin: 100% center 0px;box-sizing: border-box;"><section style="width: 2.5em;height: 2px;margin-right: -1em;background-color: rgb(255, 225, 231);box-sizing: border-box;"></section></section></section><section class="" style="clear: both;box-sizing: border-box;"></section><section class="" style="border-width: 2px;border-style: solid;border-color: rgb(255, 225, 231);padding: 20px 10px;box-sizing: border-box;"><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="text-align: center;font-size: 14px;line-height: 2;letter-spacing: 1px;box-sizing: border-box;"><p style="clear: none;box-sizing: border-box;">你喜欢吃什么<span style="color: rgb(255, 133, 133);box-sizing: border-box;"><strong style="box-sizing: border-box;">特色蔬菜</strong></span></p><p style="clear: none;box-sizing: border-box;">在下面的留言区聊聊吧</p><p style="clear: none;box-sizing: border-box;">我学会了就做给你吃啊</p></section></section></section></section><section class="" style="width: 2.5em;height: 2.5em;margin-top: -2em;margin-left: -0.8em;background-color: rgb(254, 255, 255);box-sizing: border-box;"><section style="transform: rotate(-45deg);-webkit-transform: rotate(-45deg);-moz-transform: rotate(-45deg);-o-transform: rotate(-45deg);transform-origin: 100% center 0px;-webkit-transform-origin: 100% center 0px;-moz-transform-origin: 100% center 0px;-o-transform-origin: 100% center 0px;box-sizing: border-box;"><section style="width: 2.5em;height: 2px;margin-left: -1em;background-color: rgb(255, 225, 231);box-sizing: border-box;"></section></section></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="box-sizing: border-box;"><p style="box-sizing: border-box;"><br style="box-sizing: border-box;"  /></p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="box-sizing: border-box;"><section class="" style="border-bottom: 2px solid rgb(255, 225, 231);font-size: 14px;line-height: 2;letter-spacing: 1px;box-sizing: border-box;"><p style="box-sizing: border-box;">看饿了？点个赞吧~</p></section></section></section><section class="Powered-by-XIUMI V5" style="box-sizing: border-box;" powered-by="xiumi.us"><section class="" style="margin-left: 8%;margin-right: 8%;line-height: 1.1em;font-size: 13px;box-sizing: border-box;"><section class="" style="width: 0px;display: inline-block;vertical-align: top;border-top: 1em solid rgb(255, 225, 231);border-left: 0.8em solid transparent !important;border-right: 0.8em solid transparent !important;box-sizing: border-box;"></section></section></section></section>', 0, 1507614889);

-- --------------------------------------------------------

--
-- 表的结构 `cool_wdjsetting`
--

CREATE TABLE IF NOT EXISTS `cool_wdjsetting` (
  `wid` int(11) NOT NULL,
  `adpic` varchar(255) DEFAULT NULL,
  `adposition` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cool_wx_img`
--

CREATE TABLE IF NOT EXISTS `cool_wx_img` (
  `id` int(11) NOT NULL COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `desc` text NOT NULL COMMENT '简介',
  `pic` char(255) NOT NULL COMMENT '封面图片',
  `url` char(255) NOT NULL COMMENT '图文外链地址',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `title` varchar(60) NOT NULL COMMENT '标题'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='微信图文';

--
-- 转存表中的数据 `cool_wx_img`
--

INSERT INTO `cool_wx_img` (`id`, `keyword`, `desc`, `pic`, `url`, `createtime`, `uptatetime`, `title`) VALUES
(3, '手册', '手册', '', 'https://www.kancloud.cn/chichu/cltphp', '1487645725', '', '手册');

-- --------------------------------------------------------

--
-- 表的结构 `cool_wx_keyword`
--

CREATE TABLE IF NOT EXISTS `cool_wx_keyword` (
  `id` int(11) NOT NULL COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `pid` int(11) NOT NULL COMMENT '对应表ID',
  `type` varchar(30) DEFAULT 'TEXT' COMMENT '关键词操作类型'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_wx_keyword`
--

INSERT INTO `cool_wx_keyword` (`id`, `keyword`, `pid`, `type`) VALUES
(5, '早上好！', 5, 'TEXT'),
(8, '手册', 3, 'IMG'),
(9, 'hahah', 6, 'TEXT');

-- --------------------------------------------------------

--
-- 表的结构 `cool_wx_menu`
--

CREATE TABLE IF NOT EXISTS `cool_wx_menu` (
  `id` int(11) NOT NULL COMMENT 'id',
  `open` tinyint(1) DEFAULT '1' COMMENT '状态',
  `pid` int(11) DEFAULT '0' COMMENT '上级菜单',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `listorder` int(5) DEFAULT '0' COMMENT '排序',
  `type` varchar(20) DEFAULT '' COMMENT 'view/click',
  `value` varchar(255) DEFAULT NULL COMMENT 'value',
  `token` varchar(50) NOT NULL COMMENT 'token'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cool_wx_menu`
--

INSERT INTO `cool_wx_menu` (`id`, `open`, `pid`, `name`, `listorder`, `type`, `value`, `token`) VALUES
(1, 1, 0, '官网', 1, 'view', 'http://www.hrbkcwl.com', 'eesops1462769263'),
(2, 1, 0, '活动', 2, 'view', 'http://www.rabbitpre.com/m/jAV7NbH?lc=4&sui=OtX2Z8HD&from=timeline&isappinstalled=0#from=share', 'eesops1462769263');

-- --------------------------------------------------------

--
-- 表的结构 `cool_wx_news`
--

CREATE TABLE IF NOT EXISTS `cool_wx_news` (
  `id` int(11) NOT NULL COMMENT '表id',
  `keyword` char(255) NOT NULL COMMENT 'keyword',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `uptatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `img_id` varchar(50) DEFAULT NULL COMMENT '图文组合id'
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='微信图文';

--
-- 转存表中的数据 `cool_wx_news`
--

INSERT INTO `cool_wx_news` (`id`, `keyword`, `createtime`, `uptatetime`, `img_id`) VALUES
(22, '测试信息', '1489046272', '', '3,1'),
(23, '你好', '1501214515', '', '1,3');

-- --------------------------------------------------------

--
-- 表的结构 `cool_wx_text`
--

CREATE TABLE IF NOT EXISTS `cool_wx_text` (
  `id` int(11) NOT NULL COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `uname` varchar(90) NOT NULL COMMENT '用户名',
  `keyword` char(255) NOT NULL COMMENT '关键词',
  `precisions` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'precisions',
  `text` text NOT NULL COMMENT 'text',
  `createtime` varchar(13) NOT NULL COMMENT '创建时间',
  `updatetime` varchar(13) NOT NULL COMMENT '更新时间',
  `click` int(11) NOT NULL COMMENT '点击'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='文本回复表';

--
-- 转存表中的数据 `cool_wx_text`
--

INSERT INTO `cool_wx_text` (`id`, `uid`, `uname`, `keyword`, `precisions`, `text`, `createtime`, `updatetime`, `click`) VALUES
(5, 0, '', '早上好！', 0, '早上好！', '1487238755', '1487317308', 0),
(6, 0, '', 'hahah', 0, 'hahahah', '1504235720', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cool_wx_user`
--

CREATE TABLE IF NOT EXISTS `cool_wx_user` (
  `id` int(11) NOT NULL COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) NOT NULL COMMENT '网页授权token',
  `web_refresh_token` varchar(200) NOT NULL COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入',
  `concern` varchar(225) DEFAULT '' COMMENT '关注回复',
  `default` varchar(225) DEFAULT '' COMMENT '默认回复'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

--
-- 转存表中的数据 `cool_wx_user`
--

INSERT INTO `cool_wx_user` (`id`, `uid`, `wxname`, `aeskey`, `encode`, `appid`, `appsecret`, `wxid`, `weixin`, `token`, `w_token`, `create_time`, `updatetime`, `tplcontentid`, `share_ticket`, `share_dated`, `authorizer_access_token`, `authorizer_refresh_token`, `authorizer_expires`, `type`, `web_access_token`, `web_refresh_token`, `web_expires`, `menu_config`, `wait_access`, `concern`, `default`) VALUES
(1, 0, '哈尔滨酷创网络科技有限公司', '', 0, 'wxb8fe07bca5490fbf', '7a1e64d6117f52046d2f1ec005d64ddc', 'gh_6ae849722753', 'hrbkcwl', 'sdfdsfdsfdsf', 'coolphp', 0, 0, '', '', '', '', '', '', 4, 'rD1xDK2wSWG0GHvZXDx_y0M0ELpXKreoLc90SNdc3bAQRh4cgv9o6B3QDFNCAPCfSeFYXFoSUH-_wMIYtbqOjRzk502DszaBV4faVsGG5zzKVqJQegf3KUeRVOYOOKEZFIQfACAVYG', '', 1507614125, '0', 1, '欢迎来到酷创网络~', '亲！您可以输入关键词来获取您想要知道的内容。（例：关于我们）');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cool_ad`
--
ALTER TABLE `cool_ad`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `plug_ad_adtypeid` (`type_id`);

--
-- Indexes for table `cool_admin`
--
ALTER TABLE `cool_admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD KEY `admin_username` (`username`);

--
-- Indexes for table `cool_ad_type`
--
ALTER TABLE `cool_ad_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `cool_article`
--
ALTER TABLE `cool_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`listorder`),
  ADD KEY `catid` (`id`,`catid`,`status`),
  ADD KEY `listorder` (`id`,`catid`,`status`,`listorder`);

--
-- Indexes for table `cool_auth_group`
--
ALTER TABLE `cool_auth_group`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `cool_auth_rule`
--
ALTER TABLE `cool_auth_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_blog`
--
ALTER TABLE `cool_blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`listorder`),
  ADD KEY `catid` (`id`,`catid`,`status`),
  ADD KEY `listorder` (`id`,`catid`,`status`,`listorder`);

--
-- Indexes for table `cool_case`
--
ALTER TABLE `cool_case`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`listorder`),
  ADD KEY `catid` (`id`,`catid`,`status`),
  ADD KEY `listorder` (`id`,`catid`,`status`,`listorder`);

--
-- Indexes for table `cool_category`
--
ALTER TABLE `cool_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentid` (`parentid`),
  ADD KEY `listorder` (`listorder`);

--
-- Indexes for table `cool_config`
--
ALTER TABLE `cool_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_debris`
--
ALTER TABLE `cool_debris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_debris_type`
--
ALTER TABLE `cool_debris_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_donation`
--
ALTER TABLE `cool_donation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_field`
--
ALTER TABLE `cool_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_fuwukehu`
--
ALTER TABLE `cool_fuwukehu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`listorder`),
  ADD KEY `catid` (`id`,`catid`,`status`),
  ADD KEY `listorder` (`id`,`catid`,`status`,`listorder`);

--
-- Indexes for table `cool_link`
--
ALTER TABLE `cool_link`
  ADD PRIMARY KEY (`link_id`);

--
-- Indexes for table `cool_message`
--
ALTER TABLE `cool_message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `cool_module`
--
ALTER TABLE `cool_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_order`
--
ALTER TABLE `cool_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sn` (`sn`);

--
-- Indexes for table `cool_page`
--
ALTER TABLE `cool_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_picture`
--
ALTER TABLE `cool_picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`listorder`),
  ADD KEY `catid` (`id`,`catid`,`status`),
  ADD KEY `listorder` (`id`,`catid`,`status`,`listorder`);

--
-- Indexes for table `cool_posid`
--
ALTER TABLE `cool_posid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_product`
--
ALTER TABLE `cool_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`listorder`),
  ADD KEY `catid` (`id`,`catid`,`status`),
  ADD KEY `listorder` (`id`,`catid`,`status`,`listorder`);

--
-- Indexes for table `cool_region`
--
ALTER TABLE `cool_region`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_role`
--
ALTER TABLE `cool_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `cool_role_user`
--
ALTER TABLE `cool_role_user`
  ADD KEY `group_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cool_service`
--
ALTER TABLE `cool_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`id`,`status`,`listorder`),
  ADD KEY `catid` (`id`,`catid`,`status`),
  ADD KEY `listorder` (`id`,`catid`,`status`,`listorder`);

--
-- Indexes for table `cool_sys`
--
ALTER TABLE `cool_sys`
  ADD PRIMARY KEY (`sys_id`);

--
-- Indexes for table `cool_system`
--
ALTER TABLE `cool_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_users`
--
ALTER TABLE `cool_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `cool_user_level`
--
ALTER TABLE `cool_user_level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `cool_visit_day`
--
ALTER TABLE `cool_visit_day`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_visit_detail`
--
ALTER TABLE `cool_visit_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_visit_summary`
--
ALTER TABLE `cool_visit_summary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_wdjcontent`
--
ALTER TABLE `cool_wdjcontent`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `cool_wdjsetting`
--
ALTER TABLE `cool_wdjsetting`
  ADD PRIMARY KEY (`wid`);

--
-- Indexes for table `cool_wx_img`
--
ALTER TABLE `cool_wx_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_wx_keyword`
--
ALTER TABLE `cool_wx_keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `cool_wx_menu`
--
ALTER TABLE `cool_wx_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_wx_news`
--
ALTER TABLE `cool_wx_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cool_wx_text`
--
ALTER TABLE `cool_wx_text`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `cool_wx_user`
--
ALTER TABLE `cool_wx_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uid_2` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cool_ad`
--
ALTER TABLE `cool_ad`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `cool_admin`
--
ALTER TABLE `cool_admin`
  MODIFY `admin_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `cool_ad_type`
--
ALTER TABLE `cool_ad_type`
  MODIFY `type_id` tinyint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cool_article`
--
ALTER TABLE `cool_article`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `cool_auth_group`
--
ALTER TABLE `cool_auth_group`
  MODIFY `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '全新ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cool_auth_rule`
--
ALTER TABLE `cool_auth_rule`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=276;
--
-- AUTO_INCREMENT for table `cool_blog`
--
ALTER TABLE `cool_blog`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cool_case`
--
ALTER TABLE `cool_case`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `cool_category`
--
ALTER TABLE `cool_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `cool_config`
--
ALTER TABLE `cool_config`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=89;
--
-- AUTO_INCREMENT for table `cool_debris`
--
ALTER TABLE `cool_debris`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `cool_debris_type`
--
ALTER TABLE `cool_debris_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cool_donation`
--
ALTER TABLE `cool_donation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `cool_field`
--
ALTER TABLE `cool_field`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=157;
--
-- AUTO_INCREMENT for table `cool_fuwukehu`
--
ALTER TABLE `cool_fuwukehu`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cool_link`
--
ALTER TABLE `cool_link`
  MODIFY `link_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `cool_message`
--
ALTER TABLE `cool_message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `cool_module`
--
ALTER TABLE `cool_module`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `cool_order`
--
ALTER TABLE `cool_order`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cool_page`
--
ALTER TABLE `cool_page`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `cool_picture`
--
ALTER TABLE `cool_picture`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `cool_posid`
--
ALTER TABLE `cool_posid`
  MODIFY `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cool_product`
--
ALTER TABLE `cool_product`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cool_region`
--
ALTER TABLE `cool_region`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3726;
--
-- AUTO_INCREMENT for table `cool_role`
--
ALTER TABLE `cool_role`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cool_service`
--
ALTER TABLE `cool_service`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `cool_users`
--
ALTER TABLE `cool_users`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=2596;
--
-- AUTO_INCREMENT for table `cool_user_level`
--
ALTER TABLE `cool_user_level`
  MODIFY `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `cool_visit_day`
--
ALTER TABLE `cool_visit_day`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `cool_visit_detail`
--
ALTER TABLE `cool_visit_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `cool_visit_summary`
--
ALTER TABLE `cool_visit_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cool_wdjcontent`
--
ALTER TABLE `cool_wdjcontent`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `cool_wdjsetting`
--
ALTER TABLE `cool_wdjsetting`
  MODIFY `wid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cool_wx_img`
--
ALTER TABLE `cool_wx_img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `cool_wx_keyword`
--
ALTER TABLE `cool_wx_keyword`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cool_wx_menu`
--
ALTER TABLE `cool_wx_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `cool_wx_news`
--
ALTER TABLE `cool_wx_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `cool_wx_text`
--
ALTER TABLE `cool_wx_text`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cool_wx_user`
--
ALTER TABLE `cool_wx_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
