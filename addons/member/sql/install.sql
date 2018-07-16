INSERT INTO `db_strongarmynet`.`cool_menu` (`id`, `href`, `title`, `type`, `status`, `authopen`, `icon`, `condition`, `pid`, `sort`, `addtime`, `zt`, `menustatus`, `catid`, `aid`, `roleid`) VALUES ('2048', '/addons_execute_member-setting-index', '会员设置', '1', '1', '1', '', '', '2040', '0', '1530783109', NULL, '1', NULL, '77', '1,2');INSERT INTO `db_strongarmynet`.`cool_menu` (`id`, `href`, `title`, `type`, `status`, `authopen`, `icon`, `condition`, `pid`, `sort`, `addtime`, `zt`, `menustatus`, `catid`, `aid`, `roleid`) VALUES ('2047', '/addons_execute_member-member-index', '会员管理', '1', '1', '1', '', '', '2040', '0', '1530783109', NULL, '1', NULL, '77', '1,2');DROP TABLE IF EXISTS `cool_member_oirganization`;CREATE TABLE `cool_member_oirganization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0',
  `child` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `addtime` int(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ochild` (`child`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;DROP TABLE IF EXISTS `cool_member_setting`;CREATE TABLE `cool_member_setting` (
  `id` int(11) NOT NULL,
  `regset` text NOT NULL,
  `loginset` text NOT NULL,
  `is_state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;INSERT INTO `cool_member_setting` VALUES ('1', '', '', '0');DROP TABLE IF EXISTS `cool_member`;CREATE TABLE `cool_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `certificate` int(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `other` text NOT NULL,
  `addtime` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
